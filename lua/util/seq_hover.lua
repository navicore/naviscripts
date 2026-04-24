-- Pinned hover/diagnostic panel for seq (and anything that wires it up).
-- Toggle with M.toggle(bufnr). While on, a floating window is anchored to the
-- top-right corner of the editor and refreshes on CursorHold with the LSP
-- hover result plus any diagnostics on the current line.
--
-- The window is focusable=false, so it never steals focus, and noautocmd=true,
-- so creating it does not trigger other plugins' Buf* autocmds.

local M = {}

local state = {
  win = nil,
  buf = nil,
  augroup = nil,
  src_bufnr = nil,
}

local function win_valid()
  return state.win ~= nil and vim.api.nvim_win_is_valid(state.win)
end

local function ensure_buf()
  if state.buf and vim.api.nvim_buf_is_valid(state.buf) then
    return state.buf
  end
  state.buf = vim.api.nvim_create_buf(false, true)
  vim.bo[state.buf].buftype = "nofile"
  vim.bo[state.buf].bufhidden = "hide"
  vim.bo[state.buf].swapfile = false
  vim.bo[state.buf].filetype = "markdown"
  return state.buf
end

local function win_config()
  local width = math.min(60, math.max(30, math.floor(vim.o.columns * 0.35)))
  local height = math.min(20, math.max(8, math.floor(vim.o.lines * 0.35)))
  return {
    relative = "editor",
    anchor = "NE",
    row = 1,
    col = vim.o.columns,
    width = width,
    height = height,
    style = "minimal",
    border = "rounded",
    focusable = false,
    noautocmd = true,
    zindex = 40,
    title = " seq info ",
    title_pos = "left",
  }
end

local function open_window()
  local buf = ensure_buf()
  local cfg = win_config()
  if win_valid() then
    vim.api.nvim_win_set_config(state.win, cfg)
    return
  end
  state.win = vim.api.nvim_open_win(buf, false, cfg)
  vim.wo[state.win].wrap = true
  vim.wo[state.win].linebreak = true
  vim.wo[state.win].conceallevel = 2
  vim.wo[state.win].winhl = "Normal:NormalFloat,FloatBorder:FloatBorder"
end

local function close_window()
  if win_valid() then
    pcall(vim.api.nvim_win_close, state.win, true)
  end
  state.win = nil
end

local function set_lines(lines)
  local buf = ensure_buf()
  vim.bo[buf].modifiable = true
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
  vim.bo[buf].modifiable = false
end

local severity_label = { "ERROR", "WARN", "INFO", "HINT" }

local function collect_diagnostics(src_bufnr)
  local out = {}
  local cur_line = vim.api.nvim_win_get_cursor(0)[1] - 1
  local diags = vim.diagnostic.get(src_bufnr, { lnum = cur_line })
  if #diags == 0 then
    return out
  end
  table.insert(out, "### diagnostics")
  for _, d in ipairs(diags) do
    local sev = severity_label[d.severity] or "?"
    for _, line in ipairs(vim.split(d.message or "", "\n", { plain = true })) do
      table.insert(out, string.format("- [%s] %s", sev, line))
    end
  end
  return out
end

local function render(src_bufnr)
  if not win_valid() then
    return
  end
  if not vim.api.nvim_buf_is_valid(src_bufnr) then
    return
  end

  local diag_lines = collect_diagnostics(src_bufnr)

  local clients = vim.lsp.get_clients({ bufnr = src_bufnr, method = "textDocument/hover" })
  if #clients == 0 then
    if #diag_lines == 0 then
      set_lines({ "*(no LSP client with hover)*" })
    else
      set_lines(diag_lines)
    end
    return
  end

  local encoding = clients[1].offset_encoding or "utf-16"
  local params = vim.lsp.util.make_position_params(0, encoding)

  vim.lsp.buf_request(src_bufnr, "textDocument/hover", params, function(_, result)
    if not win_valid() then
      return
    end
    local lines = {}
    for _, l in ipairs(diag_lines) do
      table.insert(lines, l)
    end
    local hover_lines = {}
    if result and result.contents then
      hover_lines = vim.lsp.util.convert_input_to_markdown_lines(result.contents)
    end
    if #hover_lines > 0 then
      if #lines > 0 then
        table.insert(lines, "")
      end
      table.insert(lines, "### hover")
      for _, l in ipairs(hover_lines) do
        table.insert(lines, l)
      end
    end
    if #lines == 0 then
      lines = { "*(no info at cursor)*" }
    end
    set_lines(lines)
  end)
end

function M.enable(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  state.src_bufnr = bufnr
  open_window()

  state.augroup = vim.api.nvim_create_augroup("SeqHoverPin", { clear = true })

  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    group = state.augroup,
    buffer = bufnr,
    callback = function(ev)
      render(ev.buf)
    end,
  })

  -- Blank the panel as soon as the cursor moves, so stale info is not shown
  -- between moves. CursorHold will repopulate once the cursor settles.
  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    group = state.augroup,
    buffer = bufnr,
    callback = function()
      if win_valid() then
        set_lines({ "…" })
      end
    end,
  })

  vim.api.nvim_create_autocmd("VimResized", {
    group = state.augroup,
    callback = function()
      if win_valid() then
        vim.api.nvim_win_set_config(state.win, win_config())
      end
    end,
  })

  vim.api.nvim_create_autocmd({ "BufWipeout", "BufDelete" }, {
    group = state.augroup,
    buffer = bufnr,
    callback = function()
      M.disable()
    end,
  })

  render(bufnr)
end

function M.disable()
  if state.augroup then
    pcall(vim.api.nvim_del_augroup_by_id, state.augroup)
    state.augroup = nil
  end
  close_window()
  state.src_bufnr = nil
end

function M.toggle(bufnr)
  if win_valid() then
    M.disable()
  else
    M.enable(bufnr)
  end
end

vim.api.nvim_create_user_command("SeqHoverToggle", function()
  M.toggle()
end, { desc = "Toggle pinned LSP hover panel" })

return M

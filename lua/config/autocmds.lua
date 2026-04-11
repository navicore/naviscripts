-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Neovim's bundled ftplugin/rust.vim defines :RustFmt and :RustFmtRange that
-- call the legacy `rust.vim` rustfmt#Format() path. That path is broken in
-- Neovim 0.12.1 (Vim upstream regression in autoload/rustfmt.vim, Jan 2026):
-- it emits `--write-mode=display` which modern rustfmt rejects with
-- "Unrecognized option: 'write-mode'". We do formatting via conform.nvim
-- (format_on_save) and rust-analyzer, so these commands are dead weight and
-- a debugging trap. Delete them on every rust buffer.
vim.api.nvim_create_autocmd("FileType", {
  pattern = "rust",
  callback = function(ev)
    pcall(vim.api.nvim_buf_del_user_command, ev.buf, "RustFmt")
    pcall(vim.api.nvim_buf_del_user_command, ev.buf, "RustFmtRange")
  end,
})

-- csvview.nvim does not auto-enable on csv/tsv open by design — author's
-- recommended flow is explicit :CsvViewToggle. We prefer the aligned view
-- always-on for csv/tsv buffers. csv.lua's `ft` trigger loads the plugin
-- before this autocmd runs, so the Lua API is available.
--
-- Guard rationale: lazy.nvim's ft trigger re-fires FileType via doautocmd
-- after loading the plugin (so the freshly loaded plugin's own ftplugins
-- run for the triggering buffer). That makes THIS autocmd fire twice on
-- the first csv/tsv open. csvview.enable() is also *asynchronous* — it
-- starts metrics computation in a callback and only registers the view
-- (and flips is_enabled=true) after that callback completes. So during
-- the re-fire window, a naive is_enabled() check returns false both times,
-- two enable()s kick off in parallel, and the second one hits csvview's
-- internal "already attached" warning in view.lua:350 because by the time
-- the second async callback runs, the first has registered the view.
--
-- Fix: track our own "we've already called enable" state on the buffer.
-- Set the flag *before* calling enable(), so a re-entry before the async
-- attach completes still short-circuits. The flag auto-cleans when the
-- buffer is wiped.
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "csv", "tsv" },
  callback = function(ev)
    if vim.b[ev.buf].my_csvview_enabled then
      return
    end
    vim.b[ev.buf].my_csvview_enabled = true
    require('csvview').enable(ev.buf)
  end,
})

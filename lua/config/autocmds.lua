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

-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- vim.o.guifont = "RecMonoLinear Nerd Font Mono,Symbols Nerd Font Mono:h11"
vim.o.guifont = "FantasqueSansM Nerd Font Mono,Symbols Nerd Font Mono:h14"
if vim.g.neovide then
  vim.g.neovide_transparency = 0.85
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_fullscreen = false
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_profiler = false
  vim.g.neovide_cursor_vfx_mode = "wireframe"
end
if not vim.env.SSH_TTY then
  vim.opt.clipboard = "unnamedplus" -- sync with system clipboard
end

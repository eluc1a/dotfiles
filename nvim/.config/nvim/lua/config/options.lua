-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Force true color support
if vim.fn.has("termguicolors") == 1 then
  vim.o.termguicolors = true

  -- Force true color escape sequences for VSCode terminal
  if os.getenv("VSCODE_GIT_ASKPASS_NODE") or os.getenv("VSCODE_GIT_IPC_HANDLE") then
    vim.cmd([[
      let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
      let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    ]])
  end
end

vim.opt.relativenumber = false
vim.opt.number = true

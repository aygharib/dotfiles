-- Setup lazy.nvim, a modern plugin manager for Neovim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("config.options")
require("lazy").setup("plugins")

vim.api.nvim_set_keymap('n', '<leader>rs', ':LspStop<CR>:LspStart<CR>', { noremap = true, silent = true })

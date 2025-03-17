-- lua/config/options.lua

-- Leader key
vim.g.mapleader = " "

-- Line numbers
vim.wo.number = true

-- Tab and indentation settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Pane navigation
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>', { silent = true })
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>', { silent = true })
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>', { silent = true })
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>', { silent = true })

-- Clear search highlight
vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>', { silent = true })

-- Setup some stuff 
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set cursorline")

vim.cmd("nnoremap <c>d <c>dzz")
vim.cmd("nnoremap <c>u <c>uzz")

-- Set leader:
vim.g.mapleader = " "

-- Relative line numbers:
vim.opt.relativenumber = true

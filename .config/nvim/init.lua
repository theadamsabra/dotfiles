-- Install package manager:
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- Shim removed in Neovim 0.11, still called by Telescope's previewer
if not vim.treesitter.language.ft_to_lang then
  vim.treesitter.language.ft_to_lang = vim.treesitter.language.get_lang
end

-- Setup:
require("vim-config")
require("lazy").setup("plugins")

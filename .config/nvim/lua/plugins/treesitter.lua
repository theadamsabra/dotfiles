return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = {"lua", "python", "markdown"},
    highlight = {enable = true},
    indent = {enable = true}
  }
}

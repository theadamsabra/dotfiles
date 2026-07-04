return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim'},
  config = function()
    -- vim.F.if_nil removed in nvim 0.12, vim.nonnil doesn't exist; patch before any finder runs
    local tu = require("telescope.utils")
    if not tu.if_nil then
      tu.if_nil = function(a, b) return a ~= nil and a or b end
    end

    local builtin = require("telescope.builtin")
    vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

    -- Allow for hidden files
    -- https://stackoverflow.com/questions/71809098/how-to-include-specific-hidden-file-folder-in-search-result-when-using-telescope/76991432#76991432
    require('telescope').setup({
      defaults = {
        -- configure to use ripgrep
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search
          -- Exclude some patterns from search
          "--glob=!**/.git/*",
          "--glob=!**/.idea/*",
          "--glob=!**/.vscode/*",
          "--glob=!**/build/*",
          "--glob=!**/dist/*",
          "--glob=!**/yarn.lock",
          "--glob=!**/package-lock.json",
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      }
    })
  end
}

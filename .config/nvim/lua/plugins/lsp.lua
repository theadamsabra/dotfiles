return {
  -- We'll need mason:
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  -- Then we'll use mason-lspconfig:
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        -- Specify language servers here:
        ensure_installed = {
          "lua_ls", "pyright"
        }
      })
    end
  },
  -- Configure the lspconfig:
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({
        settings = {
          pyright = {
            autoImportCompletion = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
              typeCheckingMode = 'off'
            }
          }
        }
      })
      lspconfig.lua_ls.setup({})
    end
  }
}



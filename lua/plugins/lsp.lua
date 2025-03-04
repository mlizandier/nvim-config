return { {
  'neovim/nvim-lspconfig', -- Le dépôt du plugin nvim-lspconfig
  event = 'BufRead',       -- Charge le plugin lors de l'ouverture d'un fichier
  config = function()
    local lspconfig = require('lspconfig')

    lspconfig.eslint.setup({
      settings = {
        packageManager = 'bun',
      },
      ---@diagnostic disable-next-line: unused-local
      on_attach = function(client, bufnr)
        -- Ajouter un autocommand pour exécuter "EslintFixAll" avant chaque sauvegarde
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          command = "EslintFixAll",
        })
        vim.api.nvim_create_autocmd("BufWritePost", {
          buffer = bufnr,
          callback = function()
            require("conform").format({ bufnr = bufnr })
          end,
        })
      end,
    })
  end,
}, {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  opts = {},
  config = function()
    require("typescript-tools").setup {
      on_attach =
          function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = false
            client.server_capabilities.documentRangeFormattingProvider = false
          end,
      settings = {
        jsx_close_tag = {
          enable = true,
          filetypes = { "javascriptreact", "typescriptreact" },
        }
      }
    }
  end
}, }

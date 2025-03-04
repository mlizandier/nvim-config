return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'nvim-lua/plenary.nvim',
    'onsails/lspkind-nvim'
  },
  config = function()
    local cmp = require 'cmp'
    local lspkind = require 'lspkind'

    -- Setup nvim-cmp with LSP and kind icons
    cmp.setup({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = {
        -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- menu = function() return math.floor(0.45 * vim.o.columns) end,
        menu = 50, -- leading text (labelDetails)
        abbr = 50, -- actual suggestion item
      },
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      show_labelDetails = true, -- show labelDetails in menu. Disabled by default

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))

      mapping = {
        -- Cycle through suggestions with arrow keys or Tab
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),

        -- Accept suggestion with Enter
        ['<CR>'] = cmp.mapping.confirm({ select = true }),

        -- You can add other mappings here if needed
      },
      -- Display kind of completion suggestions (icons for LSP suggestions)
      formatting = {
        format = lspkind.cmp_format({
          with_text = true,
          maxwidth = 50
        }),
      },
      -- Sources for autocompletion
      sources = {
        { name = 'nvim_lsp' },
        { name = 'buffer' },
        { name = 'path' },
      },
    })

    -- Optionally, you can set up LSP
    -- require('lspconfig').your_language_server.setup {}
  end,
}

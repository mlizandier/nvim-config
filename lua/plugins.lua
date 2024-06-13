local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

-- setup must be called before loading
vim.cmd [[packadd packer.nvim]]

packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        'hrsh7th/cmp-nvim-lua',
        'octaltree/cmp-look',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-calc',
        'f3fora/cmp-spell',
        'hrsh7th/cmp-emoji'
      }
    }
    -- Snippets
    use 'L3MON4D3/LuaSnip'             -- Snippet engine
    use 'saadparwaiz1/cmp_luasnip'     -- Snippets source for nvim-cmp

    -- Optional: Additional completion sources
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim" }
    }
    use 'MunifTanjim/prettier.nvim'
    -- Misc
    use 'onsails/lspkind.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
    }
    use {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
    }
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use 'mg979/vim-visual-multi' -- multi-cursors

    -- Colorschemes
    use "rebelot/kanagawa.nvim"
    use 'ellisonleao/gruvbox.nvim'
  end
)

-- Neo-tree setup
require("neo-tree").setup({
  close_if_last_window = true, -- Close Neo-tree if it is the last window open
  popup_border_style = "rounded",
  enable_diagnostics = true,
  filesystem = {
    follow_current_file = {
      enabled = true,              -- This will find and focus the file in the active buffer every time
      --              -- the current file is changed while the tree is open.
      leave_dirs_open = false,     -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    use_libuv_file_watcher = true, -- Use libuv file watcher
  },
  buffers = {
    show_unloaded = true,
  },
  git_status = {
    window = {
      position = "float",
    },
  },
})

-- Key mappings
vim.api.nvim_set_keymap('n', '<Space>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Space>o', ':wincmd p<CR>', { noremap = true, silent = true })

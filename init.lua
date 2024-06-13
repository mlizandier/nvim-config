vim.opt.number = true         -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers
vim.opt.mouse = 'a'           -- Enable mouse support
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

require('plugins')
-- Lsp config setup
require('lsp_config')
require('tree_sitter')
require('cmp_config')
require('misc.lualine')
-- Colorscheme
require('colorscheme.gruvbox')
-- telescope
require('telescope_config')

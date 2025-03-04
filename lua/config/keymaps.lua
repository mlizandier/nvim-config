-- Keymaps for Telescope
local M = {}

M.setup = function()
  -- Recherche fuzzy pour fichiers
  vim.api.nvim_set_keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true })

  -- Recherche fuzzy dans les commandes
  vim.api.nvim_set_keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true })

  -- Recherche dans les buffers
  vim.api.nvim_set_keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

  -- Recherche dans les tags
  vim.api.nvim_set_keymap("n", "<leader>ft", "<cmd>Telescope tags<cr>", { noremap = true, silent = true })

  -- Recherche dans les fichiers récemment utilisés
  vim.api.nvim_set_keymap("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<leader>t", "<cmd>ToggleTerm<cr>", { noremap = true, silent = true, desc = 'Open [T]erminal' })

  vim.g.mapleader = " "
  vim.cmd("set number")
  vim.cmd("set relativenumber")

  vim.o.tabstop = 2
  vim.o.shiftwidth = 2
  vim.o.expandtab = true
  vim.o.smarttab = true
  vim.o.smartindent = true
  vim.o.autoindent = true

  -- Diagnostic keymaps
  vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
  --  See `:help wincmd` for a list of all window commandsvim.keymap.set('n', '<leader>wv', '<C-w>v', { noremap = true, desc = 'Split the window vertically' })
  vim.keymap.set('n', '<leader>wv', '<C-w>s', { noremap = true, desc = 'Split the window horizontally' })
  vim.keymap.set('n', '<leader>ws', '<C-w>v', { noremap = true, desc = 'Split the window vertically' })
  vim.keymap.set('n', '<leader>wq', '<C-w>q', { noremap = true, desc = 'Close the current window' })
  vim.keymap.set('n', '<leader>wd', '<C-w>c', { noremap = true, desc = 'Close the current window (alternative)' })
  vim.keymap.set('n', '<leader>wj', '<C-w>j', { noremap = true, desc = 'Navigate to the window below' })
  vim.keymap.set('n', '<leader>wh', '<C-w>h', { noremap = true, desc = 'Navigate to the window on the left' })
  vim.keymap.set('n', '<leader>wk', '<C-w>k', { noremap = true, desc = 'Navigate to the window above' })
  vim.keymap.set('n', '<leader>wl', '<C-w>l', { noremap = true, desc = 'Navigate to the window on the right' })
  vim.keymap.set('n', '<leader>wt', '<C-w>+', { noremap = true, desc = 'Increase window height' }) -- Resize window up (increase height)
  vim.keymap.set('n', '<leader>wr', '<C-w>>', { noremap = true, desc = 'Increase window width' }) -- Resize window right (increase width)
end

return M

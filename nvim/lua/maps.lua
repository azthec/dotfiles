-- Set space as leader
vim.g.mapleader = ' '

-- Shortcut to save
vim.keymap.set('n', '<leader>s', '<cmd>up<cr>', { noremap = true })

-- Shortcut to alternate buffer
vim.keymap.set('n', '<leader><leader>', ':b#<cr>', { noremap = true })

-- Shortcut for delete key
vim.keymap.set('i', '<C-d>', '<Del>', { noremap = true })
vim.keymap.set('i', '<C-k>', '<Del>', { noremap = true })

-- This unsets the 'last search pattern' register by hitting return
vim.keymap.set('n', '<CR>', '<cmd>noh<cr><cr>', { silent = true, noremap = true })

-- Map window navigation to Control + hjkl
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- Maps 'x' to delete without copying
vim.api.nvim_set_keymap('n', 'x', '"_x', { noremap = true })
vim.api.nvim_set_keymap('v', 'x', '"_x', { noremap = true })

-- Visual --
-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', {})
vim.keymap.set('v', '>', '>gv', {})
-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', {})
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', {})
vim.keymap.set('v', 'p', '"_dP"', {})

-- Visual block --
-- Move text up and down
vim.keymap.set('x', 'J', ':move ‘>+1<CR>gv-gv', {})
vim.keymap.set('x', 'K', ':move ‘<-2<CR>gv-gv', {})
vim.keymap.set('x', '<A-j>', ':move ‘>+1<CR>gv-gv', {})
vim.keymap.set('x', '<A-k>', ':move ’<-2<CR>gv-gv', {})

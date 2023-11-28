-- Set space as leader
vim.g.mapleader = ' '

-- Shortcut to save
vim.keymap.set('n', '<leader>s', '<cmd>up<cr>', { noremap = true })

-- This unsets the 'last search pattern' register by hitting return
vim.keymap.set('n', '<CR>', '<cmd>noh<cr><cr>', { silent = true, noremap = true })

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


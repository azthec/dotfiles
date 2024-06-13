vim.cmd('let test#strategy = "neovim_sticky"')
vim.cmd('let test#neovim#term_position = "vert"')
vim.cmd('let test#neovim_sticky#kil_previous = 1')
vim.cmd('let test#neovim_sticky#reopen_window = 1')

vim.keymap.set('n', '<leader>tt', '<cmd>TestNearest<cr>', {}) -- test
vim.keymap.set('n', '<leader>tf', '<cmd>TestFile<cr>', {})    -- test file
vim.keymap.set('n', '<leader>tr', '<cmd>TestLast<cr>', {})    -- test rerun
vim.keymap.set('n', '<leader>tg', '<cmd>TestVisit<cr>', {})   -- go to test

local gs = require('gitsigns')
vim.keymap.set('n', '<leader>hb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
vim.keymap.set('n', '<leader>hd', gs.diffthis)


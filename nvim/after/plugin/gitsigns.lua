local gs = require('gitsigns')

-- prevents finicky sign column jitter
vim.opt.signcolumn = "yes"

vim.keymap.set('n', ']c', function()
  if vim.wo.diff then return ']c' end
  vim.schedule(function() gs.next_hunk() end)
  return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '[c', function()
  if vim.wo.diff then return '[c' end
  vim.schedule(function() gs.prev_hunk() end)
  return '<Ignore>'
end, { expr = true })

vim.keymap.set('n', '<leader>hb', gs.toggle_current_line_blame)
vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
vim.keymap.set('n', '<leader>ha', gs.stage_hunk)
vim.keymap.set('n', '<leader>hd', gs.diffthis)

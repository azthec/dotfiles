local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({no_ignore=true}) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep,  {})
vim.keymap.set('n', '<leader>fb', builtin.buffers,    {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags,  {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps,  {})
telescope.setup({
  defaults = {
    path_display = { 'truncate ' },
    mappings = {
      i = {
        ['<C-k>'] = actions.move_selection_previous, -- move to prev result
        ['<C-j>'] = actions.move_selection_next, -- move to next result
        ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
  },
})


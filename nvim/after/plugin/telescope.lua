local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa', function() builtin.find_files({ no_ignore = true }) end, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fk', builtin.keymaps, {})
-- drop-down menu for vim spellchecks
vim.keymap.set('n', '<leader>fs',
  function() require('telescope.builtin').spell_suggest(require('telescope.themes').get_cursor({})) end)

-- multiselect open one buffer per file
local open_selected = function(prompt_bufnr)
  local picker = require('telescope.actions.state').get_current_picker(prompt_bufnr)
  local selected = picker:get_multi_selection()
  if vim.tbl_isempty(selected) then
    actions.select_default(prompt_bufnr)
  else
    actions.close(prompt_bufnr)
    for _, file in pairs(selected) do
      if file.path then vim.cmd('edit' .. (file.lnum and ' +' .. file.lnum or '') .. ' ' .. file.path) end
    end
  end
end
local open_all = function(prompt_bufnr)
  actions.select_all(prompt_bufnr)
  open_selected(prompt_bufnr)
end

telescope.setup({
  defaults = {
    path_display = { 'truncate ' },
    mappings = {
      i = {
        ['<C-k>']  = actions.move_selection_previous, -- move to prev result
        ['<C-j>']  = actions.move_selection_next,     -- move to next result
        ['<C-q>']  = actions.send_selected_to_qflist + actions.open_qflist,
        ['<CR>']   = open_selected,
        ['<C-CR>'] = open_all,
      },
      n = {
        ['<c-d>']  = actions.delete_buffer,
        ['<CR>']   = open_selected,
        ['<C-CR>'] = open_all,
      },
    },
  },
})

-- set working directory to specifically opened file's path
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    vim.api.nvim_set_current_dir(vim.fn.expand('%:p:h'))
  end
})

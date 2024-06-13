-- example run autocmd on file save
local function get_bufnr_by_name(target_name)
  local bufs = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(bufs) do
    local name = vim.api.nvim_buf_get_name(bufnr)
    if name:find(target_name) then
      return bufnr
    end
  end
  return nil
end

vim.api.nvim_create_autocmd('BufWritePost', {
  -- replace autocmds if existing
  group = vim.api.nvim_create_augroup('autocmd-example', { clear = true }),
  pattern = 'sample.file',
  callback = function()
    local bufnr = get_bufnr_by_name('sample.file')
    -- insert text into buffer
    vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { 'lorem ipsum', 'dolor sit amet' })
    -- exec cmd and insert output into buffer
    vim.fn.jobstart({ 'ls', '-la' }, {
      stdout_buffered = true,
      on_stdout = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end,
      on_stderr = function(_, data)
        if data then
          vim.api.nvim_buf_set_lines(bufnr, -1, -1, false, data)
        end
      end
    })
  end
})

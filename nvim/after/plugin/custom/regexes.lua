function apply_regexes(transforms, bufnr)
  bufnr = bufnr or 0

  if type(transforms) ~= "table" then
    error("transforms must be a table")
  end

  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  for _, transform in ipairs(transforms) do
    if type(transform) ~= "table" or not transform.pattern or not transform.replacement then
      error("Each transform must be a table with 'pattern' and 'replacement' fields")
    end

    local pattern = transform.pattern
    local replacement = transform.replacement

    for i, line in ipairs(lines) do
      lines[i] = string.gsub(line, pattern, replacement)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)

  print("Applied " .. #transforms .. " regex pattern transformations")
end

function delete_blank_lines(bufnr)
  bufnr = bufnr or 0
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local filtered_lines = {}
  for _, line in ipairs(lines) do
    if line ~= "" then
      table.insert(filtered_lines, line)
    end
  end

  vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, filtered_lines)
end

function setup_commands()
  vim.api.nvim_create_user_command('DBUIToCsv', function(opts)
    local default_transforms = {
      { pattern = "∅", replacement = "NULL" },
      { pattern = "^[┌└├].*[┐┘┤]$", replacement = "" },
      { pattern = "^│%s+", replacement = "" },
      { pattern = "%s+│$", replacement = "" },
      { pattern = ",", replacement = "" },
      { pattern = "%s*│%s*", replacement = "," },
      { pattern = "%((%d+) rows%)", replacement = "" },
    }
    apply_regexes(default_transforms)
    delete_blank_lines()
  end, { desc = "Convert DBUI output format to CSV" })
end

setup_commands()

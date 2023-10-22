vim.keymap.set('n', 'f', function() require('lint').try_lint() end, {})

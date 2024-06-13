-- Set NERDTree options
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeMinimalUI = 1
vim.g.NERDTreeRespectWildIgnore = 1

-- Quit Neovim when only NERDTree is open
vim.api.nvim_create_autocmd('BufEnter', {
  pattern = '*',
  command = 'if tabpagenr("$") == 1 && winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree() | quit | endif'
})

-- Set vim-plug window options
vim.g.plug_window = 'noautocmd vertical topleft new'

-- Set devicons options
vim.g.WebDevIconsUnicodeDecorateFolderNodes = 1
vim.g.DevIconsEnableFoldersOpenClose = 1
vim.g.DevIconsEnableFolderExtensionPatternMatching = 1

vim.keymap.set('n', '<leader>nn', '<cmd>NERDTreeToggle<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>nf', '<cmd>NERDTreeFind<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>nc', '<cmd>NERDTreeCWD<cr>', { silent = true, noremap = true })
vim.keymap.set('n', '<leader>nr', '<cmd>NERDTreeRefreshRoot<cr>', { silent = true, noremap = true })

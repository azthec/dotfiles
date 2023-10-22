local opt = vim.opt

-- Show line numbers
opt.nu = true
opt.relativenumber = true
-- Disable backup files
opt.backup = false
-- Disable swap files
opt.swapfile = false
-- Ignore case when searching
opt.ignorecase = true
-- Use global clipboard (works on recent-ish linux/macos)
opt.clipboard = 'unnamedplus'
-- Enable folding
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldlevel = 99
-- Configure indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true
-- 24-bit RGB
opt.termguicolors = true
-- 8 context lines above and below selection
opt.scrolloff = 8
-- triggers events when the cursor hasn't moved for the set time
-- useful for lsp hints and others
opt.updatetime = 50

-- files and folders to globally ignore
local ignore_list = {
  '.git', '*/node_modules/*' ,'*/target/*', '.metals', '.bloop',
  '.ammonite', '.gradle', '.idea', '.settings'
}
opt.wildignore = table.concat(ignore_list, ',')


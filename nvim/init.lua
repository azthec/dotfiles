local api = vim.api
local cmd = vim.cmd
local map = vim.keymap.set

-- Show line numbers
cmd.set('number')
-- Disable backup files
cmd.set('nobackup')
-- Disable swap files
cmd.set('noswapfile')
-- Ignore case when searching
cmd.set('ignorecase')
-- Use global clipboard (works on recent-ish linux/macos)
cmd.set('clipboard=unnamedplus')
-- Enable folding
cmd.set('foldmethod=indent foldlevel=99')
-- Configure indentation
cmd.set('shiftwidth=2 tabstop=2 smarttab expandtab')

-- require('plugins')
-- require('configs')
-- require('maps')
-- require('scala')

-- cmd.source('migrating.vim')


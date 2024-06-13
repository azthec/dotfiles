-- vim-wiki
vim.g.vimwiki_global_ext = 0

-- vim-zettel
vim.g.zettel_options = {
  {
    front_matter = {
      { 'type', 'note' },
      { 'tags', '' }
    },
    template = '~/Documents/Armadiki/templates/zettel.tpl',
    rel_path = 'zettel/'
  }
}
vim.g.zettel_format = '%y%m%d'
vim.g.zettel_fzf_command = 'Ag'

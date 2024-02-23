-- scala
local api = vim.api

local metals_config = require('metals').bare_config()
local lsp_keybindings = require('plugins.lsp-keybindings')

metals_config.settings = {
  showImplicitArguments = true,
  excludedPackages = { 'akka.actor.typed.javadsl', 'com.github.swagger.akka.javadsl' },
}
metals_config.init_options.statusBarProvider = 'off'
metals_config.capabilities = require('cmp_nvim_lsp').default_capabilities()
metals_config.on_attach = function(_, bufnr)
  lsp_keybindings(_, bufnr)
  vim.keymap.set('n', 'mc', require("telescope").extensions.metals.commands, {}) -- show definition, references
end


local nvim_metals_group = api.nvim_create_augroup('nvim-metals', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = { 'scala', 'sbt' }, -- add java if not using java.lua
  callback = function()
    require('metals').initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

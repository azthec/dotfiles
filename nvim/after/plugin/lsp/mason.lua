local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')

mason.setup()

mason_lspconfig.setup({
  -- list of servers for mason to install
  ensure_installed = {
    'lua_ls',        -- lua
    'rust_analyzer', -- rust
    'pyright',       -- python
    'jsonls'
  },
  -- auto-install configured servers (with lspconfig)
  automatic_installation = true, -- not the same as ensure_installed
})

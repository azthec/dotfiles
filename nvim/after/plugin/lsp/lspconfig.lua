
local lspconfig = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')

-- gutter icons from @josean-dev
local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

local lsp_keybindings = require('plugins.lsp-keybindings')

local capabilities = cmp_nvim_lsp.default_capabilities()

-- rust and python
for _, lsp in ipairs({'rust_analyzer', 'pyright'}) do
  lspconfig[lsp].setup({
    on_attach = lsp_keybindings,
    capabilities = capabilities,
  })
end

-- lua
lspconfig['lua_ls'].setup({
  on_attach = lsp_keybindings,
  capabilities = capabilities,
  settings = {
    Lua = {
      -- make the language server recognize 'vim' global
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        -- make language server aware of runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.stdpath('config') .. '/lua'] = true,
        },
      },
    },
  },
})


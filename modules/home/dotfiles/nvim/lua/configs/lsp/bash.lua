local nvlsp = require "configs.lsp.nvlsp"
local lspconfig = require "lspconfig"

lspconfig.bashls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  cmd = {
    "bash-language-server",
    "start",
  },
}

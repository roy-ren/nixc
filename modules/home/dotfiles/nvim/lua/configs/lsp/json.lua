local lspconfig = require "lspconfig"
local nvlsp = require "configs.lsp.nvlsp"

lspconfig.jsonls.setup {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,

  settings = {
    json = {
      schemas = require("schemastore").json.schemas(), -- 自动加载 JSON Schema
      validate = { enable = true }, -- 启用 JSON 校验
    },
  },
}

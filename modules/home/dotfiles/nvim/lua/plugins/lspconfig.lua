return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "b0o/schemastore.nvim",
    "saghen/blink.cmp",
  },
  opts = {
    servers = {
      bashls = require "configs.lsp.bashls",
      nixd = require "configs.lsp.nixd",
      -- jsonls = require "configs.lsp.jsonls",
      -- yamlls = require "configs.lsp.yamlls",
      dartls = {},
      lua_ls = {},
    },
  },
  config = function(_, opts)
    -- local blink_capabilities = require("blink.cmp").get_lsp_capabilities()
    -- require("schemastore").setup()

    local lspconfig = require "lspconfig"
    local nvlsp = require "configs.lsp.nvlsp"

    nvlsp.defaults()

    local conf = {
      on_attach = nvlsp.on_attach,
      on_init = nvlsp.on_init,
      capabilities = nvlsp.capabilities,
    }

    for server, config in pairs(opts.servers) do
      lspconfig[server].setup(vim.tbl_deep_extend("keep", config, conf))
    end
  end,
}

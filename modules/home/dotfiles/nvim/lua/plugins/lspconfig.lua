return {
  "neovim/nvim-lspconfig",
  config = function()
    local nvlsp = require "configs.lsp.nvlsp"
    local lspconfig = require "lspconfig"

    nvlsp.defaults()

    local servers = {
      "lua_ls",
      "dartls",
    }

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
      }
    end

    require "configs.lsp.nix"
    require "configs.lsp.json"
    require "configs.lsp.bash"
  end,
}

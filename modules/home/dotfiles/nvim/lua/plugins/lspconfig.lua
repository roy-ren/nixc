return {
  {
    "b0o/SchemaStore.nvim",
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "b0o/SchemaStore.nvim",
      -- "saghen/blink.cmp",
    },
    opts = function()
      local lsp_configs = {}
      local config_path = vim.fn.stdpath "config" .. "/lua/configs/lsp"

      for _, file in ipairs(vim.fn.readdir(config_path)) do
        if file:match "%.lua$" and file ~= "nvlsp.lua" then -- 排除工具文件
          local server_name = file:gsub("%.lua$", "")
          lsp_configs[server_name] = require("configs.lsp." .. server_name)
        end
      end

      return {
        servers = lsp_configs,
      }
    end,

    config = function(_, opts)
      local lspconfig = require "lspconfig"
      local nvlsp = require "configs.lsp.nvlsp"
      nvlsp.defaults()

      local conf = {
        on_attach = nvlsp.on_attach,
        capabilities = nvlsp.capabilities,
      }

      for server_name, config in pairs(opts.servers) do
        lspconfig[server_name].setup(vim.tbl_deep_extend("force", conf, config))
      end
    end,
  },
}

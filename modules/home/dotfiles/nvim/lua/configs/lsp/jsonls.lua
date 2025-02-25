return {
  settings = {
    json = {
      schemas = require("schemastore").json.schemas(), -- 自动加载 JSON Schema
      validate = { enable = true }, -- 启用 JSON 校验
    },
  },
}

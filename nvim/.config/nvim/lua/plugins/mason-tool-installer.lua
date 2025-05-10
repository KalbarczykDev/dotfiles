return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  event = "User MasonReady",
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require "configs.mason-tool-installer"
  end,
}

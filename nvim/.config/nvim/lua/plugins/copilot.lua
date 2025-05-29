return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    --Disable copilot tab mapping
    vim.g.copilot_no_tab_map = true
  end,
}

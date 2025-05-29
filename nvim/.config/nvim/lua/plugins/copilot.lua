return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    --TODO: Change accept mapping
    vim.g.copilot_enabled = false
  end,
}

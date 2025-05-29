return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    --TODO: Change accept mapping
    vim.cmd "Copilot disablble"
  end,
}

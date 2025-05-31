return {
  "github/copilot.vim",
  event = "InsertEnter",
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_enabled = true

    vim.cmd [[
      imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
    ]]
  end,
}

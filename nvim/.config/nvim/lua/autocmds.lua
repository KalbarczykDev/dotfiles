vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.config",
  callback = function()
    vim.bo.filetype = "ini"
  end,
})

-- Spell check only in prose filetypes
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "markdown", "text" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})

-- Detect docker compose files so docker_compose_language_service attaches
vim.filetype.add {
  extension = {
    mmd = "mermaid",
    mermaid = "mermaid",
  },
  pattern = {
    ["[Dd]ocker%-?[Cc]ompose.*%.ya?ml"] = "yaml.docker-compose",
    ["[Cc]ompose.*%.ya?ml"] = "yaml.docker-compose",
  },
}
-- Keep yaml treesitter highlighting on the compound filetype
vim.treesitter.language.register("yaml", "yaml.docker-compose")

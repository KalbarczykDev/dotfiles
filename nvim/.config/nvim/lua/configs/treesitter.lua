local M = {}

M.ensure_installed = {
  "lua",
  "python",
  "java",
  "xml",
  "yaml",
  "javascript",
  "typescript",
  "tsx",
  "html",
  "css",
  "json",
  "yaml",
  "markdown",
  "bash",
  "toml",
}

M.auto_install = true

M.highlight = {
  enable = true,
  use_languagetree = true,
  additional_vim_regex_highlighting = false,
}

M.indent = { enable = true }

return M

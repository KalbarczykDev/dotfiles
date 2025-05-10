local M = {}

M.ensure_installed = {
  "lua",
  "python",
  "c",
  "cpp",
  "java",
  "kotlin",
  "groovy",
  "xml",
  "yaml",
  "javascript",
  "typescript",
  "tsx",
  "vue",
  "svelte",
  "astro",
  "html",
  "css",
  "json",
  "yaml",
  "markdown",
}

M.auto_install = true

M.highlight = {
  enable = true,
  additional_vim_regex_highlighting = false,
}

return M

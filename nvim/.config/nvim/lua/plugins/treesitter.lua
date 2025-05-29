return {
  --Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",

    highlight = {
      enable = true,
      use_languagetree = true,
      additional_vim_regex_highlighting = false,
    },

    auto_install = true,
    indent = { enable = true },
    ensure_installed = {
      --web dev languages
      "javascript",
      "typescript",
      "tsx",
      "php",

      --templates
      "html",
      "angular",
      "blade",
      "vue",

      --styles
      "css",
      "scss",

      --database
      "sql",

      --config files
      "lua",
      "xml",
      "yaml",
      "json",
      "json5",
      "toml",
      "gitignore",
      "editorconfig",

      --markdown & docs
      "markdown",
      "markdown_inline",
      "jsdoc",
      "phpdoc",

      --Shell
      "bash",

      --other
      "prolog",
    },
  },
}

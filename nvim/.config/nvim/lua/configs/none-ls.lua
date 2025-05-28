local null_ls = require "null-ls"

local eslint_d = require "none-ls.diagnostics.eslint_d"
local eslint_code_actions = require "none-ls.code_actions.eslint_d"

null_ls.setup {
  sources = {
    -- JavaScript / TypeScript / JSX / TSX
    eslint_d,
    eslint_code_actions,

    -- PHP / Laravel
    null_ls.builtins.diagnostics.phpstan,
    null_ls.builtins.diagnostics.phpcs,

    -- CSS / SCSS
    null_ls.builtins.diagnostics.stylelint,

    -- SQL
    null_ls.builtins.diagnostics.sqlfluff,

    -- YAML
    null_ls.builtins.diagnostics.yamllint,

    -- Markdown
    null_ls.builtins.diagnostics.markdownlint,

    --shell
    --shellcheck not needed expicite
  },
}

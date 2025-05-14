local M = {}

function M.setup()
  local default = require "nvchad.configs.cmp"
  local cmp = require "cmp"

  cmp.setup(vim.tbl_deep_extend("force", default, {
    mapping = {
      ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
      ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
      ["<CR>"] = cmp.mapping.confirm { select = true },
      ["<Right>"] = cmp.mapping.confirm { select = true },
    },
    sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "buffer" },
      { name = "path" },
    },
    experimental = {
      ghost_text = true,
    },
  }))
end

M.setup()

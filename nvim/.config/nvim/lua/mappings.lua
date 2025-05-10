require "nvchad.mappings"

local map = vim.keymap.set
local dap = require "dap"
local cmp = require "cmp"
local dapui = require "dapui"
local telescope = require "telescope.builtin"
local ufo = require "ufo"
local luasnip = require "luasnip"

--editor modes
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

--lsp
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "LSP Rename" })
map("n", "<leader>ca", function()
  vim.lsp.buf.code_action()
end, { desc = "LSP Code Action (with UI)" })

map("n", "<leader>gd", function()
  telescope.lsp_definitions(require("telescope.themes").get_dropdown {})
end, { desc = "Goto Definition (Telescope)" })

map("n", "<leader>gr", function()
  telescope.lsp_references(require("telescope.themes").get_dropdown {})
end, { desc = "Find References (Telescope)" })

map("n", "<leader>td", function()
  telescope.diagnostics(require("telescope.themes").get_dropdown {})
end, { desc = "Telescope Diagnostics" })

--debugger

map("n", "<Leader>db", dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
map("n", "<Leader>dc", dap.continue, { desc = "DAP Continue" })
map("n", "<Leader>do", dap.step_over, { desc = "DAP Step Over" })
map("n", "<Leader>di", dap.step_into, { desc = "DAP Step Into" })
map("n", "<Leader>dO", dap.step_out, { desc = "DAP Step Out" })
map("n", "<Leader>dr", dap.repl.toggle, { desc = "DAP Toggle REPL" })
map("n", "<Leader>du", dapui.toggle, { desc = "DAP UI Toggle" })
-- cmp setup
cmp.setup {
  mapping = {
    ["<Down>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
    ["<Up>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
  },
}

-- Keymaps for folding

-- Peek fold under cursor
map("n", "zp", function()
  local winid = ufo.peekFoldedLinesUnderCursor()
  if not winid then
    vim.cmd "normal! za"
  end
end, { desc = "UFO Peek or Toggle Fold" })

-- Open all folds
map("n", "zR", ufo.openAllFolds, { desc = "UFO Open All Folds" })

-- Close all folds
map("n", "zM", ufo.closeAllFolds, { desc = "UFO Close All Folds" })

-- Open folds except certain kinds (like comments)
map("n", "zr", ufo.openFoldsExceptKinds, { desc = "UFO Open Folds Except Kinds" })

-- Close folds with level
map("n", "zm", function()
  ufo.closeFoldsWith() -- Folds with minimum fold level
end, { desc = "UFO Close Folds with Level" })

-- spell checker
vim.keymap.set("n", "<leader>ss", function()
  require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown {})
end, { desc = "Telescope Spell Suggest" })

-- LuaSnip

map({ "i", "s" }, "<C-k>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  end
end, { silent = true, desc = "Expand or Jump to next snippet" })

map({ "i", "s" }, "<C-j>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  end
end, { silent = true, desc = "Jump to previous snippet" })

--Noice
map("n", "<Esc><Esc>", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice messages", silent = true })

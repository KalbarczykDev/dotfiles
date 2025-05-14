local M = {}
M.setup = function()
  require "nvchad.mappings"

  local map = vim.keymap.set
  local dap = require "dap"

  local dapui = require "dapui"
  local telescope = require "telescope.builtin"
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

  -- spell checker
  vim.keymap.set("n", "<leader>ss", function()
    require("telescope.builtin").spell_suggest(require("telescope.themes").get_dropdown {})
  end, { desc = "Telescope Spell Suggest" })

  --Noice
  map("n", "<Esc><Esc>", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice messages", silent = true })
end

return M

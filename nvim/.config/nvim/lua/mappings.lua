local M = {}
M.setup = function()
  local map = vim.keymap.set
  local dap = require "dap"

  local dapui = require "dapui"

  --tabs
  map("n", "<Tab>", "<Cmd>BufferNext<CR>", { desc = "Next buffer" })
  map("n", "<S-Tab>", "<Cmd>BufferPrevious<CR>", { desc = "Previous buffer" })
  map("n", "<C-x>", "<Cmd>BufferClose<CR>", { desc = "Close buffer" })

  --lsp
  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", { desc = "LSP Hover (Saga)" })
  map("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename (Telescope UI if dressing.nvim)" })

  map({ "n" }, "<leader>ca", function()
    vim.lsp.buf.code_action()
  end, { desc = "Code Action (Telescope)" })

  map("n", "<leader>gd", "<cmd>Lspsaga goto_definition<CR>", { desc = "Goto Definition (Saga)" })
  map("n", "pd", "<cmd>Lspsaga peek_definition<CR>", { desc = "Peek Definition" })

  map("n", "<leader>gr", "<cmd>Lspsaga finder<CR>", { desc = "LSP Finder (Defs/Refs/Impls)" })

  map("n", "[d", "<cmd>Lspsaga diagnostic_jump_prev<CR>", { desc = "Prev Diagnostic" })
  map("n", "]d", "<cmd>Lspsaga diagnostic_jump_next<CR>", { desc = "Next Diagnostic" })

  map("n", "<leader>ld", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Line Diagnostics" })
  map("n", "<leader>tw", "<cmd>Lspsaga show_workspace_diagnostics<CR>", { desc = "Workspace Diagnostics" })
  map("n", "<leader>tb", "<cmd>Lspsaga show_buf_diagnostics<CR>", { desc = "Buffer Diagnostics" })

  map("n", "<leader>ci", "<cmd>Lspsaga incoming_calls<CR>", { desc = "Incoming Calls" })
  map("n", "<leader>co", "<cmd>Lspsaga outgoing_calls<CR>", { desc = "Outgoing Calls" })

  map("n", "<leader>o", "<cmd>Lspsaga outline<CR>", { desc = "Toggle Symbols Outline" })

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
  map("n", "<C-\\>", "<cmd>NoiceDismiss<CR>", { desc = "Dismiss Noice messages", silent = true })

  --Minty
  map("n", "<Leader>sh", "<cmd>Shades<CR>", { desc = "Minty Shades" })
  map("n", "<Leader>hu", "<cmd>Huefy<CR>", { desc = "Minty Huefy" })

  -- Comment
  map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
  map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

  -- telescope
  map("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Search TODOs (Telescope)" })

  map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", {
    noremap = true,
    silent = true,
    desc = "Find Files (Telescope)",
  })
  map("n", "<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
  map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
  map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
  map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
  map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
  map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
  map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
  map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
  map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

  -- whichkey
  map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

  map("n", "<leader>wk", function()
    vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
  end, { desc = "whichkey query lookup" })
end

return M

require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

-- Indentation and Tabs
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Clipboard
vim.opt.clipboard = "unnamedplus"

-- UI
vim.opt.swapfile = false
vim.opt.number = true
vim.opt.background = "dark"
vim.g.tokyonight_transparent = true

--spell check
vim.opt.spelllang = "en_us"
vim.opt.spell = true

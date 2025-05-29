-- options.lua
local opt = vim.opt
local o = vim.o
local g = vim.g
-- UI
o.laststatus = 3
o.showmode = false
o.number = true
o.relativenumber = true
o.numberwidth = 2
o.ruler = false
opt.fillchars = { eob = " " }
o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.updatetime = 250

--persist undo
o.undofile = true

-- Indentation and Tabs
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2
o.autoindent = true
o.smartindent = true

-- Clipboard
o.clipboard = "unnamedplus"

-- Cursorline
o.cursorline = true
o.cursorlineopt = "number"

-- Mouse
o.mouse = "a"

-- Search
o.ignorecase = true
o.smartcase = true

-- Disable swap
o.swapfile = false

-- Spell check
o.spell = true
o.spelllang = "en_us"

-- Background
o.background = "dark"

-- Disable intro message
opt.shortmess:append "sI"

-- whichwrap: allow left/right arrow to wrap
opt.whichwrap:append "<>[]hl"

--create vertical split to show results of a command (must have!)
opt.inccommand = "split"

-- Disable unused providers
g.loaded_node_provider = 0
g.loaded_python3_provider = 0
g.loaded_perl_provider = 0
g.loaded_ruby_provider = 0

-- Add Mason binaries to PATH
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

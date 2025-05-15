local M = {}

M.macha = {
  rosewater = "#f5e0dc",
  flamingo = "#f2cdcd",
  pink = "#f5c2e7",
  mauve = "#cba6f7",
  red = "#f38ba8",
  maroon = "#eba0ac",
  peach = "#fab387",
  yellow = "#f9e2af",
  green = "#a6e3a1",
  teal = "#94e2d5",
  sky = "#89dceb",
  sapphire = "#74c7ec",
  blue = "#89b4fa",
  lavender = "#b4befe",
  text = "#cdd6f4",
  subtext1 = "#bac2de",
  subtext0 = "#a6adc8",
  overlay2 = "#9399b2",
  overlay1 = "#7f849c",
  overlay0 = "#6c7086",
  surface2 = "#585b70",
  surface1 = "#45475a",
  surface0 = "#313244",
  base = "#1e1e2e",
  mantle = "#181825",
  crust = "#11111b",
}

local c = M.macha

M.base_30 = {
  white = c.text,
  black = c.base,
  darker_black = "#1b1b25",
  black2 = "#1f1f2f",
  one_bg = c.surface0,
  one_bg2 = c.surface1,
  one_bg3 = c.surface2,
  grey = c.overlay0,
  grey_fg = c.overlay1,
  grey_fg2 = c.overlay2,
  light_grey = c.subtext0,
  red = c.red,
  baby_pink = "#ffa5c3",
  pink = c.pink,
  line = c.surface0,
  green = c.green,
  vibrant_green = "#b5d6a5",
  nord_blue = c.sapphire,
  blue = c.blue,
  seablue = "#70a5eb",
  yellow = c.yellow,
  sun = "#ffe9b6",
  purple = c.mauve,
  dark_purple = "#b697e1",
  teal = c.teal,
  orange = c.peach,
  cyan = c.sky,
  statusline_bg = "#242434",
  lightbg = "#2f2e3e",
  pmenu_bg = c.green,
  folder_bg = c.sapphire,
}

M.base_16 = {
  base00 = c.base,
  base01 = c.mantle,
  base02 = c.surface0,
  base03 = c.overlay0,
  base04 = c.overlay1,
  base05 = c.text,
  base06 = c.subtext1,
  base07 = c.rosewater,
  base08 = c.red,
  base09 = c.peach,
  base0A = c.yellow,
  base0B = c.green,
  base0C = c.sky,
  base0D = c.blue,
  base0E = c.mauve,
  base0F = c.maroon,
}

M.polish_hl = {
  defaults = {
    Comment = {
      fg = c.overlay1,
      italic = true,
    },
  },
  treesitter = {
    ["@variable"] = { fg = c.flamingo },
    ["@variable.builtin"] = { fg = c.flamingo },
    ["@function.builtin"] = { fg = c.blue },
    ["Function"] = { fg = c.blue },
    ["@function"] = { fg = c.blue },
    ["@keyword"] = { fg = c.mauve },
    ["@property"] = { fg = c.sky },
    ["@type"] = { fg = c.yellow },
    ["@type.builtin"] = { fg = c.mauve },
  },
}

M.type = "dark"

return M

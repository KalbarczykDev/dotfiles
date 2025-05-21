require("noice").setup {
  lsp = {
    hover = {
      enabled = false,
    },
    signature = {
      enabled = false,
    },
    progress = {
      enabled = false, -- disable "formatting", "initializing", etc.
    },
  },
}

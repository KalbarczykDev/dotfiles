return {
  -- Display binary files in hex format
  {
    "RaafatTurki/hex.nvim",
    event = "BufReadPre",
    opts = {
      hide_hex = false,
      preferred_column = 80,
    },
  },
}

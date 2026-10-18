return {
  {
    "folke/zen-mode.nvim",
    opts = {
      window = {
        backdrop = 0.95,
        width = 120,
        options = {
          number = true,
          relativenumber = true,
        },
      },
      plugins = {
        twilight = { enabled = false },
        kitty = {
          enabled = false,
          font = "+4", -- font size increment
        },
      },
    },
    vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>")
  }
}

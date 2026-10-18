return {
  {
    "folke/twilight.nvim",
    opts = {
      dimming = {
        alpha = 0.25, -- intensité du sombre
        color = { "Normal", "#ffffff" },
        inactive = false,
      },
      context = 15, -- lignes visibles autour du curseur
      treesitter = true,
      expand = {
        "function",
        "method",
        "table",
        "if_statement",
      },
    },
    vim.keymap.set("n", "<leader>tw", "<cmd>Twilight<CR>"),
  }
}

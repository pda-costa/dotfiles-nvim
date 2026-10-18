return{
  --Neogit config table
  {
    "NeogitOrg/neogit",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
    },

    cmd = "Neogit",
    keys = {
      {
        "<leader>gg",
        "<cmd>Neogit<CR>",
        desc = "Show Neogit UI",
      }
    }
  },
  -- gitsign config table
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup()
    end,
  },
}

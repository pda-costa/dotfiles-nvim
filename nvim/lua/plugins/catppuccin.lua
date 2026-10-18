return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato", -- le plus proche de PyCharm
      transparent_background = false,

      styles = {
        comments = { "italic" },
        keywords = {},
        functions = {},
        strings = {},
        variables = {},
        types = {},
      },

      integrations = {
        telescope = true,
        neotree = true,
      },

      custom_highlights = function(c)
        return {
          Comment  = { fg = c.overlay1, style = { "italic" } },
          String   = { fg = c.green },
          Keyword  = { fg = c.mauve },
          Function = { fg = c.blue },
          Type     = { fg = c.yellow },
        }
      end,
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}


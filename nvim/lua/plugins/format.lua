-- lua/plugins/format.lua

local env = require("util.env")

return {
  {
    "stevearc/conform.nvim",
    config = function()
      if not env.has_stylua then
        vim.notify("stylua non trouvé : formatage Lua désactivé", vim.log.levels.WARN)
        return
      end

      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
        },
      })

      vim.keymap.set("n", "<leader>f", function()
        require("conform").format({ async = true })
      end)
    end,
  },
}


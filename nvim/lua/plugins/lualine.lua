-- lua/plugins/lualine.lua

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()

      local function recording()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        else
          return "REC @" .. reg
        end 
      end
      require("lualine").setup({
        options = {
          theme = "palenight",
          section_separators = "",
          component_separators = "",
        },
        sections = {
          lualine_a = { recording, "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "filename",
              path = 1,
              shorting_target = 40,
            },
          },
          lualine_x = {
            "encoding",
            "filetype",
          },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
      -- refresh automatique (OBLIGATOIRE)
      vim.api.nvim_create_autocmd("RecordingEnter", {
        callback = function()
          require('lualine').refresh()
        end,
      })
      vim.api.nvim_create_autocmd("RecordingLeave", {
        callback = function()
          require("lualine").refresh()
        end,
      })
    end,
  },
}


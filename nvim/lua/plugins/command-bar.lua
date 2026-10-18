return{
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {},
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    config = function()
      local noice = require("noice")
      noice.setup({
        notify = { enabled = true,}, -- desactive les notifs spams
        messages = { enabled = true },
        cmdline = { enabled = true },
        routes = {
          -- supprimer messages inutiles
          {
            filter = { event = 'msg_show', find = "written" },
            opts = {skip = true},
            -- view = "notify",
          },
          {
            filter = { event = 'msg_show', find = "yanked" },
            opts = {skip = true},
          },
          {
            filter = { event = 'msg_show', find = "search hit" },
            opts = {skip = true},
          },
        },
        {
          filter = { event = "msg_show" },
          opts = { skip = true },
        },
        -- ✅ MAIS garder erreurs
        {
          filter = { event = "msg_show", kind = "emsg" },
          opts = { skip = false },
        },
        -- keep important messages (macro)
      lsp = {
        progress = {
          enabled = false, --enlève spam lsp
        },
      },
      })
    end
  },
}

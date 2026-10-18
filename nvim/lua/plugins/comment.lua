-- return{
--   "numToStr/Comment.nvim",
--   opts = {
--     padding = true,
--     sticky = true,
--     ignore = "^$"
--   }
-- }

-- lua/plugins/comment.lua
return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    event = "BufReadPost",
    config = function()
      -- Désactive le hook automatique de ts-context-commentstring
      require("ts_context_commentstring").setup({
        enable_autocmd = false,
      })

      require("Comment").setup({
        padding = true,
        sticky = true,
        ignore = "^$",
        -- Hook qui détecte le bon type de commentaire via treesitter
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
  },
}

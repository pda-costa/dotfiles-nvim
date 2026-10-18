return{
  {
    'L3MON4D3/LuaSnip', -- snipped engine
    dependencies = {
      'saadparwaiz1/cmp_luasnip', --for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
    }
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',

  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()

      local cmp = require("cmp")
      require("luasnip.loaders.from_vscode").load()
   
      cmp.setup({
        snippet = {
        -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          
          ["<Up>"] = cmp.mapping.select_prev_item(),
          ["<Down>"] = cmp.mapping.select_next_item(),
      }),
        sources = cmp.config.sources({
          --{ name = 'nvim_lsp' },
          { name = 'luasnip' }, -- For luasnip users.
        }, {
            { name = 'buffer' },
            { name = 'luasnip' },
            { name = 'path' },
          })
      })
    end,
  }
}

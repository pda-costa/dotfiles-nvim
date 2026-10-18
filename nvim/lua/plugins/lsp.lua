return{
  -- Mason (gestionnaires d'outils LSP)
  {
    "williamboman/mason.nvim",
    config = true
  },

  -- Lien entre Mason et lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {"mason.nvim"},
    config = true,
  },

  -- LSP config de Neovim
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      vim.keymap.set('n','K', vim.lsp.buf.hover,{})
      vim.keymap.set('n','gd', vim.lsp.buf.definition, {})
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action,{})

    end,
  },

}

return{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
      "MunifTanjim/nui.nvim",
  },
    config = function()
      vim.keymap.set('n', '<C-n>', ':Neotree toggle left<CR>',{desc ="Toggle file explorer"})
    vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF]])
    end
}

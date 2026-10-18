return{
      -- telescope part
     'nvim-telescope/telescope.nvim',
     tag = '0.1.8',
     dependencies = { 'nvim-lua/plenary.nvim' },
     opts = {
       defaults = {
         layout_strategy = "bottom_pane",
         layout_config = {
           height = 0.35,
           prompt_position = "bottom",
         },
         previewer = false,
         sorting_strategy = "ascending",
       },

       pickers = {
         find_files = {
           --theme = "ivy", -- ✅ singulier
         },
       },
     },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)

    local builtin = require("telescope.builtin")
    vim.keymap.set("n", "<C-p>", builtin.find_files)
    vim.keymap.set("n", "<leader>fg", builtin.live_grep)
    vim.keymap.set("n", "<leader>fb", builtin.buffers)
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles)
    vim.keymap.set("n", "<leader>fh", builtin.help_tags)
    vim.keymap.set("n", "<leader>en", function()
      builtin.find_files { cwd = vim.fn.stdpath("config") }
    end)
    -- Toutes les tâches non faites dans tous les fichiers
    vim.keymap.set('n', '<leader>st', function()
      require('telescope.builtin').grep_string({
        search = '- [ ]',
        prompt_title = 'Tâches en cours',
      })
    end, { desc = 'Tasks: non faites' })
    -- Toutes les tâches (faites + pas faites)
    vim.keymap.set('n', '<leader>sa', function()
      require('telescope.builtin').live_grep({
        default_text = '- \\[ \\]',
        prompt_title = 'Toutes les tâches',
      })
    end, { desc = 'Tasks: toutes' })
    -- Ouvrir directement ton fichier todos
    vim.keymap.set('n', '<leader>fa', function()
      vim.cmd('edit ~/notes/todos.md')
    end, { desc = 'Tasks: ouvrir todos.md' })
  end,
}

-- auto close pairs
vim.keymap.set("i", "(", "()<Left>")
vim.keymap.set("i", "[", "[]<Left>")
vim.keymap.set("i", "{", "{}<Left>")
vim.keymap.set("i", "\"", "\"\"<Left>")
vim.keymap.set("i", "'", "''<Left>")

-- vim window navigation keymap
vim.keymap.set("n", "<C-a>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>vn", ":vnew<CR>", {silent = true})

-- mode visuel : indent/désindent sans perdre la sélection
vim.keymap.set("v", "<Tab>", ">gv")
vim.keymap.set("v", "<S-Tab>", "<gv")

vim.keymap.set('n',"<leader>t", function()
  vim.cmd('tabe terminal | term ')
  -- vim.cmd.tabe("terminal")
  -- vim.cmd.term()
  vim.cmd("normal! A")
end)

vim.keymap.set('n',"<leader>nt", function()
  vim.cmd("new | term")
  vim.cmd.wincmd("J")
  vim.cmd("normal! A")
  vim.api.nvim_win_set_height(0, 5)
end)

vim.keymap.set('n',"<leader>vt", function()
  vim.cmd("vnew | terminal")
  vim.cmd("wincmd L")  -- pousse la fenêtre courante tout à droite
  vim.cmd("normal! A")
end)



vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })


vim.keymap.set("n", "<leader>s", function()
  vim.opt.spell = not vim.opt.spell:get()
end)


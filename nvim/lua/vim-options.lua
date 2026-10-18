vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.o.relativenumber = true
vim.opt.colorcolumn ="80,90"
vim.api.nvim_set_hl(0, "ColorColumn", {
  bg = "#1f2330"})

vim.opt.linebreak = true
vim.opt.breakindent = true

-- tab name
function _G.simple_tabline()
  local s = ""

  for i = 1, vim.fn.tabpagenr("$") do
    local win = vim.fn.tabpagewinnr(i)
    local buf = vim.fn.tabpagebuflist(i)[win]
    local name = vim.fn.bufname(buf)

    if name == "" then
      name = "[No Name]"
    else
      name = vim.fn.fnamemodify(name, ":t")
    end

    if i == vim.fn.tabpagenr() then
      s = s .. "%#TabLineSel# " .. name .. " "
    else
      s = s .. "%#TabLine# " .. name .. " "
    end
  end

  return s
end

vim.opt.tabline = "%!v:lua.simple_tabline()"
-- vim.opt.showtabline = 2

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
  vim.cmd.new()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)

vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { silent = true })

-- orhtographe
vim.opt.spell = true
vim.opt.spelllang= {"fr", "en"}


vim.keymap.set("n", "<leader>s", function()
  vim.opt.spell = not vim.opt.spell:get()
end)


-- Convertir --> en →
vim.cmd("iabbrev --> →")
vim.cmd("iabbrev ==> ⇒")
vim.cmd("iabbrev <-> ↔")

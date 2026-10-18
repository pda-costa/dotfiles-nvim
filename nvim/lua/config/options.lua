vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")

vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.splitright = true
vim.opt.splitbelow = true

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

-- orhtographe
vim.opt.spell = true
vim.opt.spelllang= {"fr", "en"}


vim.keymap.set("n", "<leader>s", function()
  vim.opt.spell = not vim.opt.spell:get()
end)


-- Convertir --> en →
vim.cmd("iabbrev --> →")
vim.cmd("iabbrev ==> ⇒")
vim.cmd("iabbrev :--> ╰─► ")
vim.cmd("iabbrev _--> ↳ ")
vim.cmd("iabbrev <-> ↔")

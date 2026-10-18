-- 1. On dit à Vim : "le folding est calculé par une expression"
vim.opt_local.foldmethod = "expr"

-- 2. On donne à Vim la fonction qui décide où plier
vim.opt_local.foldexpr = "v:lua.MarkdownFoldExpr()"

-- 3. Folding activé et tout ouvert au départ
vim.opt_local.foldenable = true
vim.opt_local.foldlevelstart = 99

-- 4. Fonction SIMPLE : plier selon les titres Markdown
function _G.MarkdownFoldExpr()
  local line = vim.fn.getline(vim.v.lnum)

  -- Si la ligne commence par #, ##, ###, etc.
  -- local hashes = line:match("^(#+)%s")
  local hashes = line:match("^%s*(#+)%s+")

  if hashes then
    return ">" .. #hashes
  end
  
  -- 2. Lignes vides → CONTINUENT le niveau précédent
  -- if line:match("^%s*$") then
  --   return vim.fn.foldlevel(vim.v.lnum - 1)
  -- end

  -- Ligne vide → continue la section courante
  if line:match("^%s*$") then
    return "="
  end

  -- Sinon, on ne change rien
  return "="
end

-- 5. Tab = ouvrir / fermer un fold (comme Neogit)
vim.keymap.set("n", "<Tab>", "za", { buffer = true, silent = true })
vim.keymap.set("n", "<S-Tab>", "zA", { buffer = true, silent = true })


-- Définition des serveurs
local util = require("lspconfig/util")



vim.lsp.config.pyright = {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },


  root_dir = function()
    return vim.loop.cwd()
  end,

 -- root_dir = function(fname)
--    --return util.find_git_ancestor(fname)
--    return util.root_pattern("pyrightconfig.json")(fname) 
--        or vim.loop.cwd()
--  end,
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        --diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
      }
    }
  },
}

vim.lsp.enable("pyright")
--vim.lsp.config.pyright.capabilities = capabilities

vim.lsp.config.clangd = {
  cmd = { "clangd" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
}

vim.lsp.config.bashls = {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
}

vim.lsp.config.fortls = {
  cmd = { "fortls" },
  filetypes = { "fortran" },
}

-- Autostart
vim.api.nvim_create_autocmd("FileType", {
  callback = function(args)
    local server = vim.lsp.config[vim.bo[args.buf].filetype]
    if server then
      vim.lsp.start(server)
    end
  end,
})

vim.diagnostic.config({
  virtual_text = false, -- pas de texte inline permanent
    -- Garder les icônes dans la gutter
  signs = {
    severity = { min = vim.diagnostic.severity.WARN },
  },
    -- Souligner uniquement les erreurs
  underline = {
    severity = vim.diagnostic.severity.ERROR,
  },
  severity_sort = true,
  float = {
    border = "rounded",
    source = "if_many",
  },
})


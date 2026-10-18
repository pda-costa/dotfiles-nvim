local M = {}

M.has_rg = vim.fn.executable("rg") == 1
M.has_stylua = vim.fn.executable("stylua") == 1

return M


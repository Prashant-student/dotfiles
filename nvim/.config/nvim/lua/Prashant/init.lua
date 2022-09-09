require('Prashant.telescope')
require('Prashant.nvim-tree')
require('Prashant.gitsigns')
require('Prashant.lsp')
require('Prashant.treesitter')
require('Prashant.lualine')
require('Prashant.bufferline')
require('Prashant.goconfig')
require('Prashant.cocconfig')
require('Prashant.surrconfig')

if vim.fn.isdirectory(vim.v.argv[2]) == 1 then
  vim.api.nvim_set_current_dir(vim.v.argv[2])
end

local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }
local expr_opts = { noremap = true, expr = true, silent = true }

-- Better indent
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
-- Copy Paste
keymap("v", ",y", "\"+y", default_opts)
keymap("v", ",p", "\"+p", default_opts)

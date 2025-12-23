-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- nested options are documented by accessing them with `.` (eg: `:help nvim-tree.view.mappings.list`).

local keymap = vim.keymap
local nvim_tree = require("nvim-tree")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

keymap.set("n", "<leader>n", function()
    return require("nvim-tree").toggle(false, true)
end, { silent = true, desc = "toggle nvim-tree" })

keymap.set("n", "<C-n>", "<cmd> :NvimTreeToggle<CR>")
keymap.set("n", "<leader>nf", "<cmd> :NvimTreeFocus<CR>")

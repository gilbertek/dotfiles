require("zen-mode").setup {
    window = {
        width = 120,
        options = {
            -- signcolumn = "no", -- disable signcolumn
            number = true, -- disable number
            relativenumber = true, -- disable relative numbers
            list = false, -- disable whitespace characters
        }
    },
}

vim.keymap.set("n", "<leader>zz", function()
    require("zen-mode").toggle()
    vim.wo.wrap = false
    ColorMyPencils()
end)

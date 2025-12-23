-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup {
    signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
    },
}

-- move between hunks
vim.api.nvim_set_keymap('n', ']g', '<cmd>lua require"gitsigns.actions".next_hunk()<CR>', {})
vim.api.nvim_set_keymap('n', '[g', '<cmd>lua require"gitsigns.actions".prev_hunk()<CR>', {})

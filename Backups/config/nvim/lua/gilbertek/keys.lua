-- [[ lua/gilbertek/keys.lua ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }
local term_opts = { silent = true }

-- remap the key used to leave insert mode
keymap("i", "jk", "<ESC>", default_opts)
keymap("t", "jk", "<C-\\><C-n>", default_opts)
-- <leader>jk to clear notifications
keymap({ "n", "v", "x" }, "jk", ":Dismiss<CR>", default_opts)

-- Use Esc to quit builtin terminal
-- keymap("t", "<Esc>", [[<c-\><c-n>]])

-- Tabs
keymap("n", "<leader>t", ":tabnew<CR>")
keymap("n", "<leader>tc", ":tabclose<CR>")
keymap("n", "<Tab>", "<C-w>w", default_opts) --switch to next pane
keymap("n", "<S-Tab>", "<C-w>W", default_opts) --switch to previous pane

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Paste over currently selected text without yanking it
keymap("v", "p", '"_dP', default_opts)
keymap("v", "P", '"_dp', default_opts)

-- Paste non-linewise text above or below current line, see https://stackoverflow.com/a/1346777/6064933
keymap("n", "<leader>p", "m`o<ESC>p``", { desc = "paste below current line" })
keymap("n", "<leader>P", "m`O<ESC>p``", { desc = "paste above current line" })

-- Paste from system clipboard in insert/select mode
keymap("i", "<C-v>", "<C-R>+", default_opts)
keymap("s", "<C-v>", "<BS>i<C-R>+", default_opts)

-- [[ Clipboard / registers ]]
-- Copy text to the end of line, behave like C D
keymap("n", "Y", "y$", default_opts)
-- keymap("n", "Y", '"+yg_', default_opts)

-- Always yank to system clipboard
keymap({ 'n', 'v' }, '<leader>y', '"+y', default_opts)
keymap('n', '<leader>Y', '"+Y', default_opts)

-- Cursor in the middle with moving with <C-d> and <C-u>
keymap('n', '<C-u>', '<C-u>zz', default_opts)
keymap('n', '<C-d>', '<C-d>zz', default_opts)

-- Move to line end
keymap("i", "<C-a>", "<Esc>g_a", default_opts)

-- Move the cursor based on physical lines, not the actual lines.
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Fix accidental line joining during visual block selection
keymap("v", "J", "j", default_opts)
keymap("v", "K", "k", default_opts)

-- Switch buffer
keymap("n", "<S-h>", ":bprevious<CR>", default_opts)
keymap("n", "<S-l>", ":bnext<CR>", default_opts)

-- Save file/buffer with <C-s>
keymap({ 'n', 'i', 'x' }, '<C-s>', '<Esc><cmd>update<CR>', { silent = true, desc = "save buffer" })
keymap('n', '<leader>w', '<CMD>update<cr>', default_opts)
keymap('n', '<leader>W', '<CMD>wall<CR>', default_opts)

-- Save and reload module
keymap("n", "<C-S-s>", "<cmd>lua save_reload_module()<CR>", default_opts)

-- Clear search highlight
keymap("n", "<leader>h", ":nohlsearch<CR>", default_opts)

-- Toggle quickfix
keymap("n", "<Leader>q", "<cmd>QFix<CR>", default_opts)

-- Saves the file if modified and quit
keymap("n", "<leader>q", "<cmd>x<cr>", { silent = true, desc = "quit current window" })

-- Quit all opened buffers
keymap("n", "<leader>Q", "<cmd>qa!<cr>", { silent = true, desc = "quit nvim" })
keymap("n", "<leader>qq", "<cmd>wqa!<cr>", { silent = true, desc = "save all and quit nvim" })

-- Format entire document
keymap("n", "<C-f>", "gg=G''zz<Esc>", default_opts)

-- Toggle spell
keymap("n", "<F10>", "<cmd>setlocal spell!<CR>", default_opts)

-- Remove highlight
keymap("n", "<Leader>h", "<cmd>nohl<CR>", default_opts)

-- Indenting
keymap("n", "<M-]>", ">>", default_opts)
keymap("n", "<M-[>", "<<", default_opts)

-- Continuous visual shifting https://superuser.com/q/310417/736190
keymap("x", "<M-]>", ">gv", default_opts)
keymap("x", "<M-[>", "<gv", default_opts)

-- Window switching
-- Split navigation with <C-[hjkl]>
keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)

-- Zoom Window like a pro
keymap('n', 'Zz', '<C-w>_ | <C-w>|')
keymap('n', 'Zo', '<C-w>=')

-- [[ Splits window resize]]
-- Resize splits with <C-[Arrows]>
keymap('n', "<C-Up>", ":resize -2<CR>")
keymap('n', "<C-Down>", ":resize +2<CR>")
keymap('n', "<C-Left>", ":vertical resize -2<CR>")
keymap('n', "<C-Right>", ":vertical resize +2<CR>")

-- Close split with <C-q>
keymap('n', "<C-q>", "<C-w>q")

keymap('n', '<leader>h', ':<C-u>split<CR>') -- horizontal split
keymap('n', '<leader>v', ':<C-u>vsplit<CR>') -- vertical split

-- Command mode movement
keymap("c", "<C-h>", "<Left>", default_opts)
keymap("c", "<C-l>", "<Right>", default_opts)

-- Move text up and down
-- Move the line using alt and jk https://vim.fandom.com/wiki/Moving_lines_up_or_down
keymap("n", "<A-j>", ":m .+1<CR>==", default_opts)
keymap("n", "<A-k>", ":m .-2<CR>==", default_opts)

-- Visual Block --   -- Move text up and down
keymap("v", "<A-j>", ":m '>+1<CR>gv-gv", default_opts)
keymap("v", "<A-k>", ":m '<-2<CR>gv-gv", default_opts)

-- Toggle wrap
keymap("n", "<F11>", "<cmd>setlocal linebreak! wrap!<CR>", default_opts)

-- Close buffer
-- keymap("n", "<Leader>w", function()
--   if vim.fn.getqflist({ winid = 0 }).winid ~= 0 then
--       return "<cmd>cclose<CR>"
--   else
--       return "<cmd>bd!<CR>"
--   end
-- end, default_opts)

-- Close window without changing layout
keymap("n", "<Leader>c", "<cmd>bp | sp | bn | bd<CR>", default_opts)

-- close all buffer but this one
keymap('n', '<leader>o', ':%bd|e#|bd#<CR>', { desc = 'Close all but' })

-- Center cursor after traversing search
keymap("n", "n", "nzz", default_opts)
keymap("n", "N", "Nzz", default_opts)

-- Mimic shell movements
keymap('i', '<C-E>', '<C-o>$')
keymap('i', '<C-A>', '<C-o>^')

-- Toggle fold (single level)
keymap("n", "<Space>", "foldlevel('.') ? 'za' : '<Space>'", default_opts)

-- [[ buffers ]]
-- Move to the next/previous buffer
keymap('n', '<leader>[', '<CMD>bp<CR>', default_opts)
keymap('n', '<leader>]', '<CMD>bn<CR>', default_opts)

-- Move buffers with <Shift-[hl]>
keymap('n', "<S-h>", ":bp<CR>")
keymap('n', "<S-l>", ":bn<CR>")

-- Close buffer with <Shift-q>
keymap('n', "<S-q>", ":bd<CR>")

-- Navigation in the location and quickfix list
keymap("n", "[l", "<cmd>lprevious<cr>zv", { silent = true, desc = "previous location item" })
keymap("n", "]l", "<cmd>lnext<cr>zv", { silent = true, desc = "next location item" })

keymap("n", "[L", "<cmd>lfirst<cr>zv", { silent = true, desc = "first location item" })
keymap("n", "]L", "<cmd>llast<cr>zv", { silent = true, desc = "last location item" })

keymap("n", "[q", "<cmd>cprevious<cr>zv", { silent = true, desc = "previous qf item" })
keymap("n", "]q", "<cmd>cnext<cr>zv", { silent = true, desc = "next qf item" })

keymap("n", "[Q", "<cmd>cfirst<cr>zv", { silent = true, desc = "first qf item" })
keymap("n", "]Q", "<cmd>clast<cr>zv", { silent = true, desc = "last qf item" })

-- replace current word, ref: ThePrimeagen (fantastic!)
keymap("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Close location list or quickfix list if they are present, see https://superuser.com/q/355325/736190
keymap("n", [[\x]], "<cmd>windo lclose <bar> cclose <cr>", {
    silent = true,
    desc = "close qf and location list",
})

-- Delete a buffer, without closing the window, see https://stackoverflow.com/q/4465095/6064933
keymap("n", [[\d]], "<cmd>bprevious <bar> bdelete #<cr>", {
    silent = true,
    desc = "delete buffer",
})

-- Select all
keymap('n', '<C-a>', 'ggVG')

-- Copy entire buffer.
keymap("n", "<leader>y", "<cmd>%yank<cr>", { desc = "yank entire buffer" })

-- Turn the word under cursor to upper case
keymap("i", "<c-u>", "<Esc>viwUea", default_opts)

-- Turn the current word into title case
keymap("i", "<c-t>", "<Esc>b~lea", default_opts)

-- Edit and reload nvim config file quickly
keymap("n", "<leader>ev", "<cmd>tabnew $MYVIMRC <bar> tcd %:h<cr>", {
    silent = true,
    desc = "open init.lua",
})

keymap("n", "<leader>sv", function()
    vim.cmd([[
      update $MYVIMRC
      source $MYVIMRC
    ]])
    vim.notify("Nvim config successfully reloaded!", vim.log.levels.INFO, { title = "nvim-config" })
end, {
    silent = true,
    desc = "reload init.lua",
})

keymap("n", "<Leader>u", ":UndotreeToggle<CR>", {
    silent = true,
    desc = "toggle undotree",
})

keymap('n', '<Leader>t', [[:TagbarToggle]], default_opts)

-- [[ Terminal ]] --
-- Open terminal in a horizontal split using <Alt-t>
keymap("n", "<M-t>", "<C-w>s<C-w>J:resize -8<CR>:terminal<CR>:setlocal nonumber norelativenumber signcolumn=no<CR>i")
-- <S-q> to kill terminal
keymap("t", "<S-q>", "<C-\\><C-N>:bd!<CR>", term_opts)

-- [[ Formatting]]
-- Indent all document
keymap("n", "==", "gg=G", default_opts)

-- Insert ` in markdown
keymap("n", "<leader>`", "S```<cr>```<esc>P", default_opts)

-- [[ Commentary ]]
-- keymap({'n', 'v'}, '<C-/>', '<Cmd>Commentary<CR>', default_opts)
keymap("n", "<C-/>", ':Commentary<cr>', default_opts)

keymap('n', '<leader>ps', ":PackerCompile<cr>:PackerSync<cr>:TSUpdate<cr>", default_opts) -- Update plugins

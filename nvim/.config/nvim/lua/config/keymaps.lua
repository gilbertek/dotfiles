vim.g.mapleader = ','

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Disabled keymaps
map('n', 'q', '<Nop>')

-- Clear highlights on search when pressing <Esc> in normal mode
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Move to window using the <ctrl> hjkl keys
map('n', '<C-h>', '<C-w>h', { desc = 'Go to Left Window', remap = true })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to Lower Window', remap = true })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to Upper Window', remap = true })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to Right Window', remap = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Up' })

-- buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev Buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next Buffer' })
map('n', '<leader>bb', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>`', '<cmd>e #<cr>', { desc = 'Switch to Other Buffer' })
map('n', '<leader>x', ':bdelete!<cr>', { silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- Add undo break-points
map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')
map('i', ';', ';<c-g>u')

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })
map({ 'i', 'x', 'n', 's' }, '<leader>w', '<cmd>w<cr><esc>', { desc = 'Save File' })

--keywordprg
map('n', '<leader>K', '<cmd>norm! K<cr>', { desc = 'Keywordprg' })

-- better indenting
map('x', '<', '<gv')
map('x', '>', '>gv')

map('n', '[q', vim.cmd.cprev, { desc = 'Previous Quickfix' })
map('n', ']q', vim.cmd.cnext, { desc = 'Next Quickfix' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump({
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    })
  end
end
map('n', '<leader>cd', vim.diagnostic.open_float, { desc = 'Line Diagnostics' })
map('n', ']d', diagnostic_goto(true), { desc = 'Next Diagnostic' })
map('n', '[d', diagnostic_goto(false), { desc = 'Prev Diagnostic' })
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

-- quit
map('n', '<leader>qq', '<cmd>qa<cr>', { desc = 'Quit All' })
map('i', 'jk', '<Esc>')

-- windows
map('n', '<leader>-', '<C-W>s', { desc = 'Split Window Below', remap = true })
map('n', '<leader>|', '<C-W>v', { desc = 'Split Window Right', remap = true })
map('n', '<leader>wd', '<C-W>c', { desc = 'Delete Window', remap = true })

-- close window
map('n', '<leader>c', ':close<cr>', { silent = true })

-- rewrite entire document
map('n', 'cA', 'ggcG')

-- redo
map('n', 'U', '<C-r>')

-- toggle spelling
map('n', '<leader>d', ':set spell!<cr>')

-- conjure: evaluations
map('n', '<leader>e', ':%ConjureEval<cr>')
-- map('n', '<leader>f', ':ConjureEvalCurrentForm<cr>')

-- clojure: (1) Creates conjure log in right-hand window (2) launches REPL in new tab
map(
  'n',
  '<leader>CL',
  ':ConjureLogVSplit<cr><C-w>L:tabnew<cr>:term<cr>ibash ~/.clojure/startserver.sh<Enter><C-\\><C-n>:tabprevious<cr><C-w>h'
)

-- get rid of weird location list error
map('n', '<esc>', '<nop>')

-- 'Q' is some macro playback key. I don't use this.
map('n', 'Q', '<Nop>')

-- place semicolon at end of current line
map('n', '<leader>;', 'mY:s/$/;<cr>:noh<cr>`Y', default_opts)

-- override delete in the void register
map('n', 'd', '"_d', default_opts)

-- override copy to system clipboard register
map('n', 'y', '"+y', default_opts)

-- select all
map('n', '<C-a>', 'ggVG', { desc = 'select all', noremap = true, silent = true })

-- cut to system clipboard (normal mode)
map('n', '<C-x>', '"+d', { desc = 'cut to system clipboard', noremap = true, silent = true })

-- copy to system clipboard (normal mode)
map('n', '<C-c>', '"+y', { desc = 'copy to system clipboard', noremap = true, silent = true })

-- paste from system clipboard (normal mode)
map('n', '<C-v>', '"+p', { desc = 'paste from system clipboard', noremap = true, silent = true })

-- cut to system clipboard (visual mode)
map('x', '<C-x>', '"+d', { desc = 'cut to system clipboard', noremap = true, silent = true })

-- copy to system clipboard (visual mode)
map('x', '<C-c>', '"+y', { desc = 'copy to system clipboard', noremap = true, silent = true })

-- paste from system clipboard (visual mode)
map('v', '<C-v>', '"+p', { desc = 'paste from system clipboard', noremap = true, silent = true })

-- copy the whole paragraph to sys clipboard
vim.api.nvim_set_keymap('n', 'yap', '"+yap', { noremap = true, silent = true })

-- paste from system clipboard (insert mode)
map('i', '<C-v>', '<Esc>"+pa', { desc = 'paste from system clipboard', noremap = true, silent = true })

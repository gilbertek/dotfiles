--[[ lua/gilbertek/opts.lua ]]
local opt = vim.opt

-- [[ Context ]]
opt.colorcolumn = '80' -- str:  Show col for max line length
opt.number = true -- bool: Show line numbers
opt.relativenumber = true -- bool: Show relative line numbers
opt.scrolloff = 4 -- num:  Min num lines of context
opt.signcolumn = "yes" -- str:  Show the sign column
opt.lazyredraw = true -- No redraw during macro, regex execution
opt.conceallevel = 0 -- num: so that `` is visible in markdown files

-- [[ Filetypes ]]
opt.encoding = 'utf8' -- str:  String encoding to use
opt.fileencoding = 'utf8' -- str:  File encoding to use

-- [[ Theme ]]
opt.syntax = "on" -- str:  Allow syntax highlighting
opt.termguicolors = true -- bool: If term supports ui color then enable
opt.guicursor = ""

-- [[ Search ]]
opt.ignorecase = true -- bool: Ignore case in search patterns
opt.smartcase = true -- bool: Override ignorecase if search contains capitals
opt.incsearch = true -- bool: Use incremental search
opt.hlsearch = false -- bool: Highlight search matches

-- [[ Indent/Whitespace ]]
opt.expandtab = true -- bool: Use spaces instead of tabs
opt.shiftwidth = 4 -- num:  Size of an indent
opt.softtabstop = 4 -- num:  Number of spaces tabs count for in insert mode
opt.tabstop = 4 -- num:  Number of spaces tabs count for
opt.smartindent = true -- bool: make indenting smarter again

-- [[ Splits ]]
opt.splitright = true -- bool: Place new window to right of current one
opt.splitbelow = true -- bool: Place new window below the current one

-- [[ Mouse ]]
-- opt.mouse = 'a'
opt.mouse = "nv" -- Enable mouse for normal and visual modes
-- opt.mouse="v"                  -- Allow middle click paste https://github.com/neovim/neovim/issues/2468#issuecomment-236464848

-- [[ Swap file and undo ]]
opt.swapfile = false -- bool: disable  swapfile
opt.backup = false -- bool: disable backup
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- [[ Editing ]]
opt.wrap = false -- bool: display lines as one long line
opt.scrolloff = 8 -- Lead scroll by 8 lines
opt.title = true -- bool: Enable title

-- [[ Clipboard ]]
opt.clipboard:append("unnamedplus")

-- Decrease update time
opt.timeoutlen = 500
opt.updatetime = 300 -- faster completion (4000ms default)

opt.list = true
opt.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

-- -- Set completeopt to have a better completion experience
opt.completeopt = 'menuone,noselect'

-- disable providers
for _, provider in pairs { "python3", "node", "ruby", "perl" } do
    vim.g[string.format("loaded_%s_provider", provider)] = 0
end

-- [[ Python support]]
if vim.fn.has('unix') then
    vim.g.python3_host_prog = '/usr/bin/python3'
elseif vim.fn.has('win32') then
    -- g.python3_host_prog = 'C:/scoop/apps/miniconda3/current/python.exe'
    -- g.python_host_prog	= 'C:/scoop/apps/miniconda2/current/envs/nvimpy2/python.exe'
end
-- if vim.fn.has 'wsl' == 1 then
--   vim.g.clipboard = {
--     copy = {
--       ['+'] = 'win32yank.exe -i --crlf',
--       ['*'] = 'win32yank.exe -i --crlf',
--     },
--     paste = {
--       ['+'] = 'win32yank.exe -o --lf',
--       ['*'] = 'win32yank.exe -o --lf',
--     },
--   }
-- end

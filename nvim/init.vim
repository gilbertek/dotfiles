"""""""""""""""""""""""""""""""""""""""""
" **[ Table of Contents ]*******************
" 1) Basics #basics
"   1.1) Tabs & Indent #tabs
"   1.2) Leader #leader
"   1.3) Omni #omni
"   1.4) UI Basics #ui-basics
"   1.5) Searching #Searching
"   1.6) Folding #Folding
" 2) Plugins #plugins
"   2.1) Filetypes #filetypes
"   2.2) Utilities #utilities
"   2.3) UI Plugins #ui-plugins
"   2.4) Code Navigation #code-navigation
" 3) UI Tweaks #ui-tweaks
"   3.1) Theme #theme
" 4) Navigation #navigation
"   4.1) Keyboard
"   4.2) Mappings
"   4.3) Filetypes Config
" 5) Utilities

" **[ 1) Basics #basics ]********************
" *** 1.1) Tabs & Indent #tabs
set expandtab                   " Replace tabs with spaces in Insert mode.
set shiftwidth=2                " Spaces for each (auto)indent.
set softtabstop=2               " Spaces for tabs when inserting <Tab> or <BS>.
set tabstop=2                   " Spaces that a <Tab> in file counts for.

" *** 1.2) Leader #leader ***
let g:mapleader=','

" *** 1.3) Omni #omni ***
set omnifunc=syntaxcomplete#Complete

"""" 1.4) UI Basics #ui-basics
set relativenumber              " Relative number
set number                      " Precede each line with its line number.
set colorcolumn=80              " Show right column in a highlighted colour.
set diffopt+=vertical
set hidden                      " Hide buffers instead of closing them
set lazyredraw                  " Don't redraw during macros
set splitbelow                  " Put a split beneath the current one
set splitright                  " Put a split to the right the current one
set virtualedit=block           " Visual block mode to go beyond the characters at eof
set showmatch                   " Show matching brackets.
set title                       " Set the title of the iterm tab
set noswapfile                  " Don't save with swap files
set nobackup                    " Don't make a backup before overwriting a file.
set nowritebackup               " Don't make a backup
set hidden                      " Hide when switching buffers instead of unloading.
set mouse=a                     " Enable use of the mouse in all modes.
set lazyredraw                  " macros don't update display
set winfixwidth                 " Keep Nerdtree window fixed between toggles
set inccommand=nosplit          " Search and substitutions
set clipboard+=unnamedplus      " +p paste OS clipboard

"""" 1.5) Searching #Searching
set ignorecase                  " Ignore case when searching
set smartcase                   " Ignore case if search pattern is all lowercase,

"""" 1.6) Folding & scrolling #Folding & scrolling
set foldmethod=indent           " fold based on indent
set foldnestmax=10              " deepest fold is 10 levels
set nofoldenable                " dont fold by default
set foldlevel=1                 " this is just what i use
set scroll=5                    " Nicer scrolling
set scrolloff=1                 " Start scrolling when the cursor is near the edges

set undofile

" **[ 2) Plugins #plugins ]***************
call plug#begin()
"""" 2.1) Filetypes #filetypes
Plug 'elmcast/elm-vim',             { 'for': [ 'elm' ] }
  let g:elm_format_autosave         = 1
  let g:elm_detailed_complete       = 1
  let g:elm_syntastic_show_warnings = 1
  let g:elm_format_fail_silently    = 1
  let g:elm_browser_command         = 'open'
  let g:elm_make_show_warnings      = 1
  let g:elm_setup_keybindings       = 1

Plug 'sheerun/vim-polyglot'
  let g:polyglot_disabled = ['elm', 'go', 'clojure']

  "js configs
  let g:jsx_ext_required               = 0

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
  let g:alchemist#elixir_erlang_src = "/usr/local/opt/asdf/installs/elixir/"
  let g:alchemist_tag_disable       = 1 "Use Universal ctags instead
  let g:alchemist_iex_term_size     = 10

Plug 'vim-erlang/vim-erlang-tags'
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'vim-erlang/vim-erlang-omnicomplete'
Plug 'vim-erlang/vim-erlang-compiler'
  let g:erlang_tags_ignore = '_build'

" Perl
Plug 'vim-perl/vim-perl6', { 'for': 'perl6' }

" Phoenix
Plug 'c-brenn/phoenix.vim'
Plug 'tpope/vim-projectionist'    " required for some navigation features

" Markdown Preview
Plug 'shime/vim-livedown',     { 'do': 'npm install -g livedown' }

Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
  let g:goyo_width         = 80
  let g:goyo_margin_top    = 2
  let g:goyo_margin_bottom = 2
  nnoremap <silent> <leader>z :Goyo<cr>

" Plugins for rails
Plug 'tpope/vim-rails'              " vim-rails
Plug 'tpope/vim-endwise'
Plug 'ngmy/vim-rubocop'
  let g:vimrubocop_keymap = 0

Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
  let g:rspec_command = 'Dispatch rspec --format Fuubar --color {spec}'

" Plugins for Go support
Plug 'jodosha/vim-godebug'
Plug 'fatih/vim-go',                   { 'for': 'go' }
  let g:go_list_type                   = 'quickfix'
  let g:go_fmt_command                 = 'goimports'
  let g:go_highlight_functions         = 1
  let g:go_highlight_methods           = 1
  let g:go_highlight_structs           = 1
  let g:go_highlight_operators         = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_types             = 1
  let g:go_highlight_fields            = 1
  let g:go_highlight_interfaces        = 1
  let g:go_auto_type_info              = 1
  let g:go_auto_sameids                = 1

  " Show the progress when running :GoCoverage
  let g:go_echo_command_info = 1

" LSP client
" Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh', }

" Clojure plugins
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'clojure-vim/acid.nvim'
Plug 'tpope/vim-fireplace'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'markwoodhall/vim-aurepl'

" HTML / CSS
Plug 'mattn/emmet-vim',       { 'for': ['javascript', 'javascript.jsx', 'html'] }
  let g:user_emmet_mode       = 'a'     " Only enable Insert mode functions.
  let g:user_emmet_leader_key = '<tab>' " Using Tab to expand

Plug 'ap/vim-css-color'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'xhtml', 'xml', 'jinja']} " Autocompletes tags.
Plug 'cakebaker/scss-syntax.vim'

" JS
Plug 'chemzqm/vim-jsx-improve'
  let g:javascript_plugin_jsdoc = 1
  let g:javascript_plugin_flow  = 1

Plug 'flowtype/vim-flow'
Plug 'ternjs/tern_for_vim',     { 'do': 'npm install' }
Plug 'elzr/vim-json',           {'for' : 'json'}
  let g:vim_json_syntax_conceal = 0

Plug 'neovimhaskell/haskell-vim',       { 'for': [ 'haskell', 'cabal' ] }  " Haskell
  let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
  let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
  let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
  let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
  let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
  let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`

" Plugins for Database support
" Plug 'vim-scripts/dbext.vim'
Plug 'tpope/vim-db'

" Plugins for Jupyter notebooks
" Plug 'vyzyv/vimpyter'

"""" 2.2) Utilities #utilities
" Automatically match any brackets, parentheses or quotes
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

" Plug 'eraserhd/parinfer-rust'

" Cycle through deopletes auto-completion with the tab key
Plug 'ervandew/supertab'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'

Plug 'powerman/vim-plugin-AnsiEsc'  " Ansi support
Plug 'editorconfig/editorconfig-vim'

Plug 'janko-m/vim-test' " Run tests with varying granularity
  nmap <silent> <leader>t :TestNearest<CR>
  nmap <silent> <leader>T :TestFile<CR>
  nmap <silent> <leader>a :TestSuite<CR>
  nmap <silent> <leader>l :TestLast<CR>
  nmap <silent> <leader>g :TestVisit<CR>
  let test#strategy = 'neovim'

" Easily manage tags files
Plug 'ludovicchabant/vim-gutentags'
  let g:gutentags_cache_dir = '~/.config/nvim/tags'
  let g:gutentags_ctags_exclude = [
        \ 'node_modules',
        \ 'dist',
        \ 'vendor',
        \ 'bower_components',
        \ 'coverage',
        \ '.git'
        \ ]

" calendar application
Plug 'itchyny/calendar.vim'
  let g:calendar_google_calendar = 1
  let g:calendar_google_task     = 1

Plug 'vimwiki/vimwiki'
  let g:vimwiki_global_ext = 0
  let g:vimwiki_list = [{
  \ 'path': '~/Dropbox/Personal/notes/',
  \ 'syntax': 'markdown',
  \ 'index': 'home',
  \ 'ext': '.md',
  \ 'auto_tags': 1
  \ }]

autocmd BufWritePost ~/Dropbox/Personal/notes/* call AutoCommit()

Plug 'scrooloose/nerdtree',      { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  let g:NERDTreeIgnore = [
    \ '\~$',
    \ '\.o$',
    \ '\.pyc$',
    \ '^\.DS_Store$',
    \ '\.db$',
    \ '^node_modules$',
    \ '^__pycache__$',
    \ '^_build$',
    \ '^dist$'
    \ ]
  let g:NERDTreeMinimalUI     = 1
  let g:NERDTreeChDirMode     = 2     " keep working directory set to NERD's root
  let g:NERDTreeBookmarksFile = $HOME . '/.config/nvim/NERDTreeBookmarks'

  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree")
    \ && b:NERDTree.isTabTree()) | q | endif

  nnoremap <leader>n :NERDTreeToggle<cr>
  nnoremap <leader>nb :NERDTreeFromBookmark<Space>
  nnoremap <leader>f :NERDTreeFind<CR>

  " Move blocks of code with ALT+j/k
  Plug 'matze/vim-move'
    let g:move_key_modifier = 'C' " Use Control instead

" Global search
Plug 'eugen0329/vim-esearch'

" Dependencies For tcomment
Plug 'tomtom/tcomment_vim'
  map <silent> <Leader>cc :TComment<CR>
  map <silent> <leader>cl :TCommentInline<cr>

" Jump between quicklist, location (syntastic, etc) items with ease, among other things
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
  nmap s <Plug>Ysurround
  nmap S <Plug>YSurround
  nmap ss <Plug>Yssurround
  nmap Ss <Plug>YSsurround
  nmap SS <Plug>YSsurround
  xmap s <Plug>VSurround
  xmap S <Plug>VgSurround

Plug 'junegunn/vim-easy-align'
  " Start interactive EasyAlign in visual mode (e.g. vipga)
  xmap ga <Plug>(EasyAlign)
  " Start interactive EasyAlign for a motion/text object (e.g. gaip)
  nmap ga <Plug>(EasyAlign)

" Asynchronous file linter
Plug 'w0rp/ale'
  let g:ale_javascript_prettier_use_local_config = 1
  let g:ale_linters = {
  \ 'javascript': ['eslint'],
  \ 'go':         ['gofmt', 'gometalinter'],
  \ }

  let g:ale_fixers = {
  \ 'javascript': ['eslint', 'prettier'],
  \ 'python':     ['isort'],
  \ }
  let g:ale_completion_enabled = 1
  let g:ale_fix_on_save        = 1
  let g:ale_sign_error         = '△' " could use emoji or 'X'
  let g:ale_sign_warning       = '✕' " could use emoji '?'
  let g:ale_echo_msg_format    = '[%linter%] %s [%severity%]'
  let g:ale_statusline_format  = ['⨉ %d', '⚠ %d', '⬥ ok']
  let g:ale_javascript_prettier_options = '--single-quote --no-trailing-comma es5 --semi'

  " Git Plugins
" ---------------
" git support from dat tpope
Plug 'tpope/vim-fugitive'
  nnoremap <leader>gb :Gblame<CR>
  nnoremap <leader>gd :Gdiff<CR>
  nnoremap <leader>gs :Gstatus<CR>
  nnoremap <leader>gc :Gcommit -v<CR>
  nnoremap <leader>gca :Gcommit --amend -v<CR>
  nnoremap <leader>gp :Git push<cr>
  nnoremap <leader>gl :Glog<cr>

  " Add to index with ,ga
  map <leader>ga :silent !git add % &<cr><cr>

" Git Gutter: shows a git diff in the gutter
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'   " NerdTree-git
Plug 'tpope/vim-rhubarb'
" vim interface to web apis.  Required for gist-vim
Plug 'mattn/webapi-vim'
Plug 'junegunn/gv.vim'      "A git commit browser

" create gists trivially from buffer, selection, etc.
Plug 'mattn/gist-vim'
  let g:gist_open_browser_after_post = 1
  let g:gist_detect_filetype         = 2
  let g:gist_post_private            = 1
  if has('macunix')
    let g:gist_clip_command          = 'pbcopy'
  endif

" Visualize undo tree
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
  noremap <Leader>g :GundoToggle<CR>

" Tagbar: a class outline viewer for Vim
Plug 'majutsushi/tagbar'
  let g:tagbar_autofocus   = 1
  let g:tagbar_autoshowtag = 1
  let g:tagbar_width       = 25
  nnoremap <F8> :TagbarToggle<CR>

" fzf fuzzy finder
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  let g:fzf_layout = { 'down': '40%' }

  " Search all files, e.g. node_modules/
  nnoremap <silent> <leader>af :call fzf#vim#files('',
      \ {'source': 'ag --hidden --ignore .git -f -g "" -u', 'down': '40%'})<CR>
  nnoremap <silent> <C-P> :FZF<cr>
  nnoremap <silent> <leader>a :Ag<cr>
  nnoremap <leader>b :Buffers<cr>
  nmap <leader>h :History<cr>
  nmap <leader>f :Files<cr>

  nmap <leader><tab> <plug>(fzf-maps-n)
  xmap <leader><tab> <plug>(fzf-maps-x)
  omap <leader><tab> <plug>(fzf-maps-o)

  augroup localfzf
    autocmd!
    autocmd FileType fzf :tnoremap <buffer> <C-J> <C-J>
    autocmd FileType fzf :tnoremap <buffer> <C-K> <C-K>
    autocmd VimEnter * command! -bang -nargs=* Ag
      \ call fzf#vim#ag(<q-args>,
      \                 <bang>0 ? fzf#vim#with_preview('up:60%')
      \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
      \                 <bang>0)
  augroup END

" Javascript Formatting and development
Plug 'sbdchd/neoformat'
  let g:neoformat_try_formatprg      = 1
  let g:neoformat_basic_format_align = 1 " Enable alignment
  let g:neoformat_basic_format_retab = 1 " Enable tab to spaces conversion
  let g:neoformat_basic_format_trim  = 1 " Enable trimmming of trailing whitespace

Plug 'easymotion/vim-easymotion'

" The interactive scratchpad for hackers.
Plug 'metakirby5/codi.vim'

" **[ 2.3) UI Plugins #ui-plugins ]********************
Plug 'ayu-theme/ayu-vim'
Plug 'w0ng/vim-hybrid'
Plug 'joshdick/onedark.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'KeitaNakamura/neodark.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'tyrannicaltoucan/vim-quantum'
Plug 'rakr/vim-one'

Plug 'Yggdroot/indentLine'
  let g:indentLine_color_term = 8
  let g:indentLine_char = '│'

" Bottom bar with all settings wombat
Plug 'itchyny/lightline.vim'
  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \   'readonly': '%{&readonly? "🔒": ""}',
    \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
    \ },
    \ 'component_visible_condition': {
    \   'readonly': '(&filetype!="help"&& &readonly)',
    \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))'
    \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ },
    \ 'separator': { 'left': '', 'right': '' },
    \ 'subseparator': { 'left': '', 'right': '' }
    \ }
" **[ 2.3) End UI Plugins #ui-plugins ]*****************

"""" 2.4) Code completion & Navigation #code-navigation
" Snippets
" -----------
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
if has('ultisnips')
  let g:UltiSnipsExpandTrigger       = '<tab>'
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
endif

" Autocompletion Engine (neovim) Autocompletion Engine (neovim)
Plug 'Shougo/deoplete.nvim',        { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-clang'
Plug 'sebastianmarkow/deoplete-rust'
Plug 'fishbullet/deoplete-ruby'
Plug 'zchee/deoplete-jedi'          " source for Python
Plug 'zchee/deoplete-go',           { 'do': 'make'}
Plug 'clojure-vim/async-clj-omni'
Plug 'mhartington/nvim-typescript'
Plug 'carlitux/deoplete-ternjs',    { 'for': ['javascript', 'javascript.jsx'] }
  let g:deoplete#sources#ternjs#types = 1
  let g:deoplete#sources#ternjs#docs  = 1
  let g:tern#command = ['tern']
  let g:tern#arguments = ['--persistent']

Plug 'zchee/deoplete-jedi'         " source for Python
Plug 'pbogut/deoplete-elm',         { 'for': 'elm' }
" Plug 'yoru/deoplete-crystal',       { 'for': 'crystal' }
  let g:deoplete#enable_at_startup = 1 " Enable deoplete on startup.
  let g:deoplete#enable_smart_case = 1
  let g:deoplete#keyword_patterns  = {}
  let g:deoplete#keyword_patterns.clojure    = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'

  let g:deoplete#sources#go#gocode_binary    = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#pointer          = 1

  let g:deoplete#sources#rust#racer_binary   = $HOME.'/.cargo/bin/racer'

  let g:deoplete#sources#clang#libclang_path = $BREW_PATH.'/Cellar/llvm/5.0.1/lib/libclang.dylib'
  let g:deoplete#sources#clang#clang_header  = $BREW_PATH.'/opt/llvm/bin/clang'

"""" 2.4) End Code completion & Navigation #code-navigation
call plug#end()
"" Plugin configuration that has to run after plug#end

" **[ 3) UI Tweaks #ui-tweaks ] *********************
"""" 3.1) Theme #theme
if (has('termguicolors'))
  set termguicolors     " True color
endif

set background=dark
""" onedark Color Scheme settings
" colorscheme onedark

""" Ayu Color Scheme settings
let ayucolor="dark"   " for dark version of theme
" colorscheme ayu

""" Hybrid Color Scheme settings
let g:hybrid_reduced_contrast = 1
" colorscheme hybrid

""" Spacegray Color Scheme settings
" colorscheme spacegray

""" base16-vim Color Scheme settings
let base16colorspace=256
" colorscheme base16-eighties

""" codedark Color Scheme settings
" colorscheme codedark

""" Neodark Color Scheme settings
" colorscheme neodark

" colorscheme PaperColor

let g:quantum_black = 1
" silent! colorscheme quantum

colorscheme one
""""""""""""" 3) End UI Tweaks #ui-tweaks

" **[ 4) Navigation #navigation ]*****************
"""" 4.1) Keyboard
map <Left>  :echo "no!"<cr>
map <Right> :echo "no!"<cr>
map <Up>    :echo "no!"<cr>
map <Down>  :echo "no!"<cr>

" Terminal Mode Configuration
tnoremap <Esc> <C-\><C-n>
nnoremap <silent> <bslash> :vsplit term://$SHELL<bar>startinsert<CR>

" Open in TeXShop
nnoremap <leader>tx :!open -a TeXShop %<cr><cr>

" Navigate terminal with C-h,j,k,l
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l

" Navigate splits with C-h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigate tabs with leader+h,l
nnoremap <leader>h :tabprev<cr>
nnoremap <leader>l :tabnext<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>

" switching buffers
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>

" Navigate location
nnoremap ]l :lnext<cr>
nnoremap [l :lprevious<cr>

" Navigate quicklist
nnoremap ]q :cnext<cr>
nnoremap [q :cprevious<cr>

" map tab navigation to Cmd-1 to 9.
map <silent> <D-1> :tabn 1<cr>

" Alt based mapping
noremap <silent><A-t> :$tabnew<cr>
"""" 4.1) End Keyboard

"""" 4.2) Mappings
" Start/ENd of line
map H ^
map L $

" reselect pasted content:
noremap gV `[v`]

" Make `Y` work from the cursor to the end of line
nnoremap Y y$

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Open the alternate file
map ,, <C-^>

" Custom split opening / closing behaviour
map <C-N> :vsp<CR><C-P>
map <C-C> :q<CR>

" Makes foo-bar considered one word
set iskeyword+=-

" Exit insert mode.
inoremap jj <ESC>
inoremap kk <ESC>
nnoremap <Leader>q :close<CR>
nnoremap <leader>x :wq<cr>

nnoremap <leader>s :update<cr>  " Save
nnoremap <Leader>w :w<CR>       " Save

" find merge conflict markers
nnoremap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" re-indent entire file
nmap <leader>i ggVG=

" build sphinx docs
nnoremap <leader>bs :!make html<cr>

" Unselect the search result
map <Leader><Space> :noh<CR>

" Easy indent in Visual mode
vnoremap < <gv
vnoremap > >gv

" execute default register.
nnoremap Q @q

" auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory

" Pressing ,ss will toggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" declutter all windows
nnoremap <leader>o <C-w>o

"" Set working directory
" <leader>cd: Switch to the directory of the open buffer
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Toggle background with <leader>bg
nnoremap <leader>lt :let &background = (&background == "dark"? "light" : "dark")<cr>

" ctrl-v: Paste
cnoremap <c-v> <c-r>"

" U: Redos since 'u' undos
nnoremap U :redo<cr>

" _ : Quick horizontal splits
nnoremap <silent> _ :sp<cr>

" | : Quick vertical splits
nnoremap <silent> <bar> :vsp<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" space open/closes folds
nnoremap <space> za

" tab: Indent (allow recursive)
xmap <tab> >

" shift-tab: unindent (allow recursive)
xmap <s-tab> <

"Grep for current word in git
noremap <c-g> :Ggrep <cword><CR>

" Use tab for completion
inoremap <expr> <Tab>  pumvisible() ? "\<C-n>" : "\<Tab>"

" Select all text
nnoremap vA ggVG
"""" 4.2) End Mappings

" **[ 4.3) Filetypes Config ]**
augroup general
  autocmd!
  " Save anytime we leave a buffer or loses focus
  autocmd BufLeave,FocusLost * :silent! wall
  autocmd CursorHold * silent! checktime

  " vue files need special handling because of their
  " mix of different languages in one file
  autocmd FileType vue syntax sync fromstart

  autocmd BufWritePre,BufLeave,FocusLost * StripWhitespace
  autocmd Filetype gitcommit setlocal spell textwidth=72
  autocmd InsertLeave * set nopaste
augroup END

augroup cursorline
  " Switch between normal and relative line numbers and cursorline
  " when switching modes
  autocmd!
  autocmd InsertEnter,WinEnter * setlocal number cursorline norelativenumber
  autocmd InsertLeave,WinEnter * setlocal relativenumber nocursorline
augroup END

" Vim-Alchemist Mappings
augroup elixir
  autocmd!
  autocmd FileType elixir nnoremap <buffer> <leader>h :call alchemist#exdoc()<CR>
  autocmd FileType elixir nnoremap <buffer> <leader>d :call alchemist#exdef()<CR>
  autocmd FileType elixir setlocal matchpairs=(:),{:},[:]

  " Enable html syntax highlighting in all .eex files
  " autocmd BufReadPost *.html.eex set syntax=html

  autocmd FileType elixir nnoremap <leader>d orequire IEx; IEx.pry<ESC>:w<CR>

  " open iex with current file compiled
  " :!iex %
  " command! Iex :!iex %<cr>
  autocmd FileType elixir nnoremap <leader>e :!elixir %<CR>
  autocmd FileType elixir nnoremap <leader>ee :!iex -r % -S mix<CR>
augroup END

augroup golang
  autocmd!
  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>e <Plug>(go-install)
  au FileType go nmap <leader>t <Plug>(go-test)
  au FileType go nmap <leader>c <Plug>(go-coverage)
  au FileType go nmap <leader>rt <Plug>(go-run-tab)
  au FileType go nmap <Leader>rs <Plug>(go-run-split)
  au FileType go nmap <Leader>d <Plug>(go-doc)
  au FileType go nmap <Leader>rv <Plug>(go-run-vertical)
  au FileType go nmap <Leader>/ :GoInfo<CR>
  au FileType go nmap <Leader>bp :GoToggleBreakpoint<CR>
  au FileType go nmap <Leader>db :GoDebug<CR>
  au FileType go setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4 nolist
augroup END

augroup erlang
  autocmd!
  autocmd BufNewFile,BufRead *.erl setlocal tabstop=4
  autocmd BufNewFile,BufRead *.erl setlocal shiftwidth=4
  autocmd BufNewFile,BufRead *.erl setlocal softtabstop=4
  autocmd BufNewFile,BufRead relx.config setlocal filetype=erlang
augroup END

augroup javascript
  autocmd!
  autocmd BufNewFile,BufRead .babelrc setlocal filetype=json
  autocmd BufNewFile,BufRead .eslintrc setlocal filetype=json

  " Log out the word under the cursor
  nmap <leader>d yiwoconsole.log('<c-r>"', <c-r>");<esc>^

  autocmd FileType javascript setlocal formatprg=prettier\
                                                \--stdin\
                                                \--print-width\ 80\
                                                \--single-quote\
                                                \--trailing-comma\ es5
  autocmd BufWritePre *.{js,jsx,elm,css,scss,json,hs,sql} undojoin | Neoformat
augroup END

augroup rainbow_lisp
  autocmd!
  autocmd FileType lisp,clojure,scheme RainbowParentheses
  nnoremap <leader>rp :RainbowParentheses<CR>
augroup END

augroup viml
  autocmd!
  autocmd BufWinEnter,WinEnter term://* startinsert | setlocal norelativenumber nonumber

  " Reload & easy edit Neovim configuration
  autocmd BufWritePost init.vim source %
  command! Editrc tabnew ~/.config/nvim/init.vim
  command! Loadrc source ~/.config/nvim/init.vim
  command! PU PlugClean <bar> PlugUpdate <bar> PlugUpgrade
augroup END

augroup perl
  au FileType perl6 setlocal noexpandtab shiftwidth=4 tabstop=4 softtabstop=4
augroup END

augroup dotenv
  autocmd BufNewFile,BufRead .tmux.conf*,tmux.conf* setf tmux
  autocmd BufNewFile,BufRead .nginx.conf*,nginx.conf* setf nginx
  autocmd BufNewFile,BufRead *.envrc setlocal filetype=sh
augroup END

augroup ruby
  autocmd!
  " Add pry to debug
  autocmd FileType ruby nnoremap <leader>d obinding.pry<esc>:w<CR>
  autocmd FileType ruby nmap <Leader>r :RuboCop<CR>

  " Migrate and rollback
  autocmd FileType ruby nnoremap <leader>dbm :!bin/rake db:migrate<CR>
  autocmd FileType ruby nnoremap <leader>dbr :!bin/rake db:rollback<CR>

  " ===== Seeing Is Believing =====
  " " Assumes you have a Ruby with SiB available in the PATH
  " " If it doesn't work, you may need to `gem install seeing_is_believing -v
  " 3.0.0.beta.6`
  " " ...yeah, current release is a beta, which won't auto-install
  "
  " " Annotate every line
  autocmd FileType ruby nmap <leader>bb :%!seeing_is_believing --timeout 12
    \ --line-length 500 --number-of-captures 300
    \ --alignment-strategy chunk<CR>;

  "  " Annotate marked lines
  autocmd FileType ruby nmap <leader>bn :%.!seeing_is_believing --timeout 12
    \ --line-length 500 --number-of-captures 300
    \ --alignment-strategy chunk --xmpfilter-style<CR>;

  "  " Remove annotations
  autocmd FileType ruby nmap <leader>bc :%.!seeing_is_believing --clean<CR>;

  "  " Mark the current line for annotation
  autocmd FileType ruby nmap <leader>bm A

  "  " Mark the highlighted lines for annotation
  autocmd FileType ruby vmap <leader>bm :norm A
augroup END

augroup python
  autocmd!
  " Autoinsert ipdb
  au FileType python nnoremap <leader>d oimport ipdb; ipdb.set_trace()<esc>:w<CR>
augroup END
" **[ 4) End Navigation #navigation ]**

" TIPS & TRICKS
"
" Useful insert mode commands:
"   Ctrl-o       for one time normal mode command (zz being most useful)
"   Ctrl-r<reg>  for insertion from a named register
"   Ctrl-b       delete backward a word
"   Ctrl-r=      expression register (eg 43 + 44 --> 87)
"
" Useful cursor positioning and movement commands:
"   zt      move text under cursor to the top
"   zz      move text under cursor to the center
"   zb      move text under cursor to the bottom
"   zl      move text under cursor one character to the left
"   zL      move text under cursor half a screen to the left
"   H       move to top of screen
"   M       move to middle of screen
"   L       move to end of screen
"   g;      move back to where you were last editing
"   mm      set a mark in the current file
"   'm      return back to 'm' mark in the current file
"   mM      set a global mark
"   'M      return back to the global 'M' mark
"   {/}     move between paragraphs
"   (/)     move between sentences
"   ge/gE   move to the end of the previous word/WORD
"   Ctrl-e  scroll file up one line at a time
"   Ctrl-y  scroll file down one line at a time
"
" Completion sub-types when in insert completion-mode initiated via Ctrl-x:
"   Ctrl-f  file name completion based on files in the CWD
"   Ctrl-k  dictionary completion
"   Ctrl-l  line completion
"   Ctrl-o  omni completion
"   Ctrl-]  tag completion
"
" Spelling commands:
"   z=      Suggest spelling correction
"   ]s      Move to next spelling error
"   [s      Move to previous spelling error
"   zg      Add current word to dictionary
"   zw      Delete current word from dictionary
"
" Tag navigation:
"   Ctrl-]  find definition under cursor
"   Ctrl-o  return back from definition
"
" Visual mode commands:
"   gv           repeat last visual selection
"   u/U          change visual selection to lower or upper case
"   vip/vap      visual select paragraph
"   vis/vas      visual select sentence
"   vit/vat      visual select tag
"   :'<,'>!sort  sort visual selection
"   :'<,'>!uniq  uniq visual selection
"   gx           open link in a browser
"
" Substitute in visual block:
"   '<,'>s/\%Vfoo/bar/c
"
" Misc commands:
"   X                  delete backwards
"   gf                 go to file under cursor
"   gq                 format text
"   :r !ls *.txt       read in selected filenames
"   /<term>            search forward for 'term'
"   ?<term>            search backward for 'term'
"   :%s//<new>         replace last search 'term' with 'new'
"   :%s//<new>/c       replace, with confirmation, last search 'term' with 'new'
"   :%s///n            list match count for the last search
"   :g/<pattern>       list all lines containing 'pattern'
"   :g/<pattern>/d     delete all lines containing 'pattern'
"   :v/<pattern>       list all lines NOT containing 'pattern'
"   :v/<pattern>/d     delete all lines NOT containing 'pattern'
"   :g/<pattern/normal @q execute macro 'q' over all lines that match pattern
"
"   /<term>            search for 'term'
"   cgn                replace last search match
"   dgn                delete last search match
"   .                  repeat last change
"
"   % vim $(find **/*.txt)  edit all txt files from the current path down
"   % vim $(ag -l foo)      edit all files that contain foo
"
"   % cat do.vim
"   :%s/term/new/g
"   :wq
"   % vim -es file.txt < do.vim  'sed' style scripted edits
"
"   :h digraph-table             list all displayable characters
"
"   :syntime on      start syntax performance monitoring
"   :syntime report  display sorted list of expensive syntax patterns
"
"   :term            start nvim terminal
"
"   ggVGy            Copy all
"
" Plugin details:
"
"   vim-grepper.vim:
"     '-G extension$ <searchterm>' to restrict ag to a particular file extension
"     '-t<type> <searchterm>' to restrict rg to a particular file type
"
"   vim-bundler:
"     Run 'gem ctags' to generate ctags for installed gems (required just once).
"
"   vim-rails:
"     Use a visual selection in conjunction with ':Rextract <<partial-name>>'
"     to move a block of code from a view to a new partial.
"
"   vim-abolish:
"     :S/<pattern>                     - smartly search for pattern
"
"     :%S/facilit{y,ies}/building{,s}/ - change all facilities to buildings
"     :%S/old_name/new_description/    - old_name --> new_description
"                                        OldName  --> NewDescription
"     :%S/h{2,3}/h{3,2}/               - change all h2 to h3
"
"     crs - change to snake_case
"     crc - change to camelCase
"     crm - change to MixCase
"
"     ~/dotfiles/vim/after/plugin/abolish.vim - list of abbreviations
"
"   vim-commentary:
"     gc                 - comment out a visual block
"
"   vim-surround:
"     Normal mode:
"       ds<surround>     - delete a surround
"       cs<old><new>     - change a surround
"       ysiw<surround>   - add a surround to the current word
"
"     Visual mode:
"       S                - add a surround
"
"     Insert mode:
"       <CTRL-s>         - add a surround
"       <CTRL-s><CTRL-s> - add a new line + surround + indent

" vim:ft=vim:ts=2:sw=2:et:fdm=marker

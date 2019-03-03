" **[ Table of Contents ]*******************
" 1) Basics #basics
"   1.1) Tabs & Indent #tabs
"   1.2) Leader #leader
"   1.3) Omni #omni
"   1.4) UI Basics #ui-basics
"   1.5) Folding #Folding
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
" **[ 1.1) Tabs & Indent #tabs ]********************
set tabstop=4 shiftwidth=4 expandtab " Use spaces for tabs 1 tab == 4 spaces

" **[ 1.2) Leader #leader ]********************
let g:mapleader=','

" **[ 1.3) Omni completion ]********************
set omnifunc=syntaxcomplete#Complete

" **[ 1.4) UI Basics #ui-basics ]********************
set relativenumber              " Relative number
set number                      " Precede each line with its line number.
set colorcolumn=80              " Show right column in a highlighted colour.
set diffopt+=vertical           " Vertical display with vimdiff
set splitbelow                  " Put a split beneath the current one
set splitright                  " Put a split to the right the current one
set virtualedit=block           " Visual block mode to go beyond the characters at eof
set showmatch                   " Show matching brackets/parenthesis.
set title                       " Set the title of the iterm tab
set noswapfile                  " Don't save with swap files
set mouse=a                     " Enable use of the mouse in all modes.
set lazyredraw                  " Don't redraw while executing macros (good performance config)
set winfixwidth                 " Keep Nerdtree window fixed between toggles
set inccommand=nosplit          " Search and substitutions
set clipboard+=unnamedplus      " +p paste OS clipboard
set undofile                    " Set persistent undo
set ignorecase smartcase        " Ignore case when searching
set undodir=~/.config/nvim/undo
"""" 1.6) Folding & scrolling #Folding & scrolling
set foldmethod=syntax           " fold based on indent/syntax
set foldlevelstart=99
" **[ 2) Plugins #plugins ]***************
call plug#begin()

"""" 2.1) Filetypes #filetypes
Plug 'elmcast/elm-vim',      { 'for': [ 'elm' ] }
let g:elm_format_autosave    = 1
let g:elm_detailed_complete  = 1
let g:elm_make_show_warnings = 1
let g:elm_setup_keybindings  = 1

" Plugins for Go support
Plug 'fatih/vim-go',           { 'do': ':GoUpdateBinaries' }
Plug 'jodosha/vim-godebug'
Plug 'buoto/gotests-vim'
let g:go_list_type           = 'quickfix' " Fix for location list
let g:go_fmt_command         = 'goimports'
let g:go_highlight_methods   = 1
let g:go_highlight_structs   = 1
let g:go_highlight_functions = 1
let g:go_auto_sameids        = 1

" Clojure & Lisp development plugins
" Plug 'vim-scripts/slimv.vim'
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp'
Plug 'tpope/vim-fireplace'
Plug 'tpope/vim-sexp-mappings-for-regular-people' , { 'for': ['clojure', 'clojurescript'] }
Plug 'clojure-vim/async-clj-omni'  " Provides completion through deoplete or ncm
Plug 'eraserhd/parinfer-rust',     { 'do': 'cargo build --release' }
Plug 'humorless/vim-kibit',        { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-slamhound',         { 'for': ['clojure', 'clojurescript'] }
Plug 'venantius/vim-cljfmt',       { 'for': ['clojure', 'clojurescript'] }
let g:clj_fmt_autosave = 1
Plug 'luochen1990/rainbow'
let g:rainbow_active = 0

Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled       = ['elm', 'go']
let g:vim_json_syntax_conceal = 0
let g:jsx_ext_required        = 0
let g:rustfmt_autosave        = 1

" Elixir
Plug 'elixir-lang/vim-elixir'
Plug 'slashmili/alchemist.vim'
let g:alchemist#elixir_erlang_src = expand('~/.asdf/installs/elixir/1.7.4/bin/elixir')
let g:alchemist_tag_disable       = 1 "Use Universal ctags instead
let g:alchemist_iex_term_size     = 10
let g:alchemist_tag_map           = '<C-]>'
let g:alchemist_tag_stack_map     = '<C-T>'
let g:alchemist_iex_term_split    = 'split'

Plug 'vim-erlang/vim-erlang-tags',          {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-omnicomplete',  {'for': 'erlang'}
Plug 'vim-erlang/vim-erlang-compiler'
let g:erlang_tags_ignore = '_build'

" Markdown Preview
Plug 'shime/vim-livedown', {'for': 'markdown', 'do': 'npm install -g livedown'}
nmap gm :LivedownToggle<CR>

Plug 'junegunn/goyo.vim',     { 'on': 'Goyo' } " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
let g:goyo_width              = 80
let g:goyo_margin_top         = 2
let g:goyo_margin_bottom      = 2
nnoremap <silent> <leader>z :Goyo<cr>

" Plugins for rails & Phoenix Projects
Plug 'tpope/vim-projectionist'    " Adds some navigation niceties
Plug 'tpope/vim-rails'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'ngmy/vim-rubocop'
let g:vimrubocop_keymap = 0

Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = 'Dispatch rspec --format Fuubar --color {spec}'

" Configuration for Language Server Protocol client
Plug 'derekwyatt/vim-scala'
Plug 'reasonml-editor/vim-reason-plus'
" LanguageClient enhancements: show function signature and inline doc.
Plug 'Shougo/echodoc.vim'
" The language client makes use of a binary, hence the `install.sh`.
" We also need the `next` branch in order to specify a language server's TCP port.
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
let g:LanguageClient_serverCommands = {
      \ 'javascript': ['javascript-typescript-stdio'],
      \ 'typescript': ['javascript-typescript-stdio'],
      \ 'reason':     ['ocaml-language-server', '--stdio'],
      \ 'ocaml':      ['ocaml-language-server', '--stdio'],
      \ 'purescript': ['purescript-language-server --stdio'],
      \ 'ruby':       ['solargraph', 'stdio'],
      \ 'rust':       ['rustup', 'run', 'stable', 'rls'],
      \ }
" Automatically start language servers
let g:LanguageClient_autoStart      = 1

" HTML / CSS / SCSS
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim',     { 'for': ['javascript', 'javascript.jsx', 'css', 'scss', 'html'] }
let g:user_emmet_mode       = 'a'     " Only enable Insert mode functions.
let g:user_emmet_leader_key = '<tab>' " Using Tab to expand
let g:user_emmet_settings   = { 'javascript.jsx': { 'extends': 'jsx' } }

Plug 'flowtype/vim-flow'
Plug 'ternjs/tern_for_vim',     { 'do': 'npm install' }

" Plug 'neovimhaskell/haskell-vim',       { 'for': [ 'haskell', 'cabal' ] }  " Haskell
let g:haskell_enable_quantification   = 1 " to enable highlighting of `forall`
let g:haskell_enable_recursivedo      = 1 " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax      = 1 " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles        = 1 " to enable highlighting of type roles
let g:haskell_enable_static_pointers  = 1 " to enable highlighting of `static`
let g:haskell_backpack                = 1 " to enable highlighting of backpack keywords

Plug 'Shougo/vimproc.vim',            { 'do' : 'make' }
Plug 'parsonsmatt/intero-neovim'
Plug 'eagletmt/neco-ghc',             { 'for': 'haskell' } " Haskell completion
let g:haskellmode_completion_ghc      = 0
let g:necoghc_enable_detailed_browse  = 1
let g:necoghc_use_stack               = 1

Plug 'vim-perl/vim-perl6', { 'for': 'perl6' } " Vim support for Perl 6
Plug 'c9s/perlomni.vim'    " Perl completion
Plug 'zerodogg/vim-mason'
Plug 'wlangstroth/vim-racket'

" Plugins for Database support
Plug 'tpope/vim-db'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'vyzyv/vimpyter' " Plugins for Jupyter notebooks
"""" 2.2) Utilities #utilities
Plug 'sbdchd/neoformat'
let g:neoformat_try_formatprg      = 1
let g:neoformat_basic_format_align = 1

" Automatically match any brackets, parentheses or quotes
Plug 'jiangmiao/auto-pairs'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'xhtml', 'xml', 'jinja']}
Plug 'machakann/vim-highlightedyank'

" Cycle through deopletes auto-completion with the tab key
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = "<c-x><c-o>"
let g:SuperTabClosePreviewOnPopupClose = 1
Plug 'christoomey/vim-tmux-navigator'
Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save         = 1
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'editorconfig/editorconfig-vim'

Plug 'janko-m/vim-test' " Run tests with varying granularity
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
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
      \ 'path':      '~/Dropbox/Personal/Notes/',
      \ 'syntax':    'markdown',
      \ 'ext':       '.md',
      \ 'auto_tags': 1
      \ }]

" VimWiki Config
autocmd BufWritePost ~/Dropbox/Personal/notes/* call AutoCommit()
function! MakeDiaryLink()
  return "~/vimwiki/diary/" . strftime('%Y-%m-%d') . ".md"
endfunction
" nmap <Leader>w<Leader>w :exec "e " . MakeDiaryLink()<CR>

Plug 'scrooloose/nerdtree',      { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
let g:NERDTreeIgnore = [
      \ '\~$',
      \ '\.o$',
      \ '\.pyc$',
      \ '^node_modules$',
      \ '^__pycache__$',
      \ '^_build$'
      \ ]
let g:NERDTreeQuitOnOpen    = 1
let g:NERDTreeMinimalUI     = 1
let g:NERDTreeBookmarksFile = expand('~/.config/nvim/NERDTreeBookmarks')
nnoremap <leader>nb :NERDTreeFromBookmark<Space>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <C-b> :NERDTreeToggle<enter>

" Move blocks of code with Control+j/k
Plug 'matze/vim-move'
let g:move_key_modifier = 'C'

" Dependencies For tcomment
Plug 'tomtom/tcomment_vim'
map <silent> <Leader>cc :TComment<CR>
map <silent> <leader>cl :TCommentInline<cr>
" Adds 'gcp' comment current paragraph (block) using tComment's built-in <c-_>p
nmap <silent><leader>gcp <c-_>p

" Jump between quicklist, location items with ease, among other things
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
nmap s <Plug>Ysurround
nmap S <Plug>YSurround
nmap ss <Plug>Yssurround
nmap Ss <Plug>YSsurround
nmap SS <Plug>YSsurround
xmap s <Plug>VSurround
xmap S <Plug>VgSurround

" Start interactive EasyAlign in visual mode (e.g. vipga/gaip)
Plug 'junegunn/vim-easy-align'
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Asynchronous file linter
Plug 'w0rp/ale'
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['tslint', 'eslint', 'prettier'],
      \ 'go':         ['gofmt', 'gometalinter'],
      \ 'haskell':    ['ghc', 'hlint'],
      \ 'reason':     ['merlin'],
      \ 'ocaml':      ['merlin'],
      \ 'vue':        ['eslint', 'vls'],
      \ 'perl':       ['perl', 'perlcritic'],
      \ }

let g:ale_fixers = {
      \ 'typescript': ['prettier'],
      \ 'python':     ['yapf', 'isort', 'autopep8'],
      \ 'reason':     ['refmt'],
      \ 'ruby':       ['rubocop'],
      \ 'elixir':     ['mix_format'],
      \ 'haskell':    ['hfmt'],
      \ 'rust':       ['rustfmt'],
      \ 'cpp':        ['clang-format'],
      \ 'c':          ['clang-format'],
      \ 'sh':         ['shfmt'],
      \ 'perl':       ['perltidy'],
      \ }
" ☯ ☢ ☣ ☹ ⚑ ⚐ ⚠ 𥉉 ⚓ ⚔ △ ✖ ✗✗ ✔ 👌❗️ Emojis
let g:ale_fix_on_save                 = 1
let g:ale_python_auto_pipenv          = 1
let g:ale_sign_error                  = '✗'
let g:ale_sign_warning                = '𥉉'
let g:ale_echo_msg_format             = '%code: %%s [%linter%/%severity%]'
let g:ale_javascript_prettier_options = '--single-quote --no-trailing-comma es5 --semi'
let g:ale_rust_cargo_use_clippy       = executable('cargo-clippy')
let g:ale_perl_perl_options           = '-c -Mwarnings -Ilib -It/lib'
let g:ale_perl_perlcritic_showrules = 1
nmap [a <Plug>(ale_next_wrap)
nmap ]a <Plug>(ale_previous_wrap)

" Plugins for Git & Gist
Plug 'tpope/vim-fugitive'
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :silent !git add % &<cr><cr>
nnoremap <Leader>gac :silent !git add -A<CR>:Gcommit<CR>

Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'        " NerdTree-git
Plug 'mattn/webapi-vim'                   " Vim interface to web apis
Plug 'junegunn/gv.vim' , {'on': ['Gitv']} " A git commit browser
Plug 'wsdjeg/vim-fetch' "Vim to process line and column jump in paths
Plug 'simnalamburt/vim-mundo', { 'on': 'MundoToggle' } " Vim undo visualizer
nnoremap <Leader>g :MundoToggle<CR>

" create gists trivially from buffer, selection, etc.
Plug 'mattn/gist-vim'
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype         = 1
let g:gist_post_private            = 1
if has('macunix')
  let g:gist_clip_command          = 'pbcopy'
endif

" Tagbar: a class outline viewer for Vim
Plug 'majutsushi/tagbar'
nnoremap <Space>t :TagbarToggle<CR>
let g:tagbar_autoclose  = 1

" fzf fuzzy finder
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
let g:fzf_layout        = { 'down': '35%' }
let g:fzf_files_options = "--preview 'bat --color \"always\" {}'"
nnoremap <silent> <leader>a :Ag<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>f :Files<cr>

Plug 'rhysd/vim-grammarous'        " Grammarous
let g:grammarous#use_vim_spelllang = 1
Plug 'thanthese/Tortoise-Typing'
Plug 'easymotion/vim-easymotion'
Plug 'metakirby5/codi.vim'         " The interactive scratchpad for hackers.
Plug 'ryanoasis/vim-devicons'
Plug 'fmoralesc/vim-tutor-mode'         " Interactive Vim tutorials
" **[ 2.3) UI Plugins #ui-plugins ]********************
Plug 'nightsense/cosmic_latte'
Plug 'w0ng/vim-hybrid'
let g:hybrid_reduced_contrast = 1
Plug 'joshdick/onedark.vim'
Plug 'ajh17/Spacegray.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'tyrannicaltoucan/vim-quantum'
let g:quantum_black = 1
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
let base16colorspace=256

Plug 'Yggdroot/indentLine'
let g:indentLine_char = '⋮'   " Other options ┆│┊︙¦⋮⋮

Plug 'itchyny/lightline.vim' " wombat onedark quantum
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': ' %{exists("*fugitive#head") ? fugitive#head() : ""}',
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())' }
      \ }
" **[ 2.3) End UI Plugins #ui-plugins ]*****************

"""" 2.4) Code completion & Navigation #code-navigation
Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'   " Track the snippets engine.
Plug 'honza/vim-snippets' " Snippets are separated from the engine.
if has('ultisnips')
  let g:UltiSnipsExpandTrigger       = '<tab>'
  let g:UltiSnipsJumpForwardTrigger  = '<tab>'
  let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
endif

" Autocompletion Engine (neovim) Autocompletion Engine (neovim)
Plug 'Shougo/deoplete.nvim',               { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go',                  { 'do': 'make'}
Plug 'tweekmonster/deoplete-clang2'        " C/C++ and Objective-C/C++
Plug 'carlitux/deoplete-ternjs',           { 'for': ['javascript', 'javascript.jsx'] }
Plug 'pbogut/deoplete-elm',                { 'for': 'elm' }
Plug 'zchee/deoplete-jedi'                   " source for Python
let g:deoplete#enable_at_startup           = 1
let g:deoplete#omni#input_patterns         = {}
let g:deoplete#keyword_patterns            = {}
let g:tern#command                         = ['tern']
let g:tern#arguments                       = ['--persistent']
let g:deoplete#sources#jedi#show_docstring = 1
let g:deoplete#keyword_patterns.clojure    = '[\w!$%&*+/:<=>?@\^_~\-\.#]*'
let g:deoplete#omni#input_patterns.elm     = '[^ \t]+'
let g:deoplete#sources#go#gocode_binary    = $GOPATH . '/bin/gocode'
" Deoplete-Clang settings
let g:deoplete#sources#clang#libclang_path = '/usr/local/opt/llvm/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header  = '/usr/local/opt/llvm/lib/clang'

" Elm support
" h/t https://github.com/ElmCast/elm-vim/issues/52#issuecomment-264161975
"""" 2.4) End Code completion & Navigation #code-navigation
call plug#end()
"" Plugin configuration that has to run after plug#end

" **[ 3) UI Tweaks #ui-tweaks ] *********************
set termguicolors
set background=dark
" silent! colorscheme quantum
colorscheme base16-default-dark
" colorscheme cosmic_latte
""""""""""""" 3) End UI Tweaks #ui-tweaks

" **[ 4) Navigation #navigation ]*****************
nnoremap <Left>  :echo "ಠ_ಠ!"<cr>
nnoremap <Right> :echo "ಠ_ಠ!"<cr>
nnoremap <Up>    :echo "ಠ_ಠ!"<cr>
nnoremap <Down>  :echo "ಠ_ಠ!"<cr>

" Jump to previous / next cursor position
nnoremap <A-Left> <C-o>
nnoremap <A-Right> <C-i>

" Navigate terminal and splits windows with C-h,j,k,l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has("nvim")
  " Quit terminal Exit/Navigation
  tnoremap jk <C-\><C-n>
  " Terminal Mode Configuration
  nnoremap <silent><bslash> :48vsplit term://$SHELL<bar>startinsert<CR>
endif

"Use <tab>/<shift> + <tab> to navigate to tabs
" nnoremap <tab>      :tabnext<CR>
nnoremap <C-t> :tabnew<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>

" map tab navigation to Cmd-1 to 9.
map <silent> <D-1> :tabn 1<cr>

" Alt based mapping
noremap <silent><A-t> :$tabnew<cr>

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" loclist
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>

" Buffer nav
nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>

" Open the alternate file with ,, instead of CTRL+SHIFT+6
map ,, <C-^>

" In the quickfix window, <CR> is used to jump to the error under the
" cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

" _ : Quick horizontal splits
nnoremap <silent> _ :sp<cr>

" | : Quick vertical splits
nnoremap <silent> <bar> :vsp<cr>

" Automatic pane split layouts
nnoremap <leader>3 :vsplit<CR>:bn<CR>:vsplit<CR>:bn<CR>
nnoremap <leader>4 :vnew<CR>:bn<CR>:vnew<CR>:bn<CR><C-W><C-L><C-W><C-L>:split<CR>:bn<CR>
"""" 4.1) End Keyboard

"""" 4.2) Mappings
" Use shift-H and shift-L for move to beginning/end. alt map 0 ^
nnoremap H ^
nnoremap L $

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Yank to the end of line
nnoremap Y y$

"Copy to system clipboard
vnoremap <C-c> "+y

" ctrl-v: Paste
cnoremap <c-v> <c-r>

" reselect pasted content:
noremap gV `[v`]

" U: Redos since 'u' undos
nnoremap U :redo<cr>
nnoremap <C-z> :redo<cr>

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Split line (sister to [J]oin lines above)
" The normal use of S is covered by cc, so don't worry about shadowing it.
nnoremap S i<cr><esc>^mwgk:silent! s/\v +$//<cr>:noh<cr>`w

" Makes foo-bar considered one word
set iskeyword+=-

" jj/kk to exit insert mode
inoremap jj <Esc>
inoremap kk <Esc>

" Close a buffer without closing the split
nnoremap <leader>q :bp\|bd#<cr>
nnoremap <leader>Q :bp!\|bd!#<cr>

" Quick-save
nnoremap <Leader>w :w<CR>

" find merge conflict markers
nnoremap <silent><leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Unselect the search result
map <Leader><Space> :noh<CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz

" Easy indent in Visual mode
vnoremap < <gv
vnoremap > >gv

" execute default register.
nnoremap Q @q

" Declutter all windows
nnoremap <leader>o <C-w>o

" Open current directory in Finder
nnoremap <leader>O :!open .<cr>

"" Set working directory of the open buffer <leader>cd
nnoremap <leader>cd :lcd %:p:h<cr>:pwd<cr>

" Toggle background with <leader>bg
nnoremap <leader>lt :let &background = (&background == "dark"? "light" : "dark")<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

" space open/closes folds
nnoremap <space> za

"Grep for current word in git
noremap <c-g> :Ggrep <cword><CR>

" Use tab for completion
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<C-x>\<C-u>\<C-p>"

" Hit Ctrl+A to select all in current buffer
nnoremap <C-a> ggVG

" Open in TeXShop
nnoremap <leader>tx :!open -a TeXShop %<cr><cr>
" build sphinx docs
nnoremap <leader>bs :!make html<cr>

nmap <Leader>// :silent !open -a Devdocs.app '%:p'<CR>
" Auto-create directories for new files.
if exists("*mkdir")
  au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
endif

ab teh the
ab thne then
ab tehn then
ab wnat want

function! TmuxSendKeys(cmd)
  execute 'silent !tmux send-keys -t 2 "' . a:cmd . '" C-m'
  execute 'redraw!'
endfunction

command! -nargs=* TmuxSendKeys call TmuxSendKeys(<q-args>)
"""" 4.2) End Mappings

" **[ 4.3) Filetypes Config ]**
augroup general
  autocmd!
  autocmd BufLeave,FocusLost * :silent! wall " Save on buffer or leave/loses focus
  autocmd CursorHold,CursorHoldI,FocusGained,BufEnter * checktime

  autocmd Filetype gitcommit,markdown setlocal spell textwidth=72
  autocmd InsertLeave * set nopaste " Leave paste mode when leaving insert mode
  autocmd InsertLeave * pc          " Close preview on insert leave
  autocmd BufWinEnter * silent! :%foldopen! " Expand all folds when entering a file
  autocmd FileType toml setl ts=2 sw=2 sts=2 et
  autocmd Filetype markdown nnoremap <Leader>, :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
augroup END

augroup Cursorline
  autocmd!
  " Switch between normal/relative line numbers and cursorline
  autocmd InsertEnter,WinEnter * setlocal number cursorline norelativenumber
  autocmd InsertLeave,WinEnter * setlocal relativenumber nocursorline
augroup END

augroup Language-Server
  autocmd!
  nnoremap <silent><leader>h :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent><leader>d :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent><leader>r :call LanguageClient#textDocument_rename()<CR>
augroup END

augroup JS-Family
  autocmd!
  " Vuejs mix of different languages in one file
  autocmd FileType vue syntax sync fromstart
  autocmd FileType javascript,ocaml setl sw=2 sts=2 et
  autocmd BufNewFile,BufRead .babelrc,.eslintrc setlocal filetype=json
  autocmd BufWritePre *.{js,jsx,ts,tsx,scss,less,rb,mjs,json,graphql,md} Neoformat
  autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ es5
augroup END

augroup ELM-Files
  autocmd!
  autocmd FileType elm nn <buffer><leader>h :ElmShowDocs<CR>
  autocmd FileType elm nn <buffer><leader>m :ElmMakeMain<CR>
  autocmd FileType elm nn <buffer><leader>r :ElmRepl<CR>
augroup END

augroup Lisp-Family
  autocmd!
  " Line up doc strings vertically
  let g:clojure_align_multiline_strings = 1
  autocmd FileType clojure nnoremap <buffer><leader>e :Eval<CR>
  autocmd FileType clojure nnoremap <buffer><leader>rf :%Eval<cr>
  autocmd FileType clojure,timl,scheme,lisp,racket :RainbowToggle
  autocmd FileType clojure,clojurescript nmap <Leader>sh :Slamhound<CR>

  command! CljsConnect :Piggieback (figwheel-sidecar.repl-api/repl-env)
  autocmd FileType clojure nnoremap <buffer> <Leader>rc :FireplaceConnect<cr>

  autocmd FileType clojure nnoremap <A-e> :Eval<CR>
  autocmd FileType clojure vnoremap <A-e> :Eval<CR>
  autocmd FileType clojure nnoremap <C-q> :Last<CR>
  autocmd FileType clojure inoremap <C-q> <Esc>:Last<CR>
  autocmd FileType clojure nnoremap <C-e> :%Eval<CR>
  autocmd FileType clojure inoremap <C-e> <Esc>:%Eval<CR>
augroup END

" Vim-Alchemist Mappings
augroup OTP-Family
  autocmd!
  autocmd FileType elixir nnoremap <buffer><leader>h :call alchemist#exdoc()<CR>
  autocmd FileType elixir nnoremap <buffer><leader>d :call alchemist#exdef()<CR>
  autocmd FileType elixir setlocal matchpairs=(:),{:},[:]

  " Enable html syntax highlighting in all .eex files
  " autocmd BufReadPost *.html.eex set syntax=html
  autocmd FileType elixir nnoremap <leader>db orequire IEx; IEx.pry<ESC>:w<CR>
  autocmd FileType elixir nnoremap <leader>i i\|>IO.inspect<ESC>:w<CR>

  " :Eix => open iex with current file compiled
  command! Iex :!iex %<cr>
  autocmd FileType elixir nnoremap <leader>e :!elixir %<CR>
  autocmd FileType elixir nnoremap <leader>ee :!iex -r % -S mix<CR>
  autocmd BufNewFile,BufRead *.{erl,hrl,xrl,yrl}, relx.config setl filetype=erlang
augroup END

augroup Golang-mappings
  autocmd!
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>e <Plug>(go-install)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage)
  autocmd FileType go nmap <leader>rt <Plug>(go-run-tab)
  autocmd FileType go nmap <Leader>rs <Plug>(go-run-split)
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)
  autocmd FileType go nmap <Leader>rv <Plug>(go-run-vertical)
  autocmd FileType go nmap <Leader>/ :GoInfo<CR>
  autocmd FileType go nmap <Leader>bp :GoToggleBreakpoint<CR>
  autocmd FileType go nmap <Leader>db :GoDebug<CR>
  autocmd Filetype go nmap <leader>ga <Plug>(go-alternate-edit)
  autocmd Filetype go nmap <leader>gav <Plug>(go-alternate-vertical)
augroup END

augroup Terminal
  autocmd!
  " Always enter terminal in insert mode
  autocmd BufWinEnter,WinEnter,TermOpen term://* startinsert
  autocmd BufLeave term://* stopinsert
  autocmd TermOpen * setlocal nonumber norelativenumber

  " Reload & easy edit Neovim configuration
  command! Editrc tabnew ~/.config/nvim/init.vim
  command! Loadrc source ~/.config/nvim/init.vim | redraw | echo 'Init reloaded'
  command! PU PlugClean <bar> PlugUpdate <bar> PlugUpgrade
augroup END

augroup Haskell-Maps
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType haskell nnoremap <silent> <leader>b :!stack build --fast<CR>
  autocmd FileType haskell let g:neoformat_run_all_formatters = 1
  " Use hindent instead of par for haskell buffers
  autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
augroup END

augroup intero-Maps
  autocmd!
  autocmd BufWritePost *.hs InteroReload " autocmdtomatically reload on save.
  autocmd FileType haskell nnoremap <silent> <leader>io :InteroOpen<CR><C-W>H
  autocmd FileType haskell nnoremap <silent> <leader>ih :InteroHide<cr>
  autocmd FileType haskell nnoremap <silent> <leader>if :InteroLoadCurrentFile<CR>
  autocmd FileType haskell nnoremap <silent> <leader>d :InteroGoToDef<CR>
  autocmd FileType haskell nnoremap <silent> <leader>it :InteroType<CR>
  autocmd FileType haskell map <silent> <leader>ii :InteroInfo<cr>
  autocmd FileType haskell map <leader>ic :!echo ":ctags" \| stack ghci<cr>
augroup END

" Quick breakpoints
augroup Auto-Breakpoint
  autocmd!
  autocmd FileType python nnoremap <leader>db oimport ipdb; ipdb.set_trace()<esc>:w<CR>
  autocmd FileType javascript map <silent> <leader>db odebugger;<esc>
  autocmd FileType javascript map<leader>ll yiwoconsole.log('<c-r>"', <c-r>");<esc>^
  autocmd FileType ruby nnoremap <leader>db obinding.pry<esc>:w<CR>
  autocmd FileType clojure map <silent> <leader>db o(require '[hugin.dbg :as dbg])<cr>(comment)<esc>
augroup END

augroup ruby
  autocmd!
  autocmd FileType ruby nmap <Leader>r :RuboCop<CR>
  autocmd FileType ruby,yaml setlocal tabstop=2 shiftwidth=2 softtabstop=2

  " Migrate and rollback
  autocmd FileType ruby nnoremap <leader>dbm :!bin/rake db:migrate<CR>
  autocmd FileType ruby nnoremap <leader>dbr :!bin/rake db:rollback<CR>

  " ===== Seeing Is Believing =====
  " " Assumes you have a Ruby with SiB available in the PATH
  " " If it doesn't work, you may need to `gem install seeing_is_believing -v
  " 3.0.0.beta.6` The current release is a beta, which won't auto-install

  " Annotate every line
  autocmd FileType ruby nmap <leader>bb :%!seeing_is_believing --timeout 12
        \ --line-length 500 --number-of-captures 300
        \ --alignment-strategy chunk<CR>;

  " Annotate marked lines
  autocmd FileType ruby nmap <leader>bn :%.!seeing_is_believing --timeout 12
        \ --line-length 500 --number-of-captures 300
        \ --alignment-strategy chunk --xmpfilter-style<CR>;

  " Remove annotations
  autocmd FileType ruby nmap <leader>bc :%.!seeing_is_believing --clean<CR>;

  " Mark the current line for annotation
  autocmd FileType ruby nmap <leader>bm A

  " Mark the highlighted lines for annotation
  autocmd FileType ruby vmap <leader>bm :norm A
augroup END

" add any local configs that need to be added, if they exist
if filereadable(glob("~/.vimrc.local"))
  source ~/.vimrc.local
endif
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

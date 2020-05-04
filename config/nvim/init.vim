" config/nvim/init.vim

" General options {{
let g:mapleader = ","
set relativenumber                  " Set relative number
set number                          " Precede each line with its line number.
set tw=80                           " auto wrap lines that are longer than that
set diffopt+=vertical               " Vertical display with vimdiff
set splitbelow                      " Put a split beneath the current one
set splitright                      " Put a split to the right the current one
set virtualedit=block               " Virtual cursor go beyond the characters at eof
set showmatch                       " Show matching brackets/parenthesis.
set title                           " Set the title of the iterm tab
set noswapfile                      " Don't save with swap files
set mouse=a                         " Enable use of the mouse in all modes.
set lazyredraw                      " Don't redraw while executing macros (good performance config)
set winfixwidth                     " Keep Nerdtree window fixed between toggles
set inccommand=nosplit              " Search and substitutions
set clipboard+=unnamedplus          " +p paste OS clipboard
set undofile                        " Set persistent undo
set ignorecase smartcase            " Searching behaves like a web browser
set termguicolors                   " Opaque Background
set hidden                          " Backgrounding abandoned buffers
set shortmess+=c                    " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                  " Always show the signcolumn
set updatetime=300                  " Update more often (helps coc)
set undodir=~/.config/nvim/undo     " Undo temp file directory
set foldmethod=syntax               " Fold based on indent/syntax
set foldlevel=99                    " ... but don't close them automatically
set tabstop=4 shiftwidth=4 softtabstop=4 expandtab
" }}

"{{{ Plugins and configurations
call plug#begin()
Plug 'sheerun/vim-polyglot'
let g:polyglot_disabled       = ['elm', 'go']
Plug 'andys8/vim-elm-syntax', { 'for': [ 'elm' ] }
Plug 'bfrg/vim-cpp-modern'

" Clojure & Lisp development plugins
Plug 'wlangstroth/vim-racket', {'for': ['scheme', 'racket']}
Plug 'guns/vim-clojure-static'
Plug 'guns/vim-sexp' | Plug 'tpope/vim-sexp-mappings-for-regular-people'
Plug 'tpope/vim-fireplace'
let g:clojure_align_multiline_strings = 1
Plug 'clojure-vim/async-clj-omni'  " Provides completion through deoplete or ncm
Plug 'eraserhd/parinfer-rust',     { 'for': ['clojure'], 'do': 'cargo build --release' }
Plug 'humorless/vim-kibit',        { 'for': ['clojure', 'clojurescript'] }
Plug 'guns/vim-slamhound',         { 'for': ['clojure', 'clojurescript'] }
Plug 'venantius/vim-cljfmt',       { 'for': ['clojure', 'clojurescript'] }
let g:clj_fmt_autosave = 1
Plug 'luochen1990/rainbow'          " Rainbow parenthesis
let g:rainbow_active = 1

" Elixir
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elixir-lang/vim-elixir',  { 'for': 'elixir' }
let g:alchemist#elixir_erlang_src  = expand('$HOME/.asdf/shims/elixir')
let g:elixir_use_markdown_for_docs = 1
let g:alchemist_tag_disable        = 1 "Use Universal ctags instead

Plug 'vim-erlang/vim-erlang-tags',          { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-omnicomplete',  { 'for': 'erlang' }
Plug 'vim-erlang/vim-erlang-compiler'
let g:erlang_tags_ignore = '_build'

" Instantly preview markdown
Plug 'euclio/vim-markdown-composer', { 'do': 'cargo build --release' }

Plug 'junegunn/goyo.vim',     { 'on': 'Goyo' } " Distraction free
Plug 'junegunn/limelight.vim' " To accompany goyo
let g:goyo_width              = 80
let g:goyo_margin_top         = 2
let g:goyo_margin_bottom      = 2
nnoremap <silent> <leader>z :Goyo<cr>

" Plugins for rails & Phoenix Projects
Plug 'tpope/vim-projectionist'    " Adds some navigation niceties
Plug 'tpope/vim-rails'
Plug 'tpope/vim-repeat'
Plug 'ngmy/vim-rubocop'
let g:vimrubocop_keymap = 0

Plug 'tpope/vim-dispatch'
Plug 'thoughtbot/vim-rspec'
let g:rspec_command = 'Dispatch rspec --format Fuubar --color {spec}'

Plug 'neoclide/coc.nvim',    { 'branch': 'release' } " Language Server Protocol support
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-flutter',
  \ 'coc-go',
  \ 'coc-json',
  \ 'coc-metals',
  \ 'coc-omnisharp',
  \ 'coc-prettier',
  \ 'coc-python',
  \ 'coc-reason',
  \ 'coc-rls',
  \ 'coc-rust-analyzer',
  \ 'coc-snippets',
  \ 'coc-solargraph',
  \ 'coc-tsserver',
  \ ]
let g:coc_snippet_next = '<tab>'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'reasonml-editor/vim-reason-plus'
Plug 'Shougo/echodoc.vim'

" HTML / CSS / SCSS / JS
Plug 'jparise/vim-graphql'
Plug 'valloric/MatchTagAlways', {'for': ['html', 'xhtml', 'xml', 'jinja']}
Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim', {
  \ 'for': ['javascript', 'javascript.jsx', 'css', 'scss', 'html', 'eruby', 'eelixir'] }
let g:user_emmet_mode       = 'a'    " Enable all function in all mode.
let g:user_emmet_leader_key = ','    " Using ,, to expand

Plug 'ndmitchell/ghcid',              { 'rtp': 'plugins/nvim' }
Plug 'eagletmt/neco-ghc',             { 'for': 'haskell' } " Haskell completion
let g:haskellmode_completion_ghc      = 0
let g:necoghc_enable_detailed_browse  = 1
let g:necoghc_use_stack               = 1

Plug 'vim-perl/vim-perl6', { 'for': 'perl6' }   " Vim support for Perl 6
Plug 'c9s/perlomni.vim'                         " Perl completion
Plug 'zerodogg/vim-mason'

" Plugins for Database support
Plug 'tpope/vim-db'
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" Plug 'vyzyv/vimpyter' " Plugins for Jupyter notebooks

Plug 'sbdchd/neoformat'
let g:neoformat_try_formatprg = 1

Plug 'jiangmiao/auto-pairs'             " Automatically match tags, brackets
Plug 'machakann/vim-highlightedyank'
Plug 'christoomey/vim-tmux-navigator'

" For example, try `mux start scala-repl`
Plug 'jpalardy/vim-slime'
let g:slime_target = 'neovim'
let g:slime_vimterminal_config = { "vertical": v:true, "term_finish": "close" }
" let g:slime_target = "tmux"
" let g:slime_default_config = {"socket_name": get(split($TMUX, ","), 0), "target_pane": ":.2"}

Plug 'ntpeters/vim-better-whitespace'
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm = 0

Plug 'editorconfig/editorconfig-vim'
Plug 'janko-m/vim-test'                     " Run tests with varying granularity
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
let test#strategy = 'neovim'

" vim-gutentags {{ "
Plug 'ludovicchabant/vim-gutentags'         " Easily manage tags files
let g:gutentags_project_root     = ['.root', '.git', '.svn', '.hg', '.project']
" let g:gutentags_ctags_tagfile    = '.tags'
let g:gutentags_ctags_extra_args = ['--output-format=e-ctags']
let g:gutentags_cache_dir        = '~/.config/nvim/tags'
let g:gutentags_ctags_exclude    = [
      \ 'node_modules',
      \ 'dist',
      \ 'vendor',
      \ 'coverage',
      \ '.git'
      \ ]
" }} vim-gutentags "

" vim-rooter {{ "
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.root', 'package.json', '.git/']
" }} vim-rooter "

Plug 'itchyny/calendar.vim' " Calendar integration
let g:calendar_google_calendar = 1
let g:calendar_google_task     = 1

Plug 'vimwiki/vimwiki'
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [{
  \ 'path': '~/Projects/devnotes',
  \ 'syntax': 'markdown',
  \ 'ext': 'md',
  \ 'auto_tags': 1
  \ },{
  \ 'path':      '~/Dropbox/Personal/Notes/',
  \ 'syntax':    'markdown',
  \ 'ext':       'md',
  \ 'auto_tags': 1
  \ }]

" VimWiki Config
autocmd BufWritePost ~/Dropbox/Personal/notes/* call AutoCommit()

Plug 'preservim/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
let g:NERDTreeIgnore = ['^\.DS_Store$', '^tags$', '\.git$[[dir]]', '\.idea$[[dir]]', '\.sass-cache$']
let g:NERDTreeMinimalUI   = 1
let g:NERDTreeQuitOnOpen  = 1         " Closes NerdTree when opening a file
nnoremap <leader>nf     :NERDTreeFind<CR>
nnoremap <leader>n      :NERDTreeToggle<CR>

Plug 'tomtom/tcomment_vim'                  " Better commenting
map <silent> <Leader>cc :TComment<CR>
map <silent> <leader>cl :TCommentInline<cr>
" Adds 'gcp' comment current paragraph (block) using tComment's built-in <c-_>p
nmap <silent><leader>cp <c-_>p

" Jump between quicklist, location items with ease, among other things
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
nmap s  <Plug>Ysurround
nmap S  <Plug>YSurround
xmap s  <Plug>VSurround
xmap S  <Plug>VgSurround

Plug 'junegunn/vim-easy-align'  " Interactive EasyAlign in visual mode (e.g. vipga/gaip)
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

Plug 'dense-analysis/ale'       " Asynchronous file linter
let g:ale_linter_aliases = {'vue': ['vue', 'javascript']}
let g:ale_linters = {
      \ 'javascript': ['eslint', 'prettier'],
      \ 'typescript': ['eslint', 'prettier'],
      \ 'elm':        ['elm_ls'],
      \ 'go':         ['gopls'],
      \ 'haskell':    ['ghc', 'hlint', 'stack_build'],
      \ 'reason':     ['merlin'],
      \ 'ocaml':      ['merlin'],
      \ 'vue':        ['eslint', 'vls'],
      \ 'perl':       ['perl', 'perlcritic'],
      \ 'clojure':    ['clj-kondo', 'joker'],
      \ 'ruby':       ['ruby', 'rubocop'],
      \ 'rust':       ['rls'],
      \ }

let g:ale_fixers = {
      \ '*':          ['remove_trailing_lines', 'trim_whitespace'],
      \ 'typescript': ['prettier'],
      \ 'javascript': ['prettier'],
      \ 'json':       ['prettier'],
      \ 'scss':       ['prettier'],
      \ 'sass':       ['prettier'],
      \ 'css':        ['prettier'],
      \ 'python':     ['autopep8', 'black'],
      \ 'reason':     ['refmt'],
      \ 'ruby':       ['rubocop'],
      \ 'scala':      ['scalafmt'],
      \ 'elixir':     ['mix_format'],
      \ 'haskell':    ['hfmt'],
      \ 'rust':       ['rustfmt'],
      \ 'cpp':        ['clang-format'],
      \ 'c':          ['clang-format'],
      \ 'sh':         ['shfmt'],
      \ 'perl':       ['perltidy'],
      \ }
let g:ale_virtualtext_cursor          = 1 "Enable neovim's virtualtext support
let g:ale_virtualtext_prefix          = '→ '
let g:ale_fix_on_save                 = 1
let g:ale_python_auto_pipenv          = 1
let g:ale_lint_on_text_changed        = 0
let g:ale_sign_error                  = '✗'
let g:ale_sign_warning                = '⚠'
let g:ale_javascript_prettier_options = '--single-quote --no-trailing-comma es5 --semi'
let g:ale_rust_cargo_use_clippy       = executable('cargo-clippy')
let g:ale_cpp_clang_options           = '-std=c++17 -Wall'
let g:ale_cpp_clangtidy_checks        = ['*', '-fushsia-*', '-hicpp-*']
let g:ale_perl_perl_options           = '-c -Mwarnings -Ilib -It/lib'
nmap [a <Plug>(ale_next_wrap)
nmap ]a <Plug>(ale_previous_wrap)

Plug 'ruanyl/vim-gh-line'         " Open current line in github
Plug 'tpope/vim-fugitive'         " git support
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gvdiff<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gc :Gcommit -v<CR>
nnoremap <leader>gp :Dispatch Git push<CR>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>ga :silent !git add % &<cr><cr>
nnoremap <Leader>gac :silent !git add -A<CR>:Gcommit<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>
nnoremap <leader>go :silent !tig<CR>:silent redraw!<CR>
" nnoremap <leader>gb :silent !tig blame % +<C-r>=expand(line('.'))<CR><CR>:silent redraw!<CR>

Plug 'airblade/vim-gitgutter'
nmap <silent> ]h :<C-U>execute v:count1 . "GitGutterNextHunk"<CR>
nmap <silent> [h :<C-U>execute v:count1 . "GitGutterPrevHunk"<CR>

Plug 'Xuyuanp/nerdtree-git-plugin'                        " NerdTree-git
Plug 'junegunn/gv.vim',           {'on': ['Gitv']}        " A git commit browser
Plug 'simnalamburt/vim-mundo',    { 'on': 'MundoToggle' } " Vim undo visualizer
nnoremap <Leader>g :MundoToggle<CR>

Plug 'mattn/gist-vim' |  Plug 'mattn/webapi-vim'          " Create gists from buffer, selection.
let g:gist_open_browser_after_post = 1
let g:gist_detect_filetype         = 1
let g:gist_post_private            = 1
if has('macunix')
  let g:gist_clip_command          = 'pbcopy'
endif

Plug 'majutsushi/tagbar'                                  " Tagbar: a class outline viewer for Vim
nnoremap <leader>] :TagbarToggle<CR>

"fuzzy search integration
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim', { 'do': { -> fzf#install() } }
nnoremap <silent> <leader>a :Rg<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>f :Files<cr>

Plug 'thanthese/Tortoise-Typing'
Plug 'rhysd/vim-grammarous'        " Grammarous
let g:grammarous#use_vim_spelllang = 1

Plug 'easymotion/vim-easymotion'      " Make movement a lot faster and easier
" " easymotion search behavior
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

Plug 'metakirby5/codi.vim'            " The interactive scratchpad for hackers.
Plug 'ryanoasis/vim-devicons'         " Pretty icons everywhere
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'fmoralesc/vim-tutor-mode'       " Interactive Vim tutorials
" **[ 2.3) UI Plugins #ui-plugins ]********************
Plug 'arcticicestudio/nord-vim'
let g:nord_cursor_line_number_background = 1
Plug 'nightsense/cosmic_latte'
Plug 'w0ng/vim-hybrid'
let g:hybrid_reduced_contrast = 1
Plug 'ajh17/Spacegray.vim'
Plug 'jacoborus/tender.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'rakr/vim-one'
Plug 'chriskempson/base16-vim'
let base16colorspace=256
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'sainnhe/edge'

Plug 'Yggdroot/indentLine'          " Show indentation lines
let g:indentLine_char = '·'  " Other options ┆│┊︙¦⋮

Plug 'itchyny/lightline.vim' " wombat codedark
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [[ 'mode', 'paste' ],
      \            [ 'cocstatus', 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ 'component': {
      \   'fugitive': ' %{exists("*fugitive#head") ? fugitive#head() : ""}',
      \ },
      \ 'component_visible_condition': {
      \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())' },
      \ }

Plug 'epilande/vim-react-snippets'
Plug 'SirVer/ultisnips'               " Track the snippets engine.
Plug 'honza/vim-snippets'             " Snippets are separated from the engine.
" }}}
"""" 2.4) End Code completion & Navigation #code-navigation
call plug#end()
"" Plugin configuration that has to run after plug#end

" **[ 3) UI Tweaks #ui-tweaks ] *********************
set background=dark
"  colorscheme base16-default-dark
" colorscheme base16-onedark
" colorscheme base16-phd
" colorscheme base16-porple
" colorscheme base16-snazzy
" colorscheme codedark
colorscheme tender
" colorscheme nord
" colorscheme edge

" **[ 4) Navigation #navigation ]*****************
nnoremap <Left>  :echo "ಠ_ಠ!"<cr>
nnoremap <Right> :echo "ಠ_ಠ!"<cr>
nnoremap <Up>    :echo "ಠ_ಠ!"<cr>
nnoremap <Down>  :echo "ಠ_ಠ!"<cr>

" Quick window navigation
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
tnoremap <silent> <C-h> <C-\><C-n><C-w>h
tnoremap <silent> <C-j> <C-\><C-n><C-w>j
tnoremap <silent> <C-k> <C-\><C-n><C-w>k
tnoremap <silent> <C-l> <C-\><C-n><C-w>l

" Jump to previous / next cursor position
nnoremap <A-Left> <C-o>
nnoremap <A-Right> <C-i>

if has("nvim")
  " Quit terminal Exit/Navigation
  tnoremap jk <C-\><C-n>
  " Terminal Mode Configuration
  nnoremap <silent><bslash> :48vsplit term://$SHELL<bar>startinsert<CR>
  nnoremap <C-q>s :<C-u>split +term<CR>
  nnoremap <leader>tt :vnew term://bash<CR>
endif

" Tab navigation keymaps
nnoremap <silent>tn :tabnew<CR>
nnoremap <leader>te :tabedit %<cr>

" Switch tab
nnoremap <Tab> :tabnext<CR>
nnoremap <S-Tab> :tabprev<CR>

" Resize window Alt + Arrow
nnoremap <silent> <A-Left>  :vertical resize +5<CR>
nnoremap <silent> <A-Right> :vertical resize -5<CR>
nnoremap <silent> <A-Down>  :resize +5<CR>
nnoremap <silent> <A-Up>    :resize -5<CR>

" Move and format selection with J K
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" quickfix
nnoremap [q :cprevious<CR>
nnoremap ]q :cnext<CR>

" loclist
nnoremap [l :lprevious<CR>
nnoremap ]l :lnext<CR>

" Buffer nav
nnoremap <silent>[b :bprevious<CR>
nnoremap <silent>]b :bnext<CR>

" Jum to the last edited file
nnoremap <leader><leader> <C-^>

" Search and replace
nnoremap <leader>S :%s//gI<Left><Left><Left>

" Quick horizontal splits
nnoremap ss :split<CR><C-w>w
nnoremap sv :vsplit<CR><C-w>w

" Automatic pane split layouts
nnoremap <leader>3 :vsplit<CR>:bn<CR>:vsplit<CR>:bn<CR>
nnoremap <leader>4 :vnew<CR>:bn<CR>:vnew<CR>:bn<CR><C-W><C-L><C-W><C-L>:split<CR>:bn<CR>

" Use shift-H and shift-L for move to beginning/end of line. alt map 0 ^
nnoremap H ^
nnoremap L $
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>

" Emacs like movement in Insert mode
inoremap <C-c> <ESC>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-d> <Del>
inoremap <C-n> <Down>
inoremap <C-p> <Up>

" Remap j and k to move cursor as usual through wrapped lines
nnoremap j gj
nnoremap k gk

" Yank to the end of line
nnoremap Y y$

"Copy to system clipboard
vnoremap <C-c> "+y

" Copy the path of the current file
nnoremap <leader>yf :let @" = expand("%")<CR>

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

" When working on a thinkpad
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Disable middle mouse button
noremap <MiddleMouse>   <Nop>
noremap <2-MiddleMouse> <Nop>
noremap <3-MiddleMouse> <Nop>
noremap <4-MiddleMouse> <Nop>

" Close a buffer without closing the split
nnoremap <leader>q :bp\|bd#<cr>
nnoremap <leader>Q :bp!\|bd!#<cr>

" Quick-save
nnoremap <leader>w     :w<CR>
nnoremap <silent><C-S> :update<CR>

" find merge conflict markers
nnoremap <silent><leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" Unselect the search result
map <Leader><Space> :noh<CR>

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
" space open/closes folds
nnoremap <space> za

" Easy indent in Visual mode
vnoremap < <gv
vnoremap > >gv

" execute default register.
nnoremap Q @q

" Declutter all windows
nnoremap <leader>o <C-w>o

" Open current directory in Finder
nnoremap <leader>O :!open .<cr>

" +/-: Increment number
nnoremap + <c-a>
nnoremap - <c-x>

"Grep for current word in git
noremap <c-g> :Ggrep <cword><CR>

" Use <tab> to trigger completion
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Navigate with tab and s-tab
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <C-e>   pumvisible() ? "\<C-e>" : "\<End>"
inoremap <expr> <C-j>   pumvisible() ? '<C-n>'  : ''
inoremap <expr> <C-k>   pumvisible() ? '<C-p>'  : ''

" Use enter to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Symbol renaming and Refactor.
nmap <silent> <leader>rn  <Plug>(coc-rename)
nmap <silent> <leader>R   <Plug>(coc-refactor)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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

function! TmuxSendKeys(cmd)
  execute 'silent !tmux send-keys -t 2 "' . a:cmd . '" C-m'
  execute 'redraw!'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

command! -nargs=* TmuxSendKeys call TmuxSendKeys(<q-args>)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

augroup general
  autocmd!
  autocmd BufLeave,FocusLost * :silent! wall
  autocmd BufEnter,FocusGained * checktime

  autocmd Filetype gitcommit,markdown setlocal spell textwidth=72 conceallevel=0
  autocmd BufEnter PULLREQ_EDITMSG setlocal filetype=gitcommit
  autocmd InsertLeave * set nopaste " Leave paste mode when leaving insert mode
  autocmd InsertLeave * pc          " Close preview on insert leave
  autocmd BufWinEnter * silent! :%foldopen! " Expand all folds when entering a file
  autocmd Filetype markdown nnoremap <Leader>, :w<cr>:!pandoc % \| lynx -stdin<cr>:redraw!<cr>
  autocmd FileType make setlocal noexpandtab
  autocmd FileType java setlocal omnifunc=javacomplete#Complete
  autocmd BufNewFile,BufRead .env.* setfiletype sh
  autocmd FileType ruby nmap <Leader>r :RuboCop<CR>
  autocmd FileType ruby,yaml,ocaml,javascript setl tabstop=2 shiftwidth=2 softtabstop=2
  autocmd FileType go set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
  autocmd FileType vue syntax sync fromstart
  au BufRead,BufNewFile .{eslintrc,prettierrc} set filetype=json
  autocmd BufNewFile,BufRead .{babel,eslint,jshint,prettier}rc setlocal filetype=json
  autocmd FileType javascript setlocal formatprg=prettier\ --stdin\ --single-quote\ es5
  " set up default omnifunc
  autocmd FileType *
        \ if &omnifunc == "" |
        \    setlocal omnifunc=syntaxcomplete#Complete |
        \ endif
  " Close preview window when completion is done
  autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END

augroup Cursorline
  autocmd!
  autocmd InsertEnter,WinEnter * setlocal number cursorline norelativenumber
  autocmd InsertLeave,WinEnter * setlocal relativenumber nocursorline
augroup END

augroup Coc-Mapping
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')

  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')

  autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
augroup END

augroup Lisp-Family
  autocmd!
  " Line up doc strings vertically
  let g:clojure_align_multiline_strings = 1
  autocmd FileType clojure nnoremap <buffer><leader>e :Eval<CR>
  autocmd FileType clojure nnoremap <buffer><leader>rf :%Eval<cr>
  autocmd FileType clojure,clojurescript nmap <Leader>sh :Slamhound<CR>

  command! CljsConnect :Piggieback (figwheel-sidecar.repl-api/repl-env)
  autocmd FileType clojure nnoremap <buffer> <Leader>rc :FireplaceConnect<cr>

  autocmd FileType clojure nnoremap <C-e> :%Eval<CR>
  autocmd FileType clojure nnoremap <Leader>E :%Eval<CR>
  au FileType clojure nmap <Leader>R cqp(require 'clojure.tools.namespace.repl) (clojure.tools.namespace.repl/refresh)<CR>
  autocmd FileType clojure nnoremap <leader>pp :let parinfer_mode = "paren"<CR>:echo 'Switched to paren mode'<CR>
  autocmd FileType clojure nnoremap <leader>pi :let parinfer_mode = "indent"<CR>:echo 'Switched to indent mode'<CR>
  autocmd BufRead,BufNewFile *.sbt set filetype=scala
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" Vim-Alchemist Mappings
augroup OTP-Family
  autocmd!
  autocmd FileType elixir nnoremap <buffer><leader>h :call alchemist#exdoc()<CR>
  autocmd FileType elixir nnoremap <buffer><leader>d :call alchemist#exdef()<CR>
  autocmd FileType elixir setlocal matchpairs=(:),{:},[:]

  " Enable html syntax highlighting in all .eex files
  autocmd BufReadPost *.html.eex set syntax=html
  autocmd FileType elixir nnoremap <leader>db orequire IEx; IEx.pry<ESC>:w<CR>
  autocmd FileType elixir nnoremap <leader>i i\|>IO.inspect<ESC>:w<CR>

  " :Eix => open iex with current file compiled
  command! Iex :!iex %<cr>
  autocmd FileType elixir nnoremap <leader>e :!elixir %<CR>
  autocmd FileType elixir nnoremap <leader>ee :!iex -r % -S mix<CR>
  autocmd BufNewFile,BufRead *.{erl,hrl,xrl,yrl}, relx.config setl filetype=erlang
augroup END

augroup Terminal
  autocmd!
  " Always enter terminal in insert mode
  autocmd BufWinEnter,WinEnter,TermOpen term://* startinsert
  autocmd TermOpen * setlocal nonumber norelativenumber

  " Reload & easy edit Neovim configuration
  command! Editrc tabnew ~/.config/nvim/init.vim
  command! Loadrc source ~/.config/nvim/init.vim | redraw | echo 'Init reloaded'
  command! PU PlugClean! | PlugUpdate! | PlugUpgrade
augroup END

augroup Haskell-Maps
  autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc
  autocmd FileType haskell nnoremap <silent> <leader>b :!stack build --fast<CR>
  autocmd FileType haskell let g:neoformat_run_all_formatters = 1
  " Use hindent instead of par for haskell buffers
  autocmd FileType haskell let &formatprg="hindent --tab-size 2 -XQuasiQuotes"
  autocmd FileType haskell map <silent> <leader><cr> :noh<cr>:GhcModTypeClear<cr>
augroup END

" Quick breakpoints
augroup Auto-Breakpoint
  autocmd!
  autocmd FileType python nnoremap <leader>db oimport ipdb; ipdb.set_trace()<esc>:w<CR>
  autocmd FileType javascript map <silent> <leader>db odebugger;<esc>
  autocmd FileType javascript map<leader>lg yiwoconsole.log('<c-r>":', <c-r>");<Esc>^
  autocmd FileType javascript map<leader>ll yiwoconsole.log(`%s=${%s}`);<Esc>^

  autocmd FileType rust map<Leader>db yiwodebug!("<c-r>"={:?}", &<c-r>");<Esc>^
  autocmd FileType ruby nnoremap <leader>lg obinding.pry<esc>:w<CR>
  autocmd FileType clojure map <silent> <leader>db o(require '[hugin.dbg :as dbg])<cr>(comment)<esc>
  autocmd FileType clojure map <silent><leader><leader>b 'saa((i./spy <esc>'
  " let b:printf_pattern = 'System.out.println(String.format("%s", %s));'
  autocmd FileType java map <silent><leader>lg oLog.info("XXX: ");<esc>
  autocmd FileType lua map  <silent><leader>lg owrite_file('dbg.txt', require('inspect')(foo)..'\n', true, true)<esc>
augroup END

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
" vim: set sw=2 ts=2 sts=2 et tw=78 foldmarker={{,}} foldmethod=marker foldlevel=0:

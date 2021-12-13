" To look into in future:
" Lower half of http://nerditya.com/code/guide-to-neovim/

" Map the leader key to SPACE
nmap <space> <leader>
tnoremap <Esc> <C-\><C-n>

" Plugins
call plug#begin('~/.config/nvim/plugged')
Plug 'kopischke/vim-fetch'
Plug 'roman/golden-ratio'
let g:golden_ratio_exclude_nonmodifiable = 1
"Plug 'Glench/Vim-Jinja2-Syntax'

" Colour scheme
if exists('g:GuiLoaded') || $TERM == "xterm-256color"
    Plug 'chriskempson/base16-vim'
endif

if exists('g:GtkGuiLoaded')
    source /usr/share/nvim-gtk/runtime/plugin/nvim_gui_shim.vim
    call rpcnotify(1, 'Gui', 'Option', 'Tabline', 0)
    NGPreferDarkTheme on
    "nnoremap <leader>a :NGToggleSidebar<CR>
endif

Plug 'alexlafroscia/postcss-syntax.vim'
Plug 'sheerun/vim-polyglot'
Plug 'othree/es.next.syntax.vim'
Plug 'neo4j-contrib/cypher-vim-syntax'
Plug 'chrisbra/Recover.vim'
Plug 'bogado/file-line'
Plug 'neoclide/jsonc.vim'

Plug 'cdata/vim-tagged-template'
let g:taggedtemplate#tagSyntaxMap = {
  \ "html": "html",
  \ "xml": "xml",
  \ "md":   "markdown",
  \ "css":  "css" }
autocmd FileType javascript,typescript : call taggedtemplate#applySyntaxMap()

" Disabled because it conflicts with YCM
" TODO figure out how to get them to work together
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
"autocmd FileType kotlin let b:coc_root_patterns = ['.gradle']

Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow
nnoremap <silent> <S-F6> :cn<CR>
nnoremap <silent> <S-F5> :cp<CR>

Plug 'vim-scripts/TaskList.vim'
Plug 'vimlab/split-term.vim'

"Use YouCompleteMe
Plug 'Valloric/YouCompleteMe'
let g:python_host_prog = '/usr/bin/python3'
let g:python3_host_prog = '/usr/bin/python3'
let g:ycm_python_binary_path= '/usr/bin/python3'
let g:ycm_path_to_python_interpreter = '/usr/bin/python3'
let g:ycm_server_python_interpreter = '/usr/bin/python3'
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:jedi#completions_enabled = 0
if &completefunc != '' | let &omnifunc=&completefunc | endif
let g:ycm_semantic_triggers =  {
\   'perl' : ['->'],
\   'php' : ['->', '::'],
\   'cs,java,javascript,d,python,perl6,scala,vb,elixir,go' : ['.'],
\   'vim' : ['re![_a-zA-Z]+[_\w]*\.'],
\ }
nnoremap <leader>gt :YcmCompleter GoTo<CR>" Close the documentation window when completion is done
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
set completeopt=menu,longest,menuone

" CtrlP
Plug 'ctrlpvim/ctrlp.vim'
nnoremap <leader>e :CtrlP<CR>
nnoremap <leader>b :CtrlPBuffer<CR>
"nnoremap <leader>t :CtrlPBufTag<CR>
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

Plug 'alvan/vim-closetag'

Plug 'w0rp/ale'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_linters = {
\    'python': ['flake8', 'black', 'mypy'],
\    'javascript.jsx': ['stylelint, eslint'],
\    'graphql': ['gqlint'],
\    'typescript': ['eslint', 'tslint'],
\}

let g:ale_linter_aliases = {'jsx': 'css'}

"Plug 'vim-syntastic/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_javascript_checkers = ['eslint']
"let g:syntastic_php_checkers = ['php', 'phpmd']
"let g:syntastic_css_checkers = ['stylelint']
"let g:syntastic_scss_checkers = ['stylelint']
"let g:syntastic_less_checkers = ['stylelint']
"let g:syntastic_python_checkers = ['flake8']
"let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_coffee_coffeelint_args = "-f ~/.coffeelint.json --csv"

Plug 'vim-airline/vim-airline'
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 150,
    \ }

nnoremap ll :lfirst<CR>
nnoremap ln :lnext<CR>
nnoremap lp :lprevious<CR>

Plug 'scrooloose/nerdcommenter'

nmap <M-c> <leader>c<space>

"Plug 'has2k1/vim-dmenu-finder'
"let g:dmenu_finder_dmenu_command="dmenu -i -l 20"
"nnoremap <leader>e :DmenuFinderFindFile<CR>
"nnoremap <leader>b :DmenuFinderFindBuffer<CR>

" NyaoVim plugins
"Plug 'rhysd/nyaovim-popup-tooltip'
"Plug 'rhysd/nyaovim-markdown-preview'
"Plug 'rhysd/nyaovim-mini-browser'


Plug 'editorconfig/editorconfig-vim'

Plug 'inkarkat/vim-ingo-library'
Plug 'inkarkat/vim-IndentConsistencyCop'
"Plug 'inkarkat/vim-IndentConsistencyCopAutoCmds'

Plug 'AndrewRadev/linediff.vim'


" Add plugins to &runtimepath
call plug#end()

if $TERM == "xterm-256color"
    set termguicolors
    colorscheme base16-atelier-forest
    hi Search guifg=black  "make search highlighting more readable
else
    colorscheme slate
endif

set background=dark
set colorcolumn=80 "visual indicator for max chars

set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=4           " Render TABs using this many spaces.
set softtabstop=4
set shiftwidth=4        " Indentation amount for < and > commands.
set hidden              " Allow switching buffer without saving
set mouse=a             " Make mouse work as expected

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

set undofile            " Save undo data to a file to enable persistency

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

set autochdir

"Whitespace remover
nmap <leader>w :%s/\s\+$//<CR>


" Relative numbering
function! NumberToggle()
    if(&relativenumber == 1)
        set nornu
        set number
    else
        set rnu
    endif
endfunc

" Toggle between normal and relative numbering.
nnoremap <leader>r :call NumberToggle()<cr>

" Use ; for commands.
nnoremap ; :
" Use Q to execute default register.
nnoremap Q @q

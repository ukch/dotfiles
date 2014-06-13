" DISABLED in favour of vundle
" https://github.com/tpope/vim-pathogen
"runtime bundle/vim-pathogen/autoload/pathogen.vim
"call pathogen#infect()

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'tpope/vim-fugitive'
autocmd QuickFixCmdPost *grep* cwindow

Bundle 'IndentConsistencyCop'
Bundle 'IndentConsistencyCopAutoCmds'
let g:indentconsistencycop_highlighting = 'sgm'
let g:indentconsistencycop_non_indent_pattern = ' \*\%([*/ \t]\|$\)'
" TODO why doesn't this work?
" See http://www.vim.org/scripts/script.php?script_id=1691
"let g:indentconsistencycop_filetypes .= ',scss' 
let g:indentconsistencycop_non_indent_pattern = ' \*[*/ \t]'

Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'tpope/vim-eunuch'
Bundle 'nvie/vim-flake8'
Bundle 'honza/vim-snippets'
Bundle 'elzr/vim-json'

Bundle 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_width = 30
let g:tagbar_indent = 1
let g:tagbar_expand = 2
let g:tagbar_autoshowtag = 1

Bundle "wookiehangover/jshint.vim"
Bundle "bogado/file-line"
Bundle "py-coverage"
nnoremap <silent> <F12> :PyCoverageHighlight<cr>:PyCoverageSetQuickfix<cr>:cwindow<cr>
nnoremap <silent> <S-F12> :PyCoverageClear<cr>
Bundle "sudo.vim"


" MacVim magic
"let macvim_skip_cmd_opt_movement = 1
"no   <M-Left>       <C-Left>
"no!  <M-Left>       <C-Left>
"no   <M-Right>      <C-Right>
"no!  <M-Right>      <C-Right>

" From http://www.phacks.net/macvim-code-completion-syntax-highlighting-for-python-pyqt4-twisted-on-mac-osx-snow-leopard/
set nocompatible
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
"autocmd FileType python setlocal expandtab
filetype on
filetype plugin on
filetype plugin indent on
set ofu=syntaxcomplete#Complete
set tags+=$HOME/.vim/tags/python.ctags
syntax on

" From github.com/spf13/spf13-vim
nnoremap Y y$
cmap w!! w !sudo tee % >/dev/null
let g:SuperTabDefaultCompletionType = "context"

" From http://macvim.org/OSX/index.php
set backupcopy=yes

" F5: Make and QuickFix - from http://daniellopretto.com/better-code-with-jslint-and-vim/
"nnoremap <silent> <F5> :make %<CR>:cw<CR>
nnoremap <silent> <S-F6> :cn<CR>
nnoremap <silent> <S-F5> :cp<CR>

" Disable middle mouse pasting
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>

inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>

" From old config
if exists('+autochdir')
    set autochdir
else
    autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
endif
set autoindent
set hidden " don't force us to save when switching buffers
set relativenumber " show relative line numbers
set autoread " Auto re-read a buffer when written by another application
set encoding=utf-8 " Default file encoding is utf-8
set incsearch " Show search matches as you type
set ignorecase " Usually I don't care about case when searching
set paste " Permit good pasting
set ruler " Enable ruler on status line.
set scrolloff=3 " Keep 3 lines above and below cursor.
set smartcase " Only ignore case when we type lower case when searching
set smarttab " beginning of line tab hits are by shiftwidth, not softtabstop
set wildignore=.svn,CVS,.git,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.pyo
set wildmenu " Better filename completion etc.
set wildmode=longest:full,full " complete only up to the point of ambiguity (while still showing you what your options are)
set hlsearch " search highlighting
set colorcolumn=80 "visual indicator for max chars

" Use the below highlight group when displaying bad whitespace is desired
highlight BadWhitespace ctermbg=red guibg=red
highlight LineTooLong term=inverse,bold cterm=inverse,bold

" For full syntax highlighting:
let python_highlight_all=1
let python_space_errors=1
let python_no_tab_space_error=1

" firefox style tabbing ------------------------------------------------

nmap <D-1> 1gt
nmap <D-2> 2gt
nmap <D-3> 3gt
nmap <D-4> 4gt
nmap <D-5> 5gt
nmap <D-6> 6gt
nmap <D-7> 7gt
nmap <D-8> 8gt
nmap <D-9> 9gt
nmap <D-0> 10gt

nmap <D-Up> :tabnew<CR>
nmap <D-Right> :tabnext<CR>
nmap <D-Left> :tabprevious<CR>

"FuzzyFinder
nmap <leader>e :FufFileWithFullCwd<CR>
nmap <leader>b :FufBuffer<CR>
nmap <leader>v :FufBufferTag<CR>

"Whitespace remover
nmap <leader>w :%s/\s\+$//<CR>

"autocmd FileType javascript set makeprg=jslint\ %
"autocmd FileType python set makeprg=flake8\ %
autocmd FileType python map <buffer> <F5> :call Flake8()<CR>

" More recent additions
set mouse=a
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" TABLE OF CONTENTS
"
" 1. VUNDLE
"   1.1) Language
"   1.2) Completion
"   1.3) Code display
"   1.4) Integrations
"   1.5) Interface
"   1.6) Commands
"   1.7) Other
"
" 2. UI TWEAKS
"   2.1) Syntax highlighting
"   2.2) Tabs, indentation and lines
"   2.3) Interactions
"   2.4) Visual decorations
"
" 3. KEYBOARD SHORTCUT SETUP
"
" 4. VIM ENVIRONMENT HANDLING TWEAKS (NEEDS WORK / RENAMING)
"
" 5. FILE NAVIGATION
"
" 6. AUTO COMMANDS
"   6.1) Filetypes
"   6.1) Normalization

" ------------------------------------------------------------------------------
" 1. VUNDLE
" ------------------------------------------------------------------------------

set nocompatible              " required for Vundle
filetype off                  " required for Vundle

" Initialize vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" --------------------------------------
" 1.1 Language
" --------------------------------------

" HTML
Plugin 'othree/html5.vim'

" Jade/Pug
Plugin 'digitaltoad/vim-jade'

" CSS
Plugin 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plugin 'hail2u/vim-css3-syntax'
Plugin 'cakebaker/scss-syntax.vim'

" JavaScript
Plugin 'pangloss/vim-javascript'
Plugin 'bigfish/vim-eslint'
Plugin 'isRuslan/vim-es6'

" Markdown
" Markdown is now included in vim, but by default .md is read as Modula-2
" files.  This fixes that
autocmd BufNewFile,BufReadPost *.md,*.markdown set filetype=markdown
autocmd FileType markdown set tw=80

" JEKYLL
Plugin 'tpope/vim-liquid'


" --------------------------------------
" 1.2 Completion
" --------------------------------------

Plugin 'mattn/emmet-vim'


" --------------------------------------
" 1.3 Code display
" --------------------------------------

Plugin 'altercation/vim-colors-solarized'


" --------------------------------------
" 1.4 Integrations
" --------------------------------------

" --------------------------------------
" 1.5 Interface
" --------------------------------------

Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" --------------------------------------
" 1.6 Commands
" --------------------------------------

" --------------------------------------
" 1.7 Other
" --------------------------------------



call vundle#end()            " required
filetype plugin indent on    " required





" ------------------------------------------------------------------------------
" 2. UI TWEAKS
" ------------------------------------------------------------------------------

" --------------------------------------
" 2.1 Syntax highlighting
" --------------------------------------

" Detect filetype
filetype plugin on

" 256 colours please
set t_Co=256

" Enable syntax highighting
syntax enable

" Dark solarized scheme
set background=dark
colorscheme solarized

" Italicised comments and attributes
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic
highlight htmlArg cterm=italic

" Add powerline fonts/symbols to vim airline
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'

" Turn on vim-gitgutter by default
let g:gitgutter_enabled = 1


" --------------------------------------
" 2.2 Tabs, indentation and lines
" --------------------------------------

filetype plugin indent on

" 4 spaces
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Round indent to nearest multiple of 4
set shiftround

" Line-wrapping
set wrap
set textwidth=80


" --------------------------------------
" 2.3 Interactions
" --------------------------------------

" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5

" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1

" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]

" Underscores denote words
set iskeyword-=_


" --------------------------------------
" 2.4 Visual decorations
" --------------------------------------"

" Show status line
set laststatus=2

" Show what mode you’re currently in
set showmode

" Show what commands you’re typing
set showcmd

" Allow modelines
set modeline

" Show current line and column position in file
set ruler

" Show file title in terminal tab
set title

" Hybrid line numbering: absolute number on current line; relative elsewhere
set relativenumber
set number

" Limit line-length to 80 columns by highlighting col 81 onward
if exists("+colorcolumn")
    set colorcolumn=81
endif

" Highlight current line
set cursorline

" Don’t keep results highlighted after searching...
set nohlsearch

" ...just highlight as we type
set incsearch

" Ignore case when searching...
set ignorecase

" ...except if we input a capital letter
set smartcase

" Automatically strip trailing spaces on save
autocmd BufWritePre * :%s/\s\+$//e

" ------------------------------------------------------------------------------
" 3. KEYBOARD SHORTCUT SETUP
" ------------------------------------------------------------------------------

" Disable arrow keys force using h,j,k,l
map  <up>    <nop>
imap <up>    <nop>
map  <down>  <nop>
imap <down>  <nop>
map  <left>  <nop>
imap <left>  <nop>
map  <right> <nop>
imap <right> <nop>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Change the default mapping to invoke NERDTree
map <C-n> :NERDTreeToggle<CR>

" Change the default mapping and the default command to invoke CtrlP:
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" ------------------------------------------------------------------------------
" 4. VIM ENVIRONMENT HANDLING TWEAKS (NEEDS WORK / RENAMING)
" ------------------------------------------------------------------------------

" ------------------------------------------------------------------------------
" 5. FILE NAVIGATION
" ------------------------------------------------------------------------------

" CtrlP Ignore certain folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ------------------------------------------------------------------------------
" 6. AUTO COMMANDS
" ------------------------------------------------------------------------------

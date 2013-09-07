" SETUP
" -----
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" $ vim
" :BundleInstall
" and Relaunch vim

set nocompatible

" Vundle configuration
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" (required by vundle) let Vundle manage Vundle
Bundle 'gmarik/vundle'

""""" BUNDLES
Bundle 'klen/python-mode'
Bundle 'sjl/gundo.vim'

" Preferences
colorscheme desert
set backspace=indent,eol,start
syntax on
set showmatch
set ruler
set showmode
set undolevels=2000
set autoindent
set history=500
set wildmenu
set ttyfast
set incsearch
set hlsearch
set mouse=a
set scrolloff=10
set autochdir
set nolist

if has("gui_running")
    set list
    set lcs=tab:»·
    set lcs+=trail:·
    set guioptions-=T " removetoolbar
    set guioptions-=r " remove right-hand scrollbar
endif

" show line cursor
set cursorline
hi CursorLine term=none cterm=none ctermbg=0
hi CursorColumn term=none cterm=none ctermbg=0

" Show trailing whitespaces
highlight WhitespaceEOL ctermbg=red
match WhitespaceEOL /\s\+$/
autocmd WinEnter * match WhiteSpaceEOL /\s\+$/

" Backupdirs
set backupdir=~/.vimbackups
set directory=~/.vimbackups

" When the file changes out of vim, do not pop a window to ask what to do
" (reload the file, all files, do nothing...) and do it in console instead
set guioptions+=c

" load the plugin and indent settings for the detected filetype
filetype plugin indent on
filetype on

""""""""""""""""""""""""""""
" python-mode configuration
""""""""""""""""""""""""""""
" code checker
let g:pymode_lint_checker = "pylint"

" folding
let g:pymode_folding = 0

"""""" PYTHON CONFIGURATION
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set expandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79
au FileType python set cursorcolumn " Show cursor column

"""""" CSS CONFIGURATION
au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"""""" HTML CONFIGURATION
au FileType html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"""""" MARKDOWN CONFIGURATION
au FileType md set noexpandtab " tabs aren't space!

"""""""""""""""""""""
" gundo configuration
"""""""""""""""""""""
" show undo window on F5
nnoremap <F5> :GundoToggle<CR>

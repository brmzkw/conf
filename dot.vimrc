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
"Bundle 'klen/python-mode' " makes my vim crash :(
Bundle 'sjl/gundo.vim'

" syntax highlighting for jade templates
Bundle 'digitaltoad/vim-jade'
" and for coffeescript
Bundle 'kchmck/vim-coffee-script'
" javascript mode
Bundle "pangloss/vim-javascript"

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
set number

set cursorcolumn " Show cursor column

" Disable bell (sound & visual)
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

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
silent execute '!mkdir -p ~/.vimbackups'
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

" I never remember exactly tabstop / shiftwidth / softtabstop so this is a
" recap to avoid me searching everytime I need to update my configuration:
" [http://tedlogan.com/techblog3.html]
"
" >> tabstop
"    Set tabstop to tell vim how many columns a tab counts for. Linux kernel
"    code expects each tab to be eight columns wide. Visual Studio expects
"    each tab to be four columns wide. This is the only command here that will
"    affect how existing text displays.
"
"
" >> expandtab
"    When expandtab is set, hitting Tab in insert mode will produce the
"    appropriate number of spaces.
"
" >> shiftwidth
"    Set shiftwidth to control how many columns text is indented with the
"    reindent operations (<< and >>) and automatic C-style indentation.
"
" >> softtabstop
"    Set softtabstop to control how many columns vim uses when you hit Tab in
"    insert mode. If softtabstop is less than tabstop and expandtab is not
"    set, vim will use a combination of tabs and spaces to make up the desired
"    spacing. If softtabstop equals tabstop and expandtab is not set, vim will
"    always use tabs. When expandtab is set, vim will always use the
"    appropriate number of spaces.

"""""" PYTHON CONFIGURATION
" make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
au FileType python set expandtab softtabstop=4 tabstop=4 shiftwidth=4 textwidth=79

"""""" CSS CONFIGURATION
au FileType css set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"""""" JAVASCRIPT CONFIGURATION
au FileType javascript set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

"""""" HTML CONFIGURATION
au FileType html set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

"""""" MARKDOWN CONFIGURATION
au FileType md set noexpandtab " tabs aren't space!

"""""" COFFEESCRIPT CONFIGURATION
au FileType coffee set expandtab tabstop=2 shiftwidth=2

"""""" JADE TEMPLATES CONFIGURATION
au FileType jade set tabstop=2 softtabstop=2 shiftwidth=2 expandtab nowrap

"""""" Haskell CONFIGURATION
au FileType haskell set tabstop=4 softtabstop=4 shiftwidth=4 expandtab nowrap

"""""""""""""""""""""
" gundo configuration
"""""""""""""""""""""
" show undo window on F5
nnoremap <F5> :GundoToggle<CR>

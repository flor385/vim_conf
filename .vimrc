set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" The bundles you install will be listed here
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'Konfekt/FastFold'

call vundle#end()

" NerdTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <F2> :NERDTreeToggle<CR>

" make bar splits prettier
set fillchars-=vert:\| | set fillchars+=vert:\ 

" enable filetype detection
filetype indent plugin on

" syntax coloring, code folding
set modeline
set foldenable
syntax on

" line numbering, line for current cursor
" and brace matching
set number
set cursorline
set showmatch

" color theme
set t_Co=16
set background=light
colorscheme solarized

" automatically start some stuff
autocmd VimEnter * NERDTreeToggle
autocmd VimEnter * wincmd l
autocmd VimEnter * vspl
autocmd VimEnter * wincmd =


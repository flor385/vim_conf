set nocompatible

call pathogen#infect()
call pathogen#helptags()

set background=light
colorscheme solarized

" make bar splits prettier
set fillchars-=vert:\| | set fillchars+=vert:\ 

" enable filetype detection
filetype indent plugin on

" syntax coloring, code folding
set modeline
set foldenable
set foldmethod=syntax
syntax on
au FileType gitcommit set tw=72

" line numbering, line for current cursor
" and brace matching
set number
set cursorline
set showmatch
set relativenumber

" search stuff
set hlsearch
set incsearch
" Turn off highlight search.
nnoremap <silent> <Leader>n :nohlsearch<CR>

" autoload file that changed on disk
set autoread

" display the status line always
set laststatus=2

" always have some text around the cursor
set scrolloff=5

" autoformat with clang-format
autocmd BufNewFile,BufRead *.cpp set formatprg=clang-format\ -style=file


"-----------------------------------------------------------------------
" CtrlP settings
"-----------------------------------------------------------------------"{{{
let g:ctrlp_custom_ignore = '\v'
let g:ctrlp_custom_ignore .= '%('
let g:ctrlp_custom_ignore .= '\.%(git|hg|svn)$|'
let g:ctrlp_custom_ignore .= '\.%(o|obj|so|pyc|png|jpeg|jpg|bmp|ogg|odt|pdf)$|'
let g:ctrlp_custom_ignore .= '[\/]*build'
let g:ctrlp_custom_ignore .= ')'
nnoremap <Leader>fe :CtrlP .<CR>
nnoremap <Leader>fb :CtrlPBuffer<CR>
"}}}

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"-----------------------------------------------------------------------
" YouCompleteMe settings
"-----------------------------------------------------------------------
let g:ycm_confirm_extra_conf = 0
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"

"
" NerdTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeDirArrows=0

" Tagbar
let g:tagbar_sort=0
map <F3> :TagbarToggle<CR>

" PyMode
let g:pymode_python = 'python3'

" Autoformat Python
au FileType python setlocal formatprg=autopep8\ --aggressive\ --max-line-length=80\ -

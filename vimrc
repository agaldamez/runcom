" .vimrc

" Display the background color 
set background=dark

" Display line numbers on the left 
set number

" Number of visual spaces per tab
set tabstop=4

" Indent to a single tab
set shiftwidth=4

" Tabs are spaces
set expandtab 

" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" ansible-vim 
Plug 'pearofducks/ansible-vim'

" Initialize plugin system
call plug#end()


" NERDTreeToggle keyboard shortcuts
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-c> :tabclose<CR>
nnoremap <C-S-Right> :tabn<CR>
nnoremap <C-S-Left>  :tabp<CR>

" NERDTree vertical bar 
highlight VertSplit cterm=NONE

" NERDTree disable 'Press ? for help'
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Open NERDTree automatically 
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

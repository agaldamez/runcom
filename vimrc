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


" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" ansible-vim 
Plug 'pearofducks/ansible-vim'

" Initialize plugin system
call plug#end()


" NERDTreeToggle keyboard shortcut
map <C-n>: NERDTreeToggle<CR>

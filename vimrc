" .vimrc

" Display the background color 
set background=dark

" Display line numbers on the left 
set number

" Enable relative number
set relativenumber

" Enable linebreak for no break in the middle of a word
set linebreak

" Number of visual spaces per tab
set tabstop=4

" Indent to a single tab
set shiftwidth=4

" Tabs are spaces
set expandtab 

" Don't use swapfile
set noswapfile

" Makes backspace key more powerful
set backspace=indent,eol,start

" Search case insensitive
set ignorecase


" vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" vim-indent-guides
Plug 'nathanaelkane/vim-indent-guides'

" Enable vim indent guides 
let g:indent_guides_enable_on_vim_startup = 1
hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

" vim-json
Plug 'elzr/vim-json'

" vim-perl
Plug 'vim-perl/vim-perl'

" vim-ps1
Plug 'pprovost/vim-ps1'

" vim-python-pep8-indent
Plug 'Vimjas/vim-python-pep8-indent'

" vim-systemd-syntax
Plug 'wgwoods/vim-systemd-syntax'

" vim-surround
Plug 'tpope/vim-surround'

" vim-terraform
Plug 'hashivim/vim-terraform'

" vim-helm
Plug 'towolf/vim-helm'

" Initialize plugin system
call plug#end()

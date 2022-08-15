" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
" Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'rudrab/vimf90'
call plug#end()

" Tab settings 
set tabstop=4
set shiftwidth=4

" Color Setting
hi Comment ctermfg=darkgray

set number
set incsearch " Incremental search ( Start search when you input fisrt character )
set smartindent " Auto indent 
set showcmd " Display the number of hits when you search a string
set wildmode=list:longest

set cursorline
" Aliases
cnoreabbrev vs vsplit

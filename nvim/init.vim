" Install vim-plug if not found
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Plugins
let plugged_dir = has('nvim') ? stdpath('data') . '/plugged' :  '~/.vim/plugged'
call plug#begin(plugged_dir)
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'prabirshrestha/vim-lsp'
Plug 'honza/vim-snippets'
Plug 'mattn/vim-lsp-settings'
Plug 'mattn/vim-lsp-icons'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ntpeters/vim-better-whitespace'
Plug 'rudrab/vimf90'
Plug 'editorconfig/editorconfig-vim'
Plug 'github/copilot.vim'
call plug#end()

" Tab settings
set tabstop=4
set shiftwidth=4


let g:fortran_linter=2
let g:fprettify_options='--silent -i 4 --strict-indent'
" Color Setting
hi Comment ctermfg=darkgray

set mouse=a
set number
set incsearch " Incremental search ( Start search when you input fisrt character )
set smartindent " Auto indent
set showcmd " Display the number of hits when you search a string
set wildmode=longest,list

set cursorline
set nofoldenable
" Aliases
cnoreabbrev vs vsplit

" Coc-nvim
let g:coc_disable_startup_warning = 1

" LSP
let g:lsp_settings = {
\   'pylsp-all': {
\     'workspace_config': {
\       'pylsp': {
\         'configurationSources': ['flake8'],
\         'plugins': {
\           'pycodestyle': {
\             'enabled': 0,
\           },
\           'mccabe': {
\             'enabled': 0,
\           },
\		   'pyflakes': {
\             'enabled': 0,
\           },
\		    'flake8': {
\             'enabled': 1,
\		      'ignore': ["E501"],
\           },
\		    'black': {
\             'enabled': 1,
\             'line_length': 1200,
\           },
\         },
\       }
\     }
\   },
\   'clangd': {
\     'cmd': ['clangd', '--enable-config'],
\     'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
\   },
\}
let g:lsp_diagnostic_echo_cursor = 1
autocmd BufWritePre <buffer> LspDocumentFormatSync
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"

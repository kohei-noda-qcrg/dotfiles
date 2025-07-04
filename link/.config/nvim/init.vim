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
Plug 'sainnhe/everforest'
Plug 'ntpeters/vim-better-whitespace'
Plug 'editorconfig/editorconfig-vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'fresh2dev/zellij.vim'
Plug 'github/copilot.vim'
call plug#end()

" Tab settings
set tabstop=4
set shiftwidth=4

let g:fortran_linter=2
let g:fprettify_options='--silent -i 4 --strict-indent'
" Color Setting
hi Comment ctermfg=darkgray
colorscheme everforest
let g:everforest_background = 'hard'

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
cnoreabbrev bash botright terminal
" vash is a short-term for 'vertical bash'
cnoreabbrev vash vertical botright terminal

" keybindings
nmap <silent> gd :LspDefinition<CR>
nmap <silent> gr :LspReferences<CR>
nmap <silent> gi :LspImplementation<CR>
nmap <silent> gD :LspDeclaration<CR>
nmap <silent> K :LspHover<CR>
nnoremap <expr> <C-]> execute('LspPeekDefinition') =~ "not supported" ? "\<C-]>" : ":LspDefinition<cr>"
tnoremap <C-x> <C-\><C-n>  " Exit terminal mode with Ctrl-x

" LSP
let g:lsp_settings_filetype_python = ['ruff', 'pyright-langserver']
let g:lsp_settings = {
\  'pyright-langserver': {
\    'workspace_config': {
\      'python': {
\        'disableOrganizeImports': v:true,
\        'analysis': {
\          'autoSearchPaths': v:true,
\        }
\      }
\    }
\  },
\  'clangd': {
\    'cmd': ['clangd', '--enable-config'],
\    'filetypes': ['c', 'cpp', 'objc', 'objcpp'],
\  },
\}
let g:lsp_diagnostic_echo_cursor = 1
autocmd BufWritePre <buffer> LspDocumentFormatSync

"Backups
set backup
set backupdir=~/.vim/backups//
set directory=~/.vim/backups//
set undodir=~/.vim/backups//
set writebackup
"Plug
call plug#begin()
Plug 'ap/vim-buftabline'
Plug 'omnisharp/omnisharp-vim'
Plug 'jupyter-vim/jupyter-vim'
Plug 'mattn/emmet-vim'
Plug 'vim-latex/vim-latex' "Lated in Vim
Plug 'neoclide/coc.nvim', {'branch':'release'} "conquerer of completion
Plug 'puremourning/vimspector' "debug
Plug 'preservim/nerdtree' "tree directory
Plug 'morhetz/gruvbox' "Font
Plug 'HerringtonDarkholme/yats.vim' "TS Syntax
call plug#end()
"Colors old [set termguicolors]
colorscheme gruvbox
set background=dark
let g:gruvbox_termcolors=16
syntax enable
autocmd BufNewFile,BufRead *.cshtml set syntax=html
"Commands
"command! -nargs=0 Prettier :CocCommand prettier.formatFile
"Key Maps
nmap <C-n> :NERDTreeToggle<CR>
"inoremap jk <ESC>
"""Numbering
set number
set relativenumber
"Searching
set hlsearch
set incsearch
set showmatch
set wildmode=longest
""Tabs
set autoindent
set shiftwidth=2
set softtabstop=0 noexpandtab
set tabstop=2
"Other 
let g:NERDTreeIgnore = ['^node_modules$']
let g:vimspector_enable_mappings = 'HUMAN'
let g:coc_global_extensions = ['coc-snippets','coc-pairs','coc-tsserver','coc-eslint','coc-prettier','coc-json']
let g:OmniSharp_translaye_cygwin_wsl = 1
filetype indent on
set autochdir
set bs=2
set showcmd
set fileformat=unix
"

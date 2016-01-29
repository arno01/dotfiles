" general
set encoding=utf-8
set t_Co=256
set nocompatible
set laststatus=2
set background=light
set number
set hlsearch
set splitright
set splitbelow
set ttimeoutlen=0
set backspace=indent,eol,start

" display whitespace
set list
set listchars=tab:>\ ,trail:·,nbsp:·

" indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

au FileType go set softtabstop=0 shiftwidth=0 tabstop=4 noexpandtab

" cd folder preview
set wildmenu
set wildmode=list:longest

" Map leader key
let mapleader = ","
let g:mapleader = ","

" no swap files
set noswapfile
set nobackup
set nowritebackup

let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/*
set wildignore+=*theaterjobs*/vendor/*,*/web/bundles/*,*/app/cache/*,*/vendor/bundles*

" allow hiding modified buffers
set hidden

" Plug handles plugins
call plug#begin('~/.vim/bundle')

Plug 'gmarik/Vundle.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'lervag/vimtex'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'

call plug#end()

colorscheme Tomorrow-Night

" Configure airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" Default to latex, not plaintex
let g:tex_flavor = "latex"

" Automatically manage Go imports when saving files
let g:go_fmt_command = "goimports"

" Mappings
map :nt :NERDTreeToggle
imap kj <esc>
nmap <C-b> :CtrlPBuffer<cr>
nmap <F8> :TagbarToggle<CR>

" Mapping for new line above or below cursor
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a


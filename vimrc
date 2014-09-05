" general
syntax on
filetype off

set encoding=utf-8
set t_Co=256
set nocompatible
set laststatus=2
set background=light
set number
set hlsearch
set splitright
set splitbelow

" display whitespace
set list
set listchars=tab:▸\ ,trail:·,nbsp:·

" indentation
set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

" cd folder preview
set wildmenu
set wildmode=list:longest

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

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

set backspace=indent,eol,start

" let Vundle manage Vundle
Plugin 'gmarik/vundle'

Plugin 'kien/ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'mileszs/ack.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/vim-tomorrow-theme'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'

call vundle#end()            " required
filetype plugin indent on    " required

colorscheme Tomorrow-Night-Eighties

" Configure airline
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0

" Mappings
map :nt :NERDTree
imap kj <esc>
nmap <C-b> :CtrlPBuffer<cr>

nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a


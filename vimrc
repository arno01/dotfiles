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

" do not duplicate output to terminal
let &shellpipe="&>"

" ignore these files
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$'
set wildignore+=*/tmp/*,*.scssc,*.sassc,*.class,*.DS_Store
set wildignore+=*/vendor/bundle/*,*/server/*,*/public/*
set wildignore+=*/node_modules/*,*/bower_components/*
set wildignore+=*theaterjobs*/vendor/*,*/web/bundles/*,*/app/cache/*,*/vendor/bundles*

" allow hiding modified buffers
set hidden

" Plug handles plugins
call plug#begin('~/.vim/bundle')

Plug 'gmarik/Vundle.vim'
Plug 'kchmck/vim-coffee-script'
Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'fatih/vim-go'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'

call plug#end()

colorscheme Tomorrow-Night-Eighties

" Configure syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Configure airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0

" Configure vim-test to use neoterm
let test#strategy = "neoterm"
let g:neoterm_size = 20

" Configure shortcuts vim-test
nmap <silent> <leader>R :TestNearest<CR>
nmap <silent> <leader>r :TestFile<CR>
nmap <silent> <leader>s :TestSuite<CR>

" Automatically manage Go imports when saving files
let g:go_fmt_command = "goimports"

" Mappings
nmap <Leader>n :NERDTreeToggle<CR>
nmap <Leader>N :NERDTreeFind<CR>
imap kj <esc>
nmap <C-b> :CtrlPBuffer<cr>
nmap <F8> :TagbarToggle<CR>
nmap <leader>J :tabp<CR>
nmap <leader>K :tabn<CR>

" Mapping for new line above or below cursor
nnoremap <C-J> mao<Esc>`a
nnoremap <C-K> maO<Esc>`a


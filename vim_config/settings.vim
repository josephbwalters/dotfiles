" Number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" Reload files nicely
set autoread
au FocusGained,BufEnter * :silent! !

" Use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932

" Set working directory
set autochdir

" No backups/swaps
set nobackup
set noswapfile
set hidden

" Use system clipboard
set clipboard=unnamedplus

" Setup line numbers + keep centered
set relativenumber 
set number 
set scrolloff=999

" Tab configuration
set autoindent
set tabstop=2       " The width of a TAB is set to 4.
set shiftwidth=2    " Indents will have a width of 4
set softtabstop=2   " Sets the number of columns for a TAB
set expandtab       " Expand TABs to spaces

" make scrolling and painting fast
set ttyfast lazyredraw

" Search settings
set hlsearch incsearch ignorecase smartcase

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" Enable mouse because I like to highlight and scroll easily
set mouse=a

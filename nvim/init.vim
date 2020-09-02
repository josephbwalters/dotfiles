" vim-bootstrap 

"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

let g:vim_bootstrap_langs = "html,javascript,python,ruby,typescript"
let g:vim_bootstrap_editor = "nvim"				" nvim or vim

source ~/Development/dotfiles/nvim/plugins.vim

" Required:
filetype plugin indent on

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Line Numbers
set relativenumber

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader=','

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase

set fileformats=unix,dos,mac

if exists('$SHELL')
    set shell=$SHELL
else
    set shell=/bin/sh
endif

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
"" Config Files
"*****************************************************************************
source ~/Development/dotfiles/nvim/ui.vim
source ~/Development/dotfiles/nvim/abbrev.vim
source ~/Development/dotfiles/nvim/filetypes.vim

source ~/Development/dotfiles/nvim/plugins/airline.vim
source ~/Development/dotfiles/nvim/plugins/nerdtree.vim
source ~/Development/dotfiles/nvim/plugins/grep.vim
source ~/Development/dotfiles/nvim/plugins/ale.vim
source ~/Development/dotfiles/nvim/plugins/startify.vim

" terminal emulation
nnoremap <silent> <leader>sh :terminal<CR>

"*****************************************************************************
"" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
"" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
"*****************************************************************************

" Load mappings
source ~/Development/dotfiles/nvim/mappings.vim


"" Include user's local vim config
if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif


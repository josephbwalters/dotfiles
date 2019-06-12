" Enable syntax highlighting
syntax enable

" highlight matching parens, braces, brackets, etc
set showmatch

" Disables native mode bar
set noshowmode

" Allow airline to use powerline fonts as necessary
let g:airline_powerline_fonts = 1

" Set themeing for nvim
colorscheme gruvbox
set background=dark

let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart
autocmd BufRead,BufNewFile *.vue setlocal filetype=vue.html.javascript.css.less.pug

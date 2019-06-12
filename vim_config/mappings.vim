" NOTE: I generally prefer Shift over Ctrl due to the fact that I am lazy

" Map ':' to ';'
noremap ; :

" Map <Leader> to ' '
let mapleader = ","

" Map Shift+o to open NerdTree
map <C-o> :NERDTreeToggle<CR>

" Searching for files or within files
nnoremap <C-p> :Files<Cr>
nnoremap <C-f> :Rg<Cr>

" Toggle paste mode with ,+z
set pastetoggle=<leader>z

" Shift+hjkl to change tabs
noremap <S-l> gt
noremap <S-h> gT

" Ctrl+hjkl to change panes
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" Simple tab navigation with arrows
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Exit file with ,+q
noremap <leader>q :q<cr>

" Save File with ,+s
nnoremap <leader>s :w<cr>
inoremap <leader>s <C-c>:w<cr>


syntax on
set ruler
set number

let no_buffers_menu=1
silent! colorscheme gruvbox

" Colorscheme tweaks
highlight Normal guibg=#1e1e1e
highlight NonText guibg=#1e1e1e
highlight LineNr guibg=#1e1e1e
highlight SignColumn guibg=#1e1e1e

" Git plugins
highlight GitSignsAdd           guibg=#1e1e1e
highlight GitSignsChange        guibg=#1e1e1e
highlight GitSignsDelete        guibg=#1e1e1e
highlight GitGutterAdd          guibg=#1e1e1e
highlight GitGutterChange       guibg=#1e1e1e
highlight GitGutterDelete       guibg=#1e1e1e

" LSP diagnostics in the gutter
highlight DiagnosticSignError   guibg=#1e1e1e
highlight DiagnosticSignWarn    guibg=#1e1e1e
highlight DiagnosticSignInfo    guibg=#1e1e1e
highlight DiagnosticSignHint    guibg=#1e1e1e

set mouse=a
set mousemodel=popup
set t_Co=256

if exists('+guioptions')
  set guioptions=egmrti
endif

set gfn=Monospace\ 10

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
  let g:CSApprox_loaded = 1

  " IndentLine
  " let g:indentLine_enabled = 1
  " let g:indentLine_concealcursor = 0
  " let g:indentLine_char = '┆'
  " let g:indentLine_faster = 1
endif

"" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3

"" Status bar
set laststatus=2

"" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%{kite#statusline()}%F%m%r%h%w%=(%{&ff}/%Y)\(line\ %l\/%L,\ col\ %c)\

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
  set statusline+=%{kite#statusline()}
endif

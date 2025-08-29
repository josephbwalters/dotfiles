" ---------- NERDTree: lean & fast ----------
let g:NERDTreeChDirMode = 2
let g:NERDTreeIgnore = [
  \ '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__',
  \ '\.DS_Store$', '^node_modules$', '^dist$', '^build$', '^target$',
  \ '^coverage$', '^\.next$', '^\.cache$', '^\.yarn$', '^\.pnpm$',
  \ '^Pods$', '^DerivedData$', '^\.idea$', '^\.vscode$'
  \ ]
let g:NERDTreeSortOrder = ['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks = 1
let g:nerdtree_tabs_focus_on_files = 1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" Draw less
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeShowHidden = 0

" Respect wildignore (HUGE speedup on big repos)
let g:NERDTreeRespectWildIgnore = 1
set wildignore+=**/node_modules/**,**/.git/**,**/dist/**,**/build/**,**/target/**,**/.next/**,**/venv/**,**/.tox/**,**/.cache/**,**/.yarn/**,**/.pnpm/**,**/coverage/**,**/Pods/**,**/DerivedData/**,**/.idea/**,**/.vscode/**,*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

" If you have nerdtree-git-plugin, tone it down (safe even if not installed)
let g:NERDTreeGitStatusShowIgnored = 0
let g:NERDTreeGitStatusShowUntracked = 0
let g:NERDTreeGitStatusWithFlags = 0

" If you use devicons, disable them in NERDTree for speed (safe even if absent)
let g:webdevicons_enable_nerdtree = 0
let g:webdevicons_enable = 0

" Keymaps
nnoremap <silent> <leader>2 :NERDTreeFind<CR>
nnoremap <silent> <leader>3 :NERDTreeToggle<CR>

" Extra: set tree root = current working directory (keeps built-in 'C' intact)
nnoremap <silent> <leader>cr :NERDTreeCWD<CR>

" Convenience: open at repo root when available (less rescanning later)
command! -nargs=0 NTreeRoot execute 'NERDTree ' . systemlist('git rev-parse --show-toplevel 2>/dev/null || pwd')[0]

" Stop heavy autocommands while you're in the NERDTree buffer
augroup NerdTreeNoHeavyEvents
  autocmd!
  autocmd FileType nerdtree
        \ let g:_old_updatetime = &updatetime |
        \ let g:_old_eventignore = &eventignore |
        \ set updatetime=2000 |
        \ set eventignore+=CursorHold,CursorHoldI,FileType,CmdlineEnter
  autocmd BufLeave * if &filetype ==# 'nerdtree' |
        \ let &updatetime = get(g:,'_old_updatetime',&updatetime) |
        \ let &eventignore = get(g:,'_old_eventignore',&eventignore) |
        \ unlet! g:_old_updatetime g:_old_eventignore |
        \ endif
augroup END


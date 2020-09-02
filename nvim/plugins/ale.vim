let g:ale_linters = {'ruby': ['rubocop']}
let b:ale_fixers = {'javascript': ['prettier'], 'ruby':['rubocop']}
let g:ale_fix_on_save = 1                    " setting for linter only run file changed
let g:ale_lint_on_text_changed = 'never'     " setting for linter only run file changed
let g:ale_ruby_rubocop_executable = 'bundle' " fix rubocop executor

:call extend(g:ale_linters, {
    \'python': ['flake8']})


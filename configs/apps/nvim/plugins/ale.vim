let g:ale_linters = {'ruby': ['rubocop'], 'javascript': ['eslint', 'prettier'], 'vue': ['eslint', 'prettier']}
let b:ale_fixers = {'vue': ['eslint', 'prettier'], 'javascript': ['eslint', 'prettier'], 'ruby':['rubocop']}
let g:ale_fix_on_save = 1                    " setting for linter only run file changed
let g:ale_lint_on_text_changed = 'never'     " setting for linter only run file changed
let g:ale_ruby_rubocop_executable = 'bundle' " fix rubocop executor

:call extend(g:ale_linters, {
    \'python': ['flake8']})


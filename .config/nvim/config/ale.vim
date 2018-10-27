let g:ale_completion_enabled = 1
let g:ale_fixers = { 'javascript': ['eslint'], 'typescript': ['tslint'] }
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_open_list = 1
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=grey


" Finding
nnoremap <leader>fr :ALEFindReferences<CR>

" Navigating
nnoremap <leader>gi :ALEGoToDefinition<CR>

" Linting
nnoremap ]l :ALENext<CR>
nnoremap [l :ALEPrevious<CR>
nnoremap lh :ALEHover<CR>
nnoremap ld :ALEDetail<CR>
nnoremap lp :ALEPrevious<CR>
nnoremap ln :ALENext<CR>

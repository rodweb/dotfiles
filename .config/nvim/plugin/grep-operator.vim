nnoremap <silent> <leader>g :set operatorfunc=<sid>GrepOperator<cr>g@
vnoremap <silent> <leader>g :<c-u>call <sid>GrepOperator(visualmode())<cr>

function! s:GrepOperator(type)
    let saved_unnamed_register = @@

    if a:type ==# 'v'
        normal! `<v`>y
    elseif a:type ==# 'char'
        normal! `[y`]
    else
        return
    endif

    silent execute "grep! " . shellescape(@@)
    copen

    let @@ = saved_unnamed_register
endfunction

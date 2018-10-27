nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>cc :Commands<CR>
nnoremap <leader>fa :Files<CR>
nnoremap <leader>fi :Filetypes<CR>
nnoremap <leader>ff :GitFiles<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>ww :Windows<CR>

nnoremap <leader>ss :Rg 
nnoremap <leader>ag :Rg <C-r><C-w><CR>
vnoremap <leader>ag y:Rg <C-r>"<CR>

imap <C-f> <plug>(fzf-complete-path)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" command! -bang -nargs=* Rg call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/" --glob "!tags" --glob "!coverage/" --color "always" '.shellescape(<q-args>), 1, <bang>0)

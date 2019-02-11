" let g:neosnippet#enable_snipmate_compatibility = 1
" let g:neosnippet#snippets_directory='~/.vim/vim-snippets'
" let g:neosnippet#disable_runtime_snippets = { '_' : 1 }

" nnoremap <leader>st :NeoSnippetEdit<CR>

" imap <expr><Tab> pumvisible() ?
"       \ "\<Plug>vim_completes_me_forward" :
"       \     neosnippet#expandable_or_jumpable() ?
"       \     "\<Plug>(neosnippet_expand_or_jump)" :
"       \ "\<Tab>"
" smap <expr><Tab> neosnippet#expandable_or_jumpable() ?
"       \ "\<Plug>(neosnippet_expand_or_jump)"
"       \: "\<Tab>"

let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

augroup Focusing
  au!
  au User GoyoEnter Limelight
  au User GoyoLeave Limelight!
augroup END

nnoremap <leader>of :Limelight!!<CR>


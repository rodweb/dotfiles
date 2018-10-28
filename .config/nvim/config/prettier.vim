let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#nvim_unstable_async=1

augroup Prettier
  au!
  au BufWritePre *.ts PrettierAsync %
augroup END

augroup xresources
  autocmd! BufWritePost ~/.Xresources !xrdb -load ~/.Xresources
augroup END


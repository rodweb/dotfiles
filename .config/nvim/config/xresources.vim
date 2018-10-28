augroup AutoReloadXResources
  au!
  au BufWritePost ~/.Xresources !xrdb -load ~/.Xresources
augroup END


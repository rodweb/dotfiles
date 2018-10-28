augroup AutoSourceVimFiles
  au!
  au BufWritePost $MYVIMRC,*.vim source % | echom "Reloaded " . expand("%") | redraw
augroup END

augroup EnableCursorLineCurrentWindow
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

augroup FileTypeVim
  au!
  au FileType vim setlocal sw=2
augroup END

" prevent loading file twice
if exists('g:loaded_alternate') | finish | endif

" save user coptions
let s:save_cpo = &cpo
" reset them to defaults
set cpo&vim 

fun! AlternatePlugin()
  " remove this line
  " lua for k in pairs(package.loaded) do if k:match("^alternate") then package.loaded[k] = nil end end
  lua require'alternate'.alternate()
endfun


autocmd FileType typescript
      \|nnoremap <buffer> <localleader>a :Alternate<cr>

" command to run our plugin
command! Alternate :call AlternatePlugin()
"
" and restore after
let &cpo = s:save_cpo
unlet s:save_cpo

let g:loaded_alternate = 1

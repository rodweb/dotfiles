set nocompatible
set clipboard+=unnamedplus

let mapleader = " "
let maplocalleader = ","

if exists('g:vscode')
  nnoremap K <Cmd>call VSCodeNotify('editor.action.showHover')<CR>
  nnoremap <leader>a <Cmd>call VSCodeCall('alternate.run')<CR>
  nnoremap <leader>f <Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>
  nnoremap <leader>s <Cmd>call VSCodeNotify('workbench.action.files.save')<CR>
  nnoremap <leader>h <Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>
  nnoremap <leader>r <Cmd>call VSCodeNotify('editor.action.rename')<CR>
  nnoremap <leader>ga <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>
  nnoremap <leader>gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>
  nnoremap <leader>gi <Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>
  nnoremap <leader>gs <Cmd>call VSCodeNotify('editor.action.gotoSymbol')<CR>
  nnoremap <leader>gd <Cmd>call VSCodeNotify('editor.action.peekDefinition')<CR>
  nnoremap ]c <Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>
  nnoremap [c <Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>
  nnoremap ]e <Cmd>call VSCodeNotify('editor.action.marker.next')<CR>
  nnoremap [e <Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif

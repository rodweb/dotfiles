syntax enable
filetype plugin indent on

call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-dispatch'
"Plug 'dunstontc/vim-vscode-theme'
Plug 'chriskempson/base16-vim'
call plug#end()

"colorscheme dark_plus

set mouse=a
set number
set numberwidth=4
set relativenumber

set wrap
set textwidth=80
set expandtab
set shiftwidth=4
set smarttab

set incsearch
set ignorecase
set smartcase

set showbreak=↪\ 
set list
set listchars=tab:→\ ,trail:•,nbsp:␣

set foldlevelstart=1

let mapleader = " "
let maplocalleader=","

" Normal mappings {{{

" FZF mappings {{{
nnoremap <leader>f :GitFiles<cr>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>cc :Commands<CR>
nnoremap <leader>yy :Filetypes<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>ww :Windows<CR>
" }}}

nnoremap ; :

nnoremap <leader>n :nohl<cr>
nnoremap <leader>r :w<cr>:so %<cr>:echo "Reloaded!"<cr>
nnoremap <leader>s :write<cr>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ed :e $MYVIMRC<cr>

nnoremap - ddp
nnoremap _ ddkP

nnoremap Y yg_
nnoremap H g0
nnoremap L g$

nnoremap <leader>; A;<esc>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
" }}}

" Visual mappings {{{
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
" }}}

" Insert mappings {{{
" convert current word to uppercase
inoremap <c-u> <esc>viwUea
inoremap jk <esc>
inoremap {<cr> {<cr>}<esc>O
" }}}

" Operator pending mappings {{{
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap an( :<c-u>normal! f(va(<cr>
" }}}

" Abbreviations {{{
iabbrev whiel while
iabbrev tehn then
" }}}

" File write settings {{{
augroup WriteFilesGroup
    autocmd!
    autocmd BufNewFile *.js,*.jsx,*.ts,*.tsx,*.c :write
    autocmd FocusLost *js,*.jsx,*.ts,*.tsx,*.c :write
augroup END
" }}}

" HTML file settings {{{
augroup HtmlFilesGroup
    autocmd!
    autocmd BufRead *.html setlocal nowrap
augroup END
" }}}

" Javascript file settings {{{
augroup JavascriptFilesGroup
    autocmd!
    autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
    autocmd FileType javascript :iabbrev <buffer> cl console.log()<left>
augroup END
" }}}

" Vimscript file settings {{{
augroup VimFilesGroup
    autocmd!
    autocmd FileType vim nnoremap <buffer> <localleader>c I"<esc>
    autocmd FileType vim setlocal foldmethod=marker foldlevel=0
augroup END
" }}}

" Markdown file settings {{{
augroup MarkdownFilesGroup
    autocmd!
    autocmd FileType markdown setlocal spell list nonumber norelativenumber
augroup END
" }}}

" C file settings {{{
augroup CFilesGroup
    autocmd!
    autocmd FileType c iabbrev iio #include <stdio.h>
    autocmd FileType c iabbrev ilib #include <stdlib.h>
    autocmd FileType c nnoremap <buffer> <localleader>b :Dispatch cc -std=c99 -Wall % && ./a.out<cr>
augroup END
" }}}

" Base16 color scheme settings {{{
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
" }}}

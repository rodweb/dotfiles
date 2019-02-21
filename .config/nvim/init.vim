filetype plugin indent on
syntax enable

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'pangloss/vim-javascript'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-dispatch'
"Plug 'dunstontc/vim-vscode-theme'
Plug 'chriskempson/base16-vim'
call plug#end()
" }}}

let mapleader = " "
let maplocalleader=","

"colorscheme dark_plus

" Settings {{{
set t_Co=256

set clipboard=unnamedplus
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
set scrolloff=0

set foldlevelstart=1

set splitright
" }}}

" Normal mappings {{{

" FZF mappings
nnoremap <leader>f :GitFiles<cr>
nnoremap <leader>bl :BLines<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>cc :Commands<CR>
nnoremap <leader>yy :Filetypes<CR>
nnoremap <leader>hh :History<CR>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>tt :Tags<CR>
" nnoremap <leader>ww :Windows<CR>

nnoremap ; :

nnoremap <leader><tab> <c-^>
nnoremap <leader>q :q<cr>
nnoremap <leader>n :nohl<cr>
nnoremap <leader>a :w<cr>:so %<cr>:echo "Reloaded!"<cr>
nnoremap <leader>r "qyiw:%s/\v<c-r>q//c<left><left>
nnoremap <leader>s :write<cr>
nnoremap <leader>w <c-w><c-w>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ed :e $MYVIMRC<cr>

nnoremap - ddp
nnoremap _ ddkP

nnoremap Y yg_
nnoremap H g0
nnoremap L g$

nnoremap j gj
nnoremap k gk

nnoremap cw ciw

nnoremap / /\v

nnoremap <leader>; :execute "normal!\ mqA;\e`q"<cr>
nnoremap <leader>, :execute "normal!\ mqA,\e`q"<cr>

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel

let i = 1
while i <= 3
    execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<cr>'
    let i = i + 1
endwhile

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
onoremap c :execute "normal! /[A-Z]/\r:nohlsearch\r"<cr>
onoremap B :<c-u>normal! ggVG<cr>
" }}}

" Abbreviations {{{
iabbrev whiel while
iabbrev tehn then
iabbrev cosnt const
iabbrev applicaiton application
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

" Buffer settings {{{
augroup BufferSettings
    autocmd!
    autocmd BufEnter * set cursorline
    autocmd BufLeave * set nocursorline
augroup END
" }}}

" Base16 color scheme settings {{{
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    source ~/.vimrc_background
endif
" }}}


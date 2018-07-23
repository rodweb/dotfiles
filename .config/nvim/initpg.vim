" vim:set ft=vim et sw=2:
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible

set clipboard=unnamedplus

set autoindent
set backspace=indent,eol,start
set smarttab

set laststatus=2
set ruler
set wildmenu

set number
set relativenumber
set scrolloff=5
set sidescrolloff=5

set visualbell
set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set t_Co=256
set background=dark

au BufRead /tmp/psql.edit.* set syntax=sql

let mapleader = "\<Space>"
nnoremap <leader>sv :source %<CR>

nnoremap <leader><tab> <C-^>
nnoremap <leader><leader> :Maps<CR>
nnoremap <leader>qq :q!<CR>

" Comment
nmap <leader>/ <Plug>CommentaryLine
vmap <leader>/ <Plug>CommentaryLine

" Buffers
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Files
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :wa<CR>
nnoremap <leader>fn :enew<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>fed :e ~/.config/nvim/init.vim<CR>

" Git
nnoremap <leader>gb :Gblame<CR>
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Linting
nnoremap <leader>ln :ALENext<CR>
nnoremap <leader>lp :ALEPrevious<CR>
nnoremap <leader>ld :ALEDetail<CR>

" Options
nnoremap <leader>ll :Filetypes<CR>

" Search
nnoremap <leader>sc :noh<CR>

" Windows
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wl <C-w>l
nnoremap <leader>wd :q<CR>
nnoremap <leader>ww :Windows<CR>

let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']

map <C-e> :NERDTreeToggle<CR>

let g:user_emmet_leader_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
  \  },
  \}

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %


set syntax=dbout

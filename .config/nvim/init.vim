call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-eunuch'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
"Plug 'mboughaba/i3config.vim'
Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug '/usr/bin/fzf'
Plug 'junegunn/fzf.vim'
call plug#end()

set nocompatible

" syntax enable
" filetype plugin indent on

set tabstop=2
set autoindent

set number
set relativenumber

set visualbell
set encoding=utf-8

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set t_Co=256
set background=dark

map <C-e> :NERDTreeToggle<CR>

let g:user_emmet_leader_key='<Tab>'
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_settings = {
  \  'javascript.jsx' : {
  \    'extends' : 'jsx',
  \  },
  \}

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

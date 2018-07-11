call plug#begin('~/.local/share/nvim/plugged')
Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
Plug 'mboughaba/i3config.vim'
Plug 'vim-syntastic/syntastic'
" Make sure you use single quotes
" Plug 'junegunn/seoul256.vim'
" Plug 'junegunn/vim-easy-align'

" Group dependencies, vim-snippets depends on ultisnips
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using git URL
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'
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

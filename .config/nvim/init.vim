call plug#begin('~/.local/share/nvim/plugged')
" Plug 'leafgarland/typescript-vim'
" Comment stuff out (gcc, gc, gap)
Plug 'tpope/vim-commentary'
" Sugar for shell commands (:Delete, :Chmod, :Mkdir, :SudoWrite)
Plug 'tpope/vim-eunuch'
" Add parenthesis, brackets, quotes, etc (ysiw", cs'", ds")
Plug 'tpope/vim-surround'
" Git wrapper
Plug 'tpope/vim-fugitive'
" Netrw enhancer
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Marks git added/changed/removed lines
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
" Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeClose', 'NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ajh17/VimCompletesMe'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['typescript'] }
" Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'takac/vim-hardtime'
Plug 'tomasiser/vim-code-dark'
" Plug 'junegunn/limelight.vim'
" Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'wincent/loupe'
Plug 'wincent/ferret'
Plug 'wakatime/vim-wakatime'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'metakirby5/codi.vim'
" Plug 'Quramy/tsuquyomi'
call plug#end()

let mapleader = "\<Space>"
let maplocalleader = ","

runtime! config/*.vim

set secure

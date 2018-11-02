call plug#begin('~/.local/share/nvim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'mattn/emmet-vim'
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'janko-m/vim-test'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ajh17/VimCompletesMe'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['typescript'] }
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'Shougo/neosnippet.vim'
Plug 'takac/vim-hardtime'
Plug 'tomasiser/vim-code-dark'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim', { 'for': 'markdown' }
Plug 'wincent/loupe'
Plug 'wincent/ferret'
Plug 'wakatime/vim-wakatime'
call plug#end()

let mapleader = "\<Space>"
let maplocalleader = ","

runtime! config/*.vim

set secure

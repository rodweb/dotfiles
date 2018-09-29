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
Plug 'sheerun/vim-polyglot'
Plug 'moll/vim-node'
Plug 'editorconfig/editorconfig-vim'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'janko-m/vim-test'
Plug 'liuchengxu/vim-which-key'
call plug#end()

set nocompatible
set mouse=a
set clipboard=unnamedplus
set hidden

set autoindent
set backspace=indent,eol,start
set smarttab
set expandtab

set ruler
set wildmenu

set number
set relativenumber
set scrolloff=5
set sidescrolloff=5
set cursorline
set visualbell
set encoding=utf-8
set listchars=tab:→\ ,eol:↲

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set inccommand=split

set t_Co=256
" set background=dark

" won't show duplicated INSERT
set noshowmode

" git gutter should be faster
set updatetime=100

au BufRead /tmp/psql.edit.* set syntax=sql

" ALE
let g:ale_completion_enabled = 1
let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'typescript': ['tslint'],
\}
let g:ale_fix_on_save = 1

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
set timeoutlen=500

let mapleader = "\<Space>"
nnoremap <leader>sv :source %<CR>

nnoremap <leader><tab> <C-^>
nnoremap <leader>? :Maps<CR>
nnoremap <leader>qq :q!<CR>

" Comment
nmap <leader>cl <Plug>CommentaryLine
vmap <leader>cl <Plug>CommentaryLine

" Commands
nnoremap <leader>cc :Commands<CR>

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
nnoremap <leader>fed :e $MYVIMRC<CR>
nnoremap <leader>fi :Filetypes<CR>

" Find
nnoremap <leader>fr :ALEFindReferences<CR>

" Git
nnoremap <leader>gd :Gdiff<CR>
nnoremap <leader>gs :Gstatus<CR>

" Goto
nnoremap <leader>gi :ALEGoToDefinition<CR>
nnoremap <leader>gb <C-o><CR>
nnoremap <leader>gf <C-i><CR>

" Linting
nnoremap ]l :ALENext<CR>
nnoremap [l :ALEPrevious<CR>
nnoremap ld :ALEDetail<CR>

" Options
nnoremap <leader>ol :set list!<CR>
nnoremap <leader>os :set spell!<CR>

" Project
nnoremap <leader>pf :GitFiles<CR>

" Search
nnoremap <leader>sc :noh<CR>
nnoremap <leader>ss :Ag<CR>
nnoremap <leader>ag :Ag<C-r><C-w><CR>
nnoremap <leader>tt :Tags<CR>

" Spelling
nnoremap <leader>sa zg
nnoremap <leader>sr zw
nnoremap <leader>sg z=

" Source
nnoremap <leader>sz :so $MYVIMRC<CR>

" Testing
nnoremap <silent><leader>tn :TestNearest<CR>
nnoremap <silent><leader>tf :TestFile<CR>
nnoremap <silent><leader>tp :TestSuite<CR>
nnoremap <silent><leader>tl :TestLast<CR>
nnoremap <silent><leader>tv :TestVisit<CR> 

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

autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

" Auto Reload when changing theme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Source Vim configuration upon save
augroup vimrc     
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

" Cursor line on current window
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Indent Line
let g:indentLine_setColors = 0
let g:indantLine_char = '│'

" Easy Motion
let g:EasyMotion_smartcase = 1
map <leader><leader> <Plug>(easymotion-prefix)
nmap s <Plug>(easymotion-s2)
nmap t <Plug>(easymotion-t2)
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" vim:set ft=vim et sw=2:
call plug#begin('~/.local/share/nvim/plugged')
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf.vim'
Plug 'chriskempson/base16-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'justinmk/vim-sneak'
Plug 'janko-m/vim-test'
Plug 'liuchengxu/vim-which-key'
Plug 'ludovicchabant/vim-gutentags'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['typescript'] }
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-startify'
Plug 'Shougo/neosnippet.vim'
Plug 'takac/vim-hardtime'
Plug 'tomasiser/vim-code-dark'
Plug 'Shougo/echodoc.vim'
Plug 'junegunn/limelight.vim'
call plug#end()

set completeopt=noinsert,menuone,noselect

set nocompatible
set mouse=a
set clipboard=unnamedplus
set hidden
set autoread

set autoindent
set backspace=indent,eol,start
set smarttab
set expandtab

" set colorcolumn=100
set ruler
set wildmenu

set number
set relativenumber
set scrolloff=5
set sidescrolloff=5
set display+=lastline
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

set cmdheight=1
set t_Co=256
set t_ut=
" set background=dark
colorscheme codedark
let g:airline_theme = 'codedark'

" won't show duplicated INSERT
set noshowmode

" git gutter should be faster
set updatetime=100

" project local .vimrc
" set exrc

au BufRead /tmp/psql.edit.* set syntax=sql

" ALE
let g:ale_completion_enabled = 1
let g:ale_fixers = {
      \   'javascript': ['eslint'],
      \   'typescript': ['tslint'],
      \}
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 1
let g:ale_sign_error = '•'
let g:ale_sign_warning = '•'
let g:ale_sign_column_always = 1
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=grey

set timeoutlen=500

let mapleader = "\<Space>"
let maplocalleader = ","
nnoremap <silent><leader> :WhichKey '<Space>'<CR>
nnoremap <leader>sv :source %<CR>

" Vim
nnoremap <leader><tab> <C-^>
nnoremap <leader>mm :Maps<CR>
nnoremap <leader>qq :qall<CR>
nnoremap <leader>qQ :qall!<CR>

" Motions
" map <leader><leader> <Plug>(easymotion-w)
" nmap s <Plug>(easymotion-s2)
" nmap t <Plug>(easymotion-t2)
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)
map s <Plug>Sneak_s
map S <Plug>Sneak_S
map t <Plug>Sneak_t
map T <Plug>Sneak_T

" Comment
nmap <leader>cl <Plug>CommentaryLine
vmap <leader>cl <Plug>CommentaryLine
nmap <leader>; A;<esc>

" Commands
nnoremap <leader>cc :Commands<CR>

" Buffers
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :bdelete<CR>
nnoremap <leader>bD :bdelete!<CR>
nnoremap <leader>bn :bn<CR>
nnoremap <leader>bp :bp<CR>

" Files
nnoremap <leader>fa :Files<CR>
nnoremap <leader>fs :w<CR>
nnoremap <leader>fS :wa<CR>
nnoremap <leader>fn :enew<CR>
nnoremap <leader>ft :NERDTreeToggle<CR>
nnoremap <leader>fed :e $MYVIMRC<CR>
nnoremap <leader>fev :vsplit $MYVIMRC<CR>
nnoremap <leader>fev :vsplit $MYVIMRC<CR>
nnoremap <leader>fi :Filetypes<CR>
nnoremap <leader>hh :History<CR>

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

" Moving
nmap <C-S-k> ddkP
nmap <C-S-j> ddp

vmap <C-S-k> xkP`[V`]
vmap <C-S-j> xp`[V`]

" Options
nnoremap <leader>ol :set list!<CR>
nnoremap <leader>os :set spell!<CR>
nnoremap <leader>oi :IndentLinesToggle<CR>
nnoremap <leader>oh :HardTimeToggle<CR>
nnoremap <leader>of :Limelight!!<CR>

" Project
nnoremap <leader>ff :GitFiles<CR>

" Replacing
nnoremap <leader>rr :%s/<c-r><c-w>/
vnoremap <leader>rr y:%s/<c-r>"/

" Search
nnoremap <leader>sc :noh<CR>
nnoremap <leader>ss :Ag<CR>
nnoremap <leader>ag :Ag <C-r><C-w><CR>
vnoremap <leader>ag y:Ag <C-r>"<CR>
nnoremap <leader>bl :BLines<CR>

" Spelling
nnoremap <leader>sa zg
nnoremap <leader>sr zw
nnoremap <leader>sg z=

" Source
nnoremap <leader>sz :so $MYVIMRC<CR>

" Snippets
nnoremap <leader>st :NeoSnippetEdit<CR>

" Tabs
nnoremap <leader>te :tabedit %<CR>

" Tags
nnoremap <leader>bt :BTags<CR>
nnoremap <leader>tt :Tags<CR>
nnoremap <leader>tb :TagbarToggle<CR>

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
nnoremap <leader>wd :q<CR>
nnoremap <leader>ww :Windows<CR>
nnoremap <leader>1 :1wincmd w<CR>
nnoremap <leader>2 :2wincmd w<CR>
nnoremap <leader>3 :3wincmd w<CR>

" Learning
iabbrev adn and
iabbrev waht what
iabbrev tehn then

nnoremap H ^
nnoremap L g_
inoremap jk <esc>

augroup filetypes
  autocmd!
  autocmd FileType markdown set wrap spell
augroup END

" Source Vim configuration upon save
augroup vimrc
  autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
augroup END

augroup xresources
  autocmd! BufWritePost ~/.Xresources !xrdb -load ~/.Xresources
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
let g:indentLine_enabled = 0

" Easy Motion
let g:EasyMotion_smartcase = 1

" Sneak
let g:sneak#label = 1

" Limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" FZF
imap <C-f> <plug>(fzf-complete-path)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Auto CTAGS
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']

" Deoplete
let g:deoplete#enable_at_startup = 1

imap <expr><TAB>
      \ neosnippet#expandable_or_jumpable() ?
      \    "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" NeoSnippet
let g:neosnippet#enable_snipmate_compatibility = 1
let g:neosnippet#snippets_directory='~/.vim/vim-snippets'
let g:neosnippet#disable_runtime_snippets = {
      \   '_' : 1,
      \ }

" Auto Reload when changing theme
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

" Prettier
let g:prettier#autoformat = 0
let g:prettier#exec_cmd_async = 1
let g:prettier#nvim_unstable_async=1

augroup prettiers
  autocmd BufWritePre *.ts PrettierAsync %
augroup END

" Tagbar
let g:tagbar_type_typescript = {
      \ 'ctagsbin' : 'tstags',
      \ 'ctagsargs' : '-f-',
      \ 'kinds': [
      \ 'e:enums:0:1',
      \ 'f:function:0:1',
      \ 't:typealias:0:1',
      \ 'M:Module:0:1',
      \ 'I:import:0:1',
      \ 'i:interface:0:1',
      \ 'C:class:0:1',
      \ 'm:method:0:1',
      \ 'p:property:0:1',
      \ 'v:variable:0:1',
      \ 'c:const:0:1',
      \ ],
      \ 'sort' : 0
      \ }

set nobackup
set nowritebackup
set secure

nnoremap <leader>to :!npm run test-only<CR>

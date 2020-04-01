filetype plugin indent on
syntax enable

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'w0rp/ale'
Plug 'janko/vim-test'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'itchyny/lightline.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'powerman/vim-plugin-autosess'
Plug 'tapayne88/vim-mochajs'
call plug#end()
" }}}

let mapleader = " "
let maplocalleader=","

" Theme {{{
set t_Co=256
set background=dark
colorscheme codedark
" colorscheme rod
let g:lightline = { 'colorscheme': 'wombat' }
" }}}

" Vim Test {{{
let test#strategy = "dispatch"
" }}}

" Deoplete {{{
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('auto_complete_delay', 200)
" }}}

" Editor Config {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
" }}}

" FZF {{{
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=dist --exclude=docs --exclude="*.json"'
" }}}

" EasyMotion {{{
let g:EasyMotion_smartcase = 1

map s <Plug>(easymotion-overwin-f2)
" }}}

" ALE {{{
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let b:ale_fixers = {'typescript': ['prettier', 'tslint']}
" }}}

" UltiSnips {{{
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" }}}

" Settings {{{
set visualbell
set noshowmode
set timeoutlen=300
set updatetime=100
set autowrite
set backupcopy=yes

set clipboard+=unnamedplus
set mouse=a
set number
set numberwidth=2
set relativenumber
set hidden

set wrap
set expandtab
set shiftwidth=2
set smarttab

set incsearch
set ignorecase
set smartcase
set inccommand=nosplit
set grepprg=rg\ --vimgrep

set showbreak=↪\ 
set nolist
set listchars=tab:→\ ,trail:•,nbsp:␣,eol:↲
set sidescrolloff=5

set foldlevelstart=0
set splitright
" }}}

" Normal mappings {{{
nnoremap <leader><tab> <c-^>
nnoremap <leader>q :q<cr>
nnoremap <leader>n :nohl<cr>
nnoremap <leader>o :only<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>r "qyiw:%s/\v<c-r>q//gc<left><left><left>
nnoremap <leader>s :update<cr>
nnoremap <leader>w <c-w><c-w>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ed :e $MYVIMRC<cr>
nnoremap <leader>cd :cd expand('%:h')<cr>
nnoremap <leader>cp :let @+ = expand('%')<cr>
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l

nnoremap ; :
nnoremap Y yg_
"nnoremap H g0
"nnoremap L g$
nnoremap <s-l> gt
nnoremap <s-h> gT
nnoremap j gjzz
nnoremap k gkzz
nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz
nnoremap n nzzzv
nnoremap N nzzzv
nnoremap G Gzz
nnoremap cw ciw
"nnoremap / /\v
nnoremap Q @q

nnoremap <leader>; :execute "normal!\ mqA;\e`q"<cr>
nnoremap <leader>, :execute "normal!\ mqA,\e`q"<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>= mqgg=G<cr>'q

nnoremap <leader>bd :bdelete<cr>

nnoremap <tab> za

let i = 1
while i <= 3
  execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<cr>'
  let i = i + 1
endwhile

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n nzz:call HLNext(0.1)<cr>
nnoremap <silent> N Nzz:call HLNext(0.1)<cr>

function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

nnoremap <leader>td :Rg TODO\(rod\)<cr>

" FZF
nnoremap <leader>f :GitFiles<cr>
nnoremap <leader>bl :BLines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>cc :Commands<cr>
nnoremap <leader>y :Filetypes<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>mm :Maps<cr>
"nnoremap <leader>tt :Tags<cr>
imap <c-f> <plug>(fzf-complete-path)
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" NERDTree
nnoremap <leader>e :NERDTreeToggle<cr>
nnoremap <leader>p :NERDTreeFind<cr>

" ALE
nnoremap ]e :ALENext<cr>
nnoremap [e :ALEPrevious<cr>

" Fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Git commit<cr>
" }}}

" Visual mappings {{{
vmap > >gv
vmap < <gv
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>ag "qy:Rg <c-r>q<cr>
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
onoremap ef :<c-u>normal! ggVG<cr>
" }}}

" Abbreviations {{{
iabbrev adn and
iabbrev whiel while
iabbrev tehn then
iabbrev cosnt const
iabbrev applicaiton application
" }}}

" File write {{{
augroup WriteFilesGroup
  autocmd!
  autocmd BufNewFile,FocusLost *.js,*.jsx,*.ts,*.tsx,*.c :update
augroup END
" }}}

" HTML {{{
augroup HtmlFilesGroup
  autocmd!
  autocmd BufRead *.html :setlocal nowrap
augroup END
" }}}

" Javascript {{{
augroup JavascriptFilesGroup
  autocmd!
  autocmd FileType javascript
        \ nnoremap <buffer> <localleader>c mqI//<esc>'q
        \|nnoremap <buffer> <localleader>t :compiler mochajs<cr>:TestNearest<cr>
        \|iabbrev <buffer> cl console.log()<left>
augroup END
" }}}

" Typescript {{{
augroup TypescriptFilesGroup
  autocmd!
  autocmd BufWritePre *.ts :ALEFix prettier
  autocmd FileType typescript
        \ nnoremap <buffer> <localleader>h :ALEHover<cr>
        \|nnoremap <buffer> <localleader>d :ALEGoToDefinition<cr>
        \|nnoremap <buffer> <localleader>r :ALEFindReferences<cr>
        \|inoremap <buffer> <C-h> <esc>:ALEHover<cr>
augroup END
" }}}

" Vimscript {{{
augroup VimFilesGroup
  autocmd!
  autocmd FileType vim
        \ setlocal foldmethod=marker foldlevel=0
        \|nnoremap <buffer> <localleader>c I"<esc>
  autocmd BufWritePost $MYVIMRC source % | echom "Reloaded " . expand("%") | redraw
augroup END
" }}}

" Rust {{{
augroup RustFilesGroup
  autocmd!
  autocmd FileType rust nnoremap <buffer> <localleader>r :make run<cr>
  autocmd BufWritePost *.rs :Make build
augroup END
" }}}

" Markdown {{{
augroup MarkdownFilesGroup
  autocmd!
  autocmd FileType markdown setlocal wrap nonumber norelativenumber
augroup END
" }}}

" C {{{
augroup CFilesGroup
  autocmd!
  autocmd FileType c
        \ iabbrev iio #include <stdio.h>
        \|iabbrev ilib #include <stdlib.h>
augroup END
" }}}

" Shell {{{
augroup ShellGroup
  autocmd!
  autocmd FileType sh
        \ nnoremap <buffer><localleader>, :!chmod +x %<cr>:Dispatch ./%<cr>
augroup END
" }}}

" Rust {{{
augroup RustFilesGroup
  autocmd!
  autocmd FileType rust nnoremap <buffer> <localleader>r :make run<cr>
  autocmd BufWritePost *.rs :Make build
augroup END
" }}}

" Make {{{
augroup MakeFilesGroup
  autocmd!
  autocmd FileType make
        \ setlocal noexpandtab shiftwidth=4
augroup END
" }}}

" Pgcli {{{
augroup PgcliFilesGroup
  autocmd!
  autocmd BufRead /tmp/psql.edit.* setlocal syntax=sql
augroup END
" }}}

" Buffer {{{
augroup BufferSettings
  autocmd!
  autocmd BufEnter * setlocal cursorline
        \| highlight ALEWarningSign ctermbg=0 ctermfg=16
        \| highlight ALEErrorSign ctermbg=0 ctermfg=1
        \| highlight LineNr ctermbg=002635 ctermfg=59
  autocmd BufLeave * setlocal nocursorline
augroup END
" }}}

" XResources {{{
augroup XResourcesGroup
  autocmd!
  autocmd BufWritePost ~/.Xresources silent !xrdb -load ~/.Xresources
augroup END
" }}}

" Sxhkd {{{
augroup Sxhkd
  autocmd!
  autocmd BufWritePost ~/.sxhkd/sxhkdrc silent !killall sxhkd
augroup END
" }}}

" Base16 color scheme {{{
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
"    source ~/.vimrc_background
endif
" }}}


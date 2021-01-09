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
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'w0rp/ale'
Plug 'janko/vim-test'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'itchyny/lightline.vim'
" Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'krisajenkins/vim-postgresql-syntax'
Plug 'ap/vim-css-color'
Plug 'guns/xterm-color-table.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'antoinemadec/coc-fzf'
Plug 'benmills/vimux'
Plug 'kevinoid/vim-jsonc'
Plug 'nicwest/vim-http'
Plug 'christoomey/vim-tmux-navigator'
" colorschemes
Plug 'karoliskoncevicius/distilled-vim'
Plug 'lifepillar/vim-gruvbox8'
call plug#end()
" }}}

let mapleader = " "
let maplocalleader=","

" Theme {{{
set t_Co=256
set background=dark
colorscheme codedark

let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
	\ }

function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
  set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}
endfunction
command! -nargs=0 Syn call Syn()
" }}}

" COC {{{
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-snippets',
      \'coc-jest',
      \'coc-clangd',
      \'coc-rust-analyzer',
      \'coc-pairs']

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "错误"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

inoremap <silent><expr> <Tab> coc#refresh()
" nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>qf <Plug>(coc-fix-current)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <silent>ga <Plug>(coc-codeaction)
nmap <silent>[g <Plug>(coc-diagnostic-prev)
nmap <silent>]g <Plug>(coc-diagnostic-next)
nmap <silent><C-s> <Plug>(coc-range-select)
xmap <silent><C-s> <Plug>(coc-range-select)
nnoremap <silent><nowait> <leader>d :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>x :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <leader>o :<C-u>CocList outline<cr>
" nnoremap <silent><nowait> <leader>p :<C-u>CocFzfList symbols<cr>
nnoremap <silent><nowait> <leader>p :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>j :<C-u>CocNext<cr>
nnoremap <silent><nowait> <leader>k :<C-u>CocPrev<cr>
nnoremap <silent><nowait> <leader>rs :<C-u>CocListResume<cr>
nnoremap <silent><nowait> <leader>cc :<C-u>CocList commands<cr>

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold :call CocAction('fold', <f-args>)
command! -nargs=0 Organize :call CocAction('runCommand', 'editor.action.organizeImport')

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
"   inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"   inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" }}}

" {{{ NERDTree
let g:NERDTreeQuitOnOpen = 1
" }}}

" Vim Test {{{
let test#strategy = "vimux"
let g:test#javascript#mocha#file_pattern = '\v.*\.(test|spec)\.(ts|js)$'
" }}}

" Editor Config {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
" }}}

" FZF {{{
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=dist --exclude=docs --exclude="*.json"'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
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
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
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
set shortmess+=c
set signcolumn=yes

set wrap
set expandtab
set shiftwidth=2
set shiftround
set smarttab

set incsearch
set ignorecase
set smartcase
set inccommand=split
set grepprg=rg\ --vimgrep

set showbreak=↪\ 
set nolist
set listchars=tab:→\ ,trail:•,nbsp:␣,eol:↲
set sidescrolloff=5

set foldlevelstart=0
set splitright
" }}}

" Normal mappings {{{
nnoremap <leader><tab> <c-^>zz
nnoremap <leader>q :q<cr>
nnoremap <leader>a :Alternate<cr>zz
nnoremap <leader>n :nohl<cr>
" nnoremap <leader>o :only<cr>
nnoremap <leader>l :set list!<cr>
nnoremap <leader>r "qyiw:%s/\v<c-r>q//gc<left><left><left>
nnoremap <leader>s :update<cr>
nnoremap <leader>w <c-w><c-w>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>ed :e $MYVIMRC<cr>
nnoremap <leader>cd :lcd %:p:h<cr>
nnoremap <leader>cp :let @+ = expand('%')<cr>
nnoremap <m-h> <c-w>h
nnoremap <m-j> <c-w>j
nnoremap <m-k> <c-w>k
nnoremap <m-l> <c-w>l
nnoremap <a-j> :cnext<cr>
nnoremap <a-k> :cprev<cr>

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
nnoremap } }zz
nnoremap { {zz
nnoremap * *zz
nnoremap n nzz
" nnoremap n nzzzv
" nnoremap N nzzzv
nnoremap G Gzz
nnoremap cw ciw
"nnoremap / /\v
nnoremap Q @q

nnoremap <leader>; :execute "normal!\ mqA;\e`q"<cr>
nnoremap <leader>, :execute "normal!\ mqA,\e`q"<cr>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>= mqgg=G<cr>'qzz

nnoremap <leader>bd :bdelete<cr>

nnoremap <tab> za

let i = 1
while i <= 3
  execute 'nnoremap <leader>' . i . ' :' . i . 'wincmd w<cr>'
  let i = i + 1
endwhile

" Damian Conway's Die Blinkënmatchen: highlight matches
nnoremap <silent> n nzzzv:call HLNext(0.1)<cr>
nnoremap <silent> N Nzzzv:call HLNext(0.1)<cr>

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
nnoremap <leader>z :Rg 
nnoremap <leader>f :Files<cr>
nnoremap <leader>bl :BLines<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :BTags<cr>
" nnoremap <leader>cc :Commands<cr>
nnoremap <leader>y :Filetypes<cr>
nnoremap <leader>h :History<cr>
nnoremap <leader>mm :Maps<cr>
"nnoremap <leader>tt :Tags<cr>
imap <c-f> <plug>(fzf-complete-file-ag)
imap <c-l> <plug>(fzf-complete-line)
imap <c-x><c-k> <plug>(fzf-complete-word)

" NERDTree
" nnoremap <leader>e :NERDTreeToggle<cr>
function MyNerdToggle()
    if &filetype == 'nerdtree'
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction

nnoremap <leader>e :call MyNerdToggle()<CR>

" ALE
nnoremap ]e :ALENext<cr>zz
nnoremap [e :ALEPrevious<cr>zz

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
augroup end
" }}}

" HTML {{{
augroup HtmlFilesGroup
  autocmd!
  autocmd BufRead *.html :setlocal nowrap
augroup end
" }}}

" Javascript {{{
augroup JavascriptFilesGroup
  autocmd!
  autocmd FileType javascript
        \ nnoremap <buffer> <localleader>c mqI//<esc>'q
        \|nnoremap <buffer> <localleader>t :TestNearest<cr>
        \|nnoremap <buffer> <localleader>f :TestFile<cr>
        \|nnoremap <buffer> <localleader>l :TestLast<cr>
        \|nnoremap <buffer> <localleader>, :Dispatch node %<cr>
        \|iabbrev <buffer> cl console.log()<left>
augroup end
" }}}

" Typescript {{{
augroup TypescriptFilesGroup
  autocmd!
  autocmd BufWritePre *.ts :ALEFix prettier
  autocmd FileType typescript
        \ nnoremap <buffer> <localleader>c mqI//<esc>'q
        \|nnoremap <buffer> <localleader>t :update<cr>:TestNearest<cr>
        \|nnoremap <buffer> <localleader>f :TestFile<cr>
        \|nnoremap <buffer> <localleader>l :TestLast<cr>
        \|nnoremap <buffer> <localleader>, :Dispatch npx ts-node %<cr>
augroup end
" }}}

" Vimscript {{{
augroup VimFilesGroup
  autocmd!
  autocmd FileType vim
        \ setlocal foldmethod=marker foldlevel=0
        \|nnoremap <buffer> <localleader>, :update<cr>:source %<cr>
  autocmd BufWritePost $MYVIMRC source % | echom "Reloaded " . expand("%") | redraw
augroup end
" }}}

" Rust {{{
augroup RustFilesGroup
  autocmd!
  autocmd FileType rust nnoremap <buffer> <localleader>r :make run<cr>
  autocmd BufWritePost *.rs :Make build
augroup end
" }}}

" Markdown {{{
augroup MarkdownFilesGroup
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak nonumber norelativenumber spell spelllang=pt_br
augroup end
" }}}

" C {{{
augroup CFilesGroup
  autocmd!
  autocmd BufWritePost *.c :Make
  autocmd FileType c
        \ iabbrev iio #include <stdio.h>
        \|iabbrev ilib #include <stdlib.h>
        \|nnoremap <buffer> <localleader>, :update<cr>:Dispatch cc -std=c99 % && ./a.out<cr>
augroup end
" }}}

" Shell {{{
augroup ShellGroup
  autocmd!
  autocmd FileType sh
        \ nnoremap <buffer><localleader>, :!chmod +x %<cr>:Dispatch ./%<cr>
augroup end
" }}}

" Rust {{{
augroup RustFilesGroup
  autocmd!
  autocmd FileType rust nnoremap <buffer> <localleader>r :make run<cr>
  autocmd BufWritePost *.rs :Make build
augroup end
" }}}

" Make {{{
augroup MakeFilesGroup
  autocmd!
  autocmd FileType make
        \ setlocal noexpandtab shiftwidth=4
augroup end
" }}}

" Pgcli {{{
augroup PgcliFilesGroup
  autocmd!
  autocmd BufRead /tmp/psql.edit.* setlocal syntax=sql
augroup end
" }}}

" Buffer {{{
augroup BufferSettings
  autocmd!
  autocmd BufEnter * setlocal cursorline
        \| highlight ALEWarningSign ctermbg=0 ctermfg=16
        \| highlight ALEErrorSign ctermbg=0 ctermfg=1
  autocmd BufLeave * setlocal nocursorline
augroup end
" }}}

" XResources {{{
augroup XResourcesGroup
  autocmd!
  autocmd BufWritePost ~/.Xresources silent !xrdb -load ~/.Xresources
augroup end
" }}}

" Sxhkd {{{
augroup Sxhkd
  autocmd!
  autocmd BufWritePost sxhkdrc silent !killall sxhkd
        \| silent !sxhkd -c %
augroup end
" }}}

" i3blocks {{{
augroup i3blocks
  autocmd!
  autocmd BufWritePost i3blocks.conf silent !i3-msg restart
augroup end

" }}}

" Base16 color scheme {{{
if filereadable(expand("~/.vimrc_background"))
    let base16colorspace=256
    " source ~/.vimrc_background
endif
" }}}

" Coc {{{
augroup CocGroup
  autocmd!
  " Highlight the symbol and its references when holding the cursor.
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
  " Lightline update.
  autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
augroup end
" }}}

" Http {{{
let g:vim_http_split_vertically=0
let g:vim_http_tempbuffer=1
" }}}

set nocompatible
filetype plugin on
filetype indent on

" settings completion {{{
set omnifunc=syntaxcomplete#Complete
set path+=src/**,components/**,modules/**,interfaces/**
set wildmenu
set wildmode=longest:full,full
set wildignore+=*/node_modules/*,__sapper__/*,tags,package-lock.json
set wildignorecase
" }}}

" settings ui/ux {{{
set clipboard+=unnamedplus
set updatetime=50
set timeoutlen=300
set hidden
set autowrite
set belloff=all
set noshowmode
set noshowcmd
set shortmess+=cF
set laststatus=1
set mouse=a
set number
set numberwidth=2
set relativenumber
set signcolumn=auto
set scrolloff=5
set sidescrolloff=5
set showbreak=↪\
set list
set listchars=tab:→\ ,trail:•,nbsp:␣,eol:↲
set foldlevelstart=0
set splitright
set splitbelow
set background=dark
" }}}

" settings search {{{
set nohlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split "nosplit
set grepprg=rg\ --vimgrep\ --smart-case
" }}}

" settings spacing {{{
set wrap
set linebreak
set autoindent
set expandtab
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set shiftround
" }}}

" settings backup {{{
set undofile
set undolevels=100
set nobackup
set noswapfile
set nowritebackup
" }}}

" settings performance {{{
set lazyredraw
" set nocursorline
" }}}

" plugins {{{
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-sensible'
" Plug 'tpope/vim-rsi'
" Plug 'tpope/vim-dotenv'
" Plug 'tpope/vim-dadbod'
" Plug 'tpope/vim-abolish'
" Plug 'tpope/vim-apathy'
" Plug 'tpope/vim-sleuth'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-eunuch'
" Plug 'tpope/vim-obsession'
" Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
" Plug 'tpope/vim-vinegar'
" Plug 'tpope/vim-projectionist'
Plug 'editorconfig/editorconfig-vim'
Plug 'airblade/vim-gitgutter'
Plug 'janko/vim-test'
Plug 'benmills/vimux'
Plug 'w0rp/ale'
Plug 'krisajenkins/vim-postgresql-syntax'
" Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tmux-plugins/vim-tmux-focus-events'
" Plug 'itchyny/lightline.vim'
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
" Plug 'easymotion/vim-easymotion'
" Plug 'ap/vim-css-color'
" Plug 'guns/xterm-color-table.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf'
Plug 'kevinoid/vim-jsonc'
" Plug 'nicwest/vim-http'
" Plug 'christoomey/vim-tmux-navigator'
" colorschemes
Plug 'tomasiser/vim-code-dark'
call plug#end()
" }}}

" theme {{{
colorscheme codedark
" }}}

" netrw {{{
let g:netrw_banner=0
" }}}

" fzf {{{
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=dist --exclude=docs --exclude="*.json"'
command! -bang -nargs=* Ripgrep
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
" }}}

" ale {{{
let g:ale_fix_on_save = 1
let g:ale_completion_enabled = 0
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '-'
let b:ale_fixers = {'typescript': ['prettier', 'eslint']}
" }}}

" vim test {{{
let test#strategy = "vimux"
let g:test#javascript#mocha#file_pattern = '\v.*\.(test|spec)\.(ts|js)$'
" }}}

" mappings {{{
let mapleader = " "
let maplocalleader = ","

"nnoremap Y yg_
"nnoremap H g0
"nnoremap L g$
"nnoremap L gt
"nnoremap H gT
nnoremap j gjzz
nnoremap k gkzz
nnoremap <silent> n nzzzv:call HLNext(0.1)<cr>
nnoremap <silent> N Nzzzv:call HLNext(0.1)<cr>
nnoremap * *zzzv
nnoremap # #zzzv
nnoremap G Gzz
nnoremap } }zz
nnoremap { {zz
nnoremap gj jzz
nnoremap gk kzz

nnoremap ]a :next<cr>
nnoremap [a :prev<cr>
nnoremap ]b :bnext<cr>
nnoremap [b :bprev<cr>
nnoremap ]l :lnext<cr>
nnoremap [l :lprev<cr>
nnoremap ]q :cnext<cr>
nnoremap [q :cprev<cr>
" ale
nnoremap ]e :ALENext<cr>zz
nnoremap [e :ALEPrevious<cr>zz

nnoremap <c-f> <c-f>zz
nnoremap <c-b> <c-b>zz
nnoremap <c-u> <c-u>zz
nnoremap <c-d> <c-d>zz

nnoremap - :Explore<cr>
nnoremap \ za
nnoremap <leader><tab> <c-^>
" nnoremap <leader>/ :silent grep ''<left>
nnoremap <leader>/ :Ripgrep 
nnoremap <leader>= mqgg=G<cr>'qzz
nnoremap <leader>; :execute "normal!\ mqA;\e`q"<cr>
nnoremap <leader>, :execute "normal!\ mqA,\e`q"<cr>
nnoremap <leader>a :Alternate<cr>zz
nnoremap <leader>q :quit<cr>
nnoremap <leader>w <c-w><c-w>
" nnoremap <leader>f :find *
nnoremap <leader>r :%s/\<<C-r><C-w>\>//cg<left><left><left>
nnoremap <leader>s :update<cr>
nnoremap <leader>n :nohlsearch<cr>
" fzf
nnoremap <leader>f :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>t :BTags<cr>
nnoremap <leader>h :History<cr>

nnoremap <leader>bd :bdelete<cr>
nnoremap <leader>cd :windo lcd %:h<cr>
nnoremap <leader>cp :let @+ = expand('%:~')<cr>
nnoremap <leader>ev :edit $MYVIMRC<cr>
nnoremap <leader>ol :setlocal list!<cr>
nnoremap <leader>on :call ToggleNumber()<cr>
nnoremap <leader>os :setlocal spell!<cr>
nnoremap <leader>ow :setlocal wrap!<cr>
" fugitive
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gc :Git commit<cr>

nnoremap <down> :cnext<cr>
nnoremap <up> :cprev<cr>
nnoremap <right> :tabnext<cr>
nnoremap <left> :tabprev<cr>

vnoremap > >gv
vnoremap < <gv

inoremap <c-u> <esc>viwUea

onoremap ef :<c-u>normal! ggVG<cr>

cnoremap <expr> %% getcmdtype() == ':' ? expand('%:h').'/' : '%%'
" }}}

" abbreviations {{{
iabbrev adn and
iabbrev whiel while
iabbrev tehn then
iabbrev cosnt const
iabbrev applicaiton application

cnoreabbrev w!! write !sudo tee > /dev/null %
" }}}

" coc {{{
let g:coc_global_extensions = [
      \'coc-json',
      \'coc-tsserver',
      \'coc-eslint',
      \'coc-snippets',
      \'coc-jest',
      \'coc-clangd',
      \'coc-rust-analyzer',
      \'coc-java',
      \'coc-pairs']

function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

inoremap <silent><expr> <Tab> coc#refresh()
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
nnoremap <silent><nowait> <leader>u :<C-u>CocList outline<cr>
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

" auto write {{{
augroup WriteFilesGroup
  autocmd!
  autocmd BufNewFile,FocusLost *.js,*.jsx,*.ts,*.tsx,*.c :update
augroup end
" }}}

" auto html {{{
augroup HtmlFilesGroup
  autocmd!
  autocmd BufRead *.html :setlocal nowrap
augroup end
" }}}

" auto javascript {{{
augroup JavascriptFilesGroup
  autocmd!
  autocmd FileType javascript,typescript
        \nnoremap <buffer> gf :call JavascriptGotoFile()<cr>
        \|nnoremap <buffer> <localleader>t :TestNearest<cr>
        \|nnoremap <buffer> <localleader>f :TestFile<cr>
        \|nnoremap <buffer> <localleader>l :TestLast<cr>
        \|nnoremap <buffer> <localleader>, :Dispatch node %<cr>
        \|iabbrev <buffer> cl console.log()<left>
augroup end
" }}}

" auto typescript {{{
augroup TypescriptFilesGroup
  autocmd!
  " autocmd BufWritePre *.ts :ALEFix prettier
  autocmd FileType typescript
        \|nnoremap <buffer> <localleader>, :Dispatch npx ts-node %<cr>
augroup end
" }}}

" auto rust {{{
augroup RustFilesGroup
  autocmd!
  autocmd FileType rust nnoremap <buffer> <localleader>r :make run<cr>
  autocmd BufWritePost *.rs :Make build
augroup end
" }}}

" auto c {{{
augroup CFilesGroup
  autocmd!
  autocmd BufWritePost *.c :Make
  autocmd FileType c
        \ iabbrev iio #include <stdio.h>
        \|iabbrev ilib #include <stdlib.h>
        \|nnoremap <buffer> <localleader>, :update<cr>:Dispatch cc -std=c99 % && ./a.out<cr>
augroup end
" }}}

" auto shell {{{
augroup ShellGroup
  autocmd!
  autocmd FileType sh
        \ nnoremap <buffer><localleader>, :!chmod +x %<cr>:Dispatch ./%<cr>
augroup end
" }}}

" auto pgcli {{{
augroup PgcliFilesGroup
  autocmd!
  autocmd BufRead /tmp/psql.edit.* setlocal syntax=sql
augroup end
" }}}

" auto xresources {{{
augroup XResourcesGroup
  autocmd!
  autocmd BufWritePost ~/.Xresources silent !xrdb -load ~/.Xresources
augroup end
" }}}

" auto sxhkd {{{
augroup Sxhkd
  autocmd!
  autocmd BufWritePost sxhkdrc silent !killall sxhkd >/dev/null
        \| silent !sxhkd -c %
augroup end
" }}}

" auto i3blocks {{{
augroup i3blocks
  autocmd!
  autocmd BufWritePost i3blocks.conf silent !i3-msg restart
augroup end

" }}}

" auto coc {{{
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

" auto vim {{{
augroup VimGroup
	autocmd!
  autocmd FileType vim setlocal foldmethod=marker foldlevel=0
	autocmd BufWritePost *.vim,$MYVIMRC source %
        \| echom "Reloaded " . expand("%")
        \| redraw
augroup end
" }}}

" auto cursor {{{
augroup CursorLineGroup
  autocmd!
  autocmd BufEnter * setlocal cursorline
  autocmd BufLeave * setlocal nocursorline
augroup end
" }}}

" auto search {{{
augroup SearchHighlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup end
" }}}

" auto quickfix {{{
augroup AutoOpenQuickfix
  autocmd!
  autocmd QuickFixCmdPost [^l]* cwindow
  autocmd QuickFixCmdPost l* lwindow
augroup end
" }}}

" auto plug {{{
augroup PlugGroup
  autocmd!
  autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
        \| PlugInstall --sync | source $MYVIMRC
        \| endif
augroup end
" }}}

" auto markdown {{{
augroup MarkdownGroup
  autocmd!
  autocmd FileType markdown setlocal wrap linebreak nonumber norelativenumber spell spelllang=en_us,pt_br
augroup end
" }}}

" auto make {{{
augroup MakeGroup
  autocmd!
  autocmd FileType make
        \ setlocal noexpandtab shiftwidth=4
augroup end
" }}}

" functions {{{
" Damian Conway's Die Blinkënmatchen: highlight matches
function! HLNext (blinktime)
  let target_pat = '\c\%#'.@/
  let ring = matchadd('ErrorMsg', target_pat, 101)
  redraw
  exec 'sleep ' . float2nr(a:blinktime * 1000) . 'm'
  call matchdelete(ring)
  redraw
endfunction

function! Syn()
  for id in synstack(line("."), col("."))
    echo synIDattr(id, "name")
  endfor
  set statusline=%{synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')}
endfunction
command! -nargs=0 Syn call Syn()

function! ToggleNumber()
  set number! relativenumber!
  if &signcolumn == "yes"
    set signcolumn="auto"
  else 
    set signcolumn="yes"
  endif
endfunction

function! JavascriptGotoFile()
  normal! f'gf
endfunction

function! ParseConsistencyIndex()
  execute "normal! gg"
  execute "normal! d/+ set\<cr>"
  execute "normal! dd"
  execute "normal! /pipeline\<cr>"
  execute "normal! dG"
  execute "normal! :g/^2021/d\<cr>"
  execute "normal! :%s/,\\n/,/g\<cr>"
  execute "normal! :g/[{}]/d\<cr>"
  execute "normal! :%s/\\s*//g\<cr>"
endfunction
command! -nargs=0 Parse call ParseConsistencyIndex()
" }}}

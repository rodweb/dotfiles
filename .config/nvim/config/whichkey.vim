let g:which_key_map =  {}
call which_key#register('<Space>', "g:which_key_map")
nnoremap <silent><leader> :WhichKey '<Space>'<CR>

let g:which_key_map['='] = ['<Space>=', 'indent file']
let g:which_key_map[';'] = ['<Space>;', 'add semicolon']
let g:which_key_map['<tab>'] = ['<Space><tab>', 'alternate']

for s:i in range(1, 3)
  let g:which_key_map[s:i] = 'window-'.s:i
endfor

let g:which_key_map['a'] = {
      \ 'name': '+ferret/ripgrep'                          ,
      \ 'c' : ['<Space>ac'    , 'ferret search']           ,
      \ 'g' : ['<Space>ag'    , 'ripgrep all with fzf selection'],
      \ 'l' : ['<Space>al'    , 'ferret search with list'] ,
      \ 'r' : ['<Space>ar'    , 'ferret replace']          ,
      \ 's' : ['<Space>as'    , 'ferret search selection'] ,
      \ }

let g:which_key_map['b'] = {
      \ 'name': '+buffer'                                  ,
      \ 'b' : ['<Space>bb'    , 'find buffers']            ,
      \ 'd' : ['<Space>bd'    , 'delete buffer']           ,
      \ 'D' : ['<Space>bD'    , 'force delete buffer ']    ,
      \ 'n' : ['<Space>bn'    , 'next buffer']             ,
      \ 'p' : ['<Space>bp'    , 'previous buffer']         ,
      \ }

let g:which_key_map['c'] = {
      \ 'name': '+command/comment'                         ,
      \ 'c' : ['<Space>cc'    , 'find commands']           ,
      \ 'l' : ['<Space>cl'    , 'comment line']            ,
      \ }

let g:which_key_map['f'] = {
      \ 'name' : '+file/find'                              ,
      \ 'a' : ['<Space>fa'    , 'find all files']          ,
      \ 'd' : ['<Space>fd'    , 'find on file tree']       ,
      \ 'e' : {
      \    'name': '+editor'                               ,
      \    'd': ['<Space>fed' , 'open vimrc file']         ,
      \    'v': ['<Space>fev' , 'split vimrc file']        ,
      \ }                                                  ,
      \ 'f' : ['<Space>ff'    , 'find all git files']      ,
      \ 'n' : ['<Space>fn'    , 'new file']                ,
      \ 'r' : ['<Space>fr'    , 'find references']         ,
      \ 's' : ['<Space>fs'    , 'save file']               ,
      \ 'S' : ['<Space>fS'    , 'save all files']          ,
      \ 't' : ['<Space>ft'    , 'toggle file tree']        ,
      \ 'y' : ['<Space>fy'    , 'find filetypes']          ,
      \ }

let g:which_key_map['g'] = {
      \ 'name': '+git'                                     ,
      \ 'd' : ['<Space>gd'    , 'git diff']                ,
      \ 'C' : ['<Space>gC'    , 'git commit']              ,
      \ 's' : ['<Space>gs'    , 'git status']              ,
      \ }

let g:which_key_map['h'] = {
      \ 'name': '+history/hunk'                            ,
      \ 'h' : ['<Space>hh'    , 'find recent file']        ,
      \ 'p' : ['<Space>hp'    , 'preview hunk']            ,
      \ }

let g:which_key_map['m'] = {
      \ 'name': '+mapping'                                 ,
      \ 'm' : ['<Space>mm'    , 'find mapping']            ,
      \ }

let g:which_key_map['o'] = {
      \ 'name': '+options'                                 ,
      \ 'f' : ['<Space>of'    , 'toggle limelight']        ,
      \ 'g' : ['<Space>og'    , 'toggle goyo']             ,
      \ 'h' : ['<Space>oh'    , 'toggle hardtime']         ,
      \ 'i' : ['<Space>oi'    , 'toggle indentline']       ,
      \ 'l' : ['<Space>ol'    , 'toggle special chars']    ,
      \ 's' : ['<Space>os'    , 'toggle spell check']      ,
      \ }

let g:which_key_map['q'] = {
      \ 'name': '+quit'                                    ,
      \ 'q' : ['<Space>qq'    , 'quit']                    ,
      \ 'Q' : ['<Space>qQ'    , 'force quit']              ,
      \ }

let g:which_key_map['r'] = {
      \ 'name': '+replace'                                 ,
      \ 'r' : ['<Space>rr'    , 'replace under cursor']    ,
      \ }

let g:which_key_map['s'] = {
      \ 'name': '+search'     ,
      \ 'c' : ['<Space>sc'    , 'clear highlight']         ,
      \ 'a' : ['<Space>sa'    , 'add word']                ,
      \ 'r' : ['<Space>sr'    , 'remove word']             ,
      \ 'g' : ['<Space>sg'    , 'suggest word']            ,
      \ }

let g:which_key_map['t'] = {
      \ 'name': '+test/tag/tab'                            ,
      \ 'b' : ['<Space>tb'    , 'toggle tag bar']          ,
      \ 'e' : ['<Space>te'    , 'open file on tab']        ,
      \ 'f' : ['<Space>tf'    , 'test file']               ,
      \ 'l' : ['<Space>tl'    , 'test last']               ,
      \ 'n' : ['<Space>tn'    , 'test nearest']            ,
      \ 'o' : ['<Space>to'    , 'test only']               ,
      \ 'p' : ['<Space>tp'    , 'test project']            ,
      \ 't' : ['<Space>tt'    , 'find tags']               ,
      \ 'v' : ['<Space>tv'    , 'test visit']              ,
      \ }

let g:which_key_map['w'] = {
      \ 'name': '+window'                                  ,
      \ 'd' : ['<Space>wd'    , 'delete window']           ,
      \ 'h' : ['<Space>wh'    , 'window left']             ,
      \ 'l' : ['<Space>wl'    , 'window right']            ,
      \ 'j' : ['<Space>wj'    , 'window down']             ,
      \ 'k' : ['<Space>wk'    , 'window up']               ,
      \ 'w' : ['<Space>ww'    , 'find windows']            ,
      \ }

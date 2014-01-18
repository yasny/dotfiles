
" Detect OS {{{
  let s:is_windows = has('win32') || has('win64')
  let s:is_cygwin = has('win32unix')
  let s:is_macvim = has('gui_macvim')
"}}}

"set guifont=Monaco:h9.00
"silent! colorscheme macvim
set showtabline=2 
"set gfn=Osaka-Mono:h14
set gfn=IPAゴシック:h14
"set guioptions=gmrLtT
set guioptions=gmrLta
" set lines=68 columns=110
" set noanti " turn off anti-alias
" set lines=999 columns=9999

set lines=999 columns=9999
if s:is_windows
  autocmd GUIEnter * simalt ~x
endif

if s:is_macvim
  set transparency=2
endif

" IME settings {{{
set imsearch=0
inoremap <ESC> <ESC>:set iminsert=0<CR>
inoremap <C-ESC> <C-ESC>:set iminsert=0<CR>
highlight CusorIM guibg=Purple guifg=NONE
" }}}

" Mouse settings {{{
set mouse=a
set nomousefocus
set mousehide
" }}}

" miniBufExplorer {{{
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplMapWindowNavArrows=1
" }}}

" source .gvim.custom file if it exists
if filereadable(".gvim.custom")
  so .gvim.custom
endif


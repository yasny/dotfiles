set nocompatible
execute pathogen#infect()
syntax on
filetype plugin indent on
"set ruler
set ts=2
set ai
set noincsearch
set binary noeol
"set noimdisableactivate
"set backspace=indent,eol,start
set showmatch
set matchtime=2
set lazyredraw
set timeoutlen=300
set ttimeoutlen=50

" バックスペースでインデントや改行を削除できるようにする
set backspace=2
set novisualbell
set t_vb=
set nobackup
set nowrap
set expandtab
set nu!
set wildmenu
set modeline
set laststatus=2
set foldmethod=marker
set shiftwidth=2
set softtabstop=2
set nopaste
set ttyfast
"autocmd FileType python runtime! autoload/pythoncomplete.vim

" set directories for swap files
set dir=~/tmp,/var/tmp,/tmp

set clipboard+=autoselect

set hidden                                          "allow buffer switching without saving
set autoread                                        "auto reload if file saved externally
set fileformats+=mac                                "add mac to auto-detection of file format line endings
set nrformats-=octal                                "always assume decimal numbers
"set showcmd
set tags=tags;/
set showfulltag
set modelines=5
set history=1000

set linebreak
let &showbreak='↪ '

if exists('&ambiwidth')
  set ambiwidth=double
endif

set formatoptions+=mM
let format_allow_over_tw = 1
set colorcolumn=+1
set display+=lastline
set scrolloff=5
set scrolljump=5
set sidescrolloff=5
set splitbelow
set splitright
set noerrorbells

set cursorline
autocmd WinLeave * setlocal nocursorline
autocmd WinEnter * setlocal cursorline

" add qfixapp to runtime path
set runtimepath+=~/Applications/qfixapp

" for text files, set text width to 80 char
autocmd FileType text set textwidth=80

" set shell to bash if not using fish
if &shell =~# 'fish$'
  set shell=/bin/bash
endif

if &t_Co == 8 && $TERM !~# '^linux'
  set t_Co=16
endif

" Searching {{{
  set hlsearch
  set ignorecase
  set smartcase
  if executable('ack')
    set grepprg=ack\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow\ $*
    set grepformat=%f:%l:%c:%m
  endif
  if executable('ag')
    set grepprg=ag\ --nogroup\ --column\ --smart-case\ --nocolor\ --follow
    set grepformat=%f:%l:%c:%m
  endif
" }}}

" Detect OS {{{
  let s:is_windows = has('win32') || has('win64')
  let s:is_cygwin = has('win32unix')
  let s:is_macvim = has('gui_macvim')
"}}}

" Colorscheme settings {{{
  if has('gui_running')
    set background=light
  else
    set background=dark
  endif
  let g:solarized_menu=0
  colorscheme solarized
" }}}

" QFixHowm Settings {{{
let QFixHowm_Key='g'
let howm_dir='~/Dropbox/個人/vim_howm'
let howm_filename        = '%Y/%m/%Y-%m-%d-%H%M%S.txt'
let howm_fileencoding    = 'utf-8'
let howm_fileformat      = 'unix'
" }}}

" Key Settings {{{

" map <Leader> to ,
let mapleader=","

" disable entering Ex mode
nnoremap Q <nop>

" fix vim-latex:IMAP remapping C-J
nnoremap <SID>I_won't_ever_type_this <Plug>IMAP_JumpForward

nnoremap <C-Tab> :bnext<CR>
nnoremap <S-C-Tab> :bprevious<CR>

nnoremap <silent> <ESC><ESC> :nohlsearch<CR>
vnoremap < <gv
vnoremap > >gv

nnoremap <C-H> <C-W>h
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l

map <C-O> :NERDTreeToggle<cr>

nmap . .`[

nnoremap <F5> :GundoToggle<CR>

nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>s <C-w>s
nnoremap <leader>vsa :vert sba<cr>

" screen line scroll
nnoremap <silent> j gj
nnoremap <silent> k gk

  " sane regex {{{
    nnoremap / /\v
    vnoremap / /\v
    nnoremap ? ?\v
    vnoremap ? ?\v
    nnoremap :s/ :s/\v
  " }}}

  " command-line window {{{
    nnoremap q: q:i
    nnoremap q/ q/i
    nnoremap q? q?i
  " }}}
  
  " smash escape
  inoremap jk <esc>
  inoremap kj <esc>

  " remap arrow keys
  nnoremap <left> :bprev<CR>
  nnoremap <right> :bnext<CR>
  nnoremap <up> :tabnext<CR>
  nnoremap <down> :tabprev<CR>

  " general
  nmap <leader>l :set list! list?<cr>
  nnoremap <BS> :set hlsearch! hlsearch?<cr>

  " make Y consistent with C and D. See :help Y.
  nnoremap Y y$

" }}}

" vim-latex {{{
let g:tex_flavor='xelatex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='xelatex -shell-escape --interaction=nonstopmode %'
let g:Tex_ViewRule_pdf='open -a Preview'
let g:Tex_Menus=0
set iskeyword+=:
" }}}

" Previm {{{
let g:previm_open_cmd="open -a Safari"
" }}}

" MemoList {{{
let g:memolist_path = "/Users/iwalker/Dropbox/notes/memolist"
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline_detect_iminsert=1
" }}}

" Unite.vim {{{
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert=1
let g:unite_data_directory='~/.vim/.cache/unite'
let g:unite_source_rec_max_cache_files=1000
let g:unite_prompt='≫ '
if executable("ag")
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
end

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#set_profile('files', 'smartcase', 1)
call unite#custom#source('line,outline','matchers','matcher_fuzzy')

nmap <space> [unite]
nnoremap [unite] <nop>

if s:is_windows
  nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec buffer file_mru bookmark<cr><c-u>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec<cr><c-u>
else
  nnoremap <silent> [unite]<space> :<C-u>Unite -toggle -auto-resize -buffer-name=mixed file_rec/async buffer file_mru bookmark<cr><c-u>
  nnoremap <silent> [unite]f :<C-u>Unite -toggle -auto-resize -buffer-name=files file_rec/async<cr><c-u>
endif

nnoremap <silent> [unite]y :<C-u>Unite -buffer-name=yanks history/yank<cr>
nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
nnoremap <silent> [unite]c :<C-u>Unite -winheight=10 -auto-preview -buffer-name=colorschemes colorscheme<cr>
nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  nmap <buffer> Q <plug>(unite_exit)
  nmap <buffer> <ESC> <Plug>(unite_exit)
  imap <buffer> <ESC> <Plug>(unite_exit)

  " Play nice with supertab
  let b:SuperTabDisabled=1

  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction
" }}}

" EasyMotion {{{
  let g:EasyMotion_leader_key = '<Leader>'
" }}}

" fish {{{
  autocmd FileType fish setlocal foldmethod=expr textwidth=79
" }}}

" vim-endwise {{{
  let g:endwise_no_mappings = 1
" }}}

" source .vim.custom
if filereadable(".vim.custom")
  so .vim.custom
endif

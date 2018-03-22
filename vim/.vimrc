set nocompatible " disable the operation of the vi -compatible


" system settings
set novisualbell " don't visualize bell
set autoread


" command line tab completion
set wildmode=list:longest,full
set wildmenu


" visual settings
set number " show line number
set ruler
set title
set display=uhex
syntax on
set cursorline
hi clear CursorLine
hi CursorLine gui=underline
set scrolloff=7
set backspace=indent,eol,start
set wrap " text wrapping
set showmatch


" encoding settings
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac


" search/replacement settings
set ignorecase " case insensitive if search word is lowercase
set smartcase " case sensitive when search word has uppercase
set incsearch " incremental search
set hlsearch " highlight search word
set wrapscan " go to search top when search hit at bottom
nmap <Esc><Esc> :nohlsearch<CR><Esc> " hit esc twice to cancel highlighting


""" edit settings """
set clipboard+=unnamed
set clipboard=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set expandtab
set cindent

:" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
:map <C-a> <Home>
:map <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap w!! w !sudo tee > /dev/null %<CR> " sudo w

" title stack
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"

" ZenkakuSpace function
function! ZenkakuSpace()
  highlight ZenkakuSpace cterm=underline ctermfg=darkgrey gui=underline guifg=darkgrey
endfunction

if has('syntax')
  augroup ZenkakuSpace
    autocmd!
    autocmd ColorScheme       * call ZenkakuSpace()
    autocmd VimEnter,WinEnter * match ZenkakuSpace /　/
  augroup END
  call ZenkakuSpace()
endif


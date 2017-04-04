set nocompatible " disable the operation of the vi -compatible

""" system settings """
set wildchar=<C-Z> " completion for command line mode
set novisualbell
set autoread


""" visual settings """
set number " show line number
set ruler
set title
set display=uhex
syntax on
set cursorline
hi clear CursorLine
hi CursorLine gui=underline
highlight CursorLine ctermbg=grey guibg=black
set scrolloff=7
set backspace=indent,eol,start
set wrap " text wrapping
set showmatch


""" encoding settings """
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fileformats=unix,dos,mac


""" search/replacement settings """
set ignorecase
set smartcase
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>
set wrapscan " go to search top when search hit at bottom

""" edit settings """
set clipboard+=unnamed
set clipboard=unnamed
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set shiftround
set expandtab
"set autoindent
"set smartindent
set cindent


""" parentheses completion """
inoremap { {}<LEFT><CR><ESC><S-o>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>


""" ZenkakuSpace function """
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


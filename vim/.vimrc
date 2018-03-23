set nocompatible " disable the operation of the vi -compatible

" basic settings
syntax on
set history=10000
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set fileformats=unix,dos,mac
set autoread
set scrolloff=3 " margin rows
set novisualbell " don't visualize bell
set display=uhex,lastline " uhex: show hex, lastline: show all line
set notitle " don't set terminal title
set shortmess+=I " don't show startup message
set number " show line number
set ruler " show cursor position at the bottom bar
set backspace=indent,eol,start " enable backspace to delete
set showmatch " jump to matched parenthesis
set matchtime=1 " 0.1 sec to jump to matched parenthesis
set wrap " wrap text
set wrapscan " go to search top when search hit at bottom
set whichwrap=b,s,h,l,<,>,[,]
set cursorline " show cursor line & highlight line number
hi clear CursorLine " disable cursor line(just highlight line number)
hi LineNr ctermfg=239 " highlight line number


" command line tab completion
set wildmode=list:longest,full
set wildmenu


" search/replacement settings
set ignorecase " case insensitive if search word is lowercase
set smartcase " case sensitive when search word has uppercase
set incsearch " incremental search
set hlsearch " highlight search word
nmap <Esc><Esc> :nohlsearch<CR><Esc> " hit esc twice to cancel highlighting


""" edit settings """
set clipboard& " reset clipboard option
set clipboard=unnamedplus,autoselect " use system clipboard
set expandtab " set tab to space
set tabstop=2 " show tab size to 4 spaces
set softtabstop=2 " set input tab to 4 spaces
set shiftwidth=2 " indent tab size
set shiftround " round indent to multiple of shiftwidth
set showtabline=1 " show tab page
"set cindent " c language indent
set autoindent
set smartindent

:" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
:map <C-a> <Home>
:map <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

cnoremap w!! w !sudo tee > /dev/null %<CR> " sudo w

if exists('&ambiwidth')
  set ambiwidth=double
endif

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


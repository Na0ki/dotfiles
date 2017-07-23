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
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
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
""inoremap { {}<LEFT><CR><ESC><S-o>
""inoremap [ []<LEFT>
""inoremap ( ()<LEFT>
""inoremap < <><LEFT>
""inoremap " ""<LEFT>
""inoremap ' ''<LEFT>

:" Map Ctrl-A -> Start of line, Ctrl-E -> End of line
:map <C-a> <Home>
:map <C-e> <End>
inoremap <C-a> <Home>
inoremap <C-e> <End>

""" sudo w """
cnoremap w!! w !sudo tee > /dev/null %<CR>

""" title stack """
let &t_ti .= "\e[22;0t"
let &t_te .= "\e[23;0t"

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

""" vim-plug """
"call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Group dependencies, vim-snippets depends on ultisnips
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" API Blueprint
"Plug 'kylef/apiblueprint.vim'

" Add plugins to &runtimepath
"call plug#end()


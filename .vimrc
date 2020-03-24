"""""""""""""""""""""
" VIM CONFIGURATION "
"""""""""""""""""""""

""" REQUIRED """
syntax on
set nocompatible
set nowrap
set encoding=utf8

""" PLUGIN MANAGEMENT - VUNDLE """
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" PLUGINS GO BELOW THIS LINE "

" markdown support
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" indent
Plugin 'Yggdroot/indentLine'

" theme
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on

"""""""""""""""""""""
""" CONFIGURATION """
"""""""""""""""""""""

" linenumbers
set number
set ruler

" matching
set showmatch
set ignorecase
set smartcase
set incsearch

" tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set expandtab

" folding
set nofoldenable

" indent
set autoindent

" status
set laststatus=2

" highlights
"set cursorline
"hi CursorLine ctermfg=0 ctermbg=8
hi MatchParen ctermbg=2
set colorcolumn=80
hi ColorColumn ctermbg=8

" theming
"set t_Co=256
let &t_ut=''            " for kitty terminal
"set background=dark
"colorscheme solarized

" backup
set noswapfile
set noundofile

"""""""""""""
""" OTHER """
"""""""""""""

" markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

" show trailing whitepace and spaces before a tab
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

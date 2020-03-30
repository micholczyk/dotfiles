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

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-bufferline'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'

call vundle#end()
filetype plugin indent on

"""""""""""""""""
" CONFIGURATION "
"""""""""""""""""

" sourcing configuration from working dir
set exrc
set secure

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
set noexpandtab
set smarttab

" folding
set nofoldenable

" indent
set autoindent

" status
set laststatus=2

" highlights
hi MatchParen ctermbg=Green
set colorcolumn=80
hi ColorColumn ctermbg=Grey ctermfg=White
hi Visual ctermbg=Grey ctermfg=White
highlight Comment cterm=italic

" theming
"set t_Co=256
let &t_ut=''            " for kitty terminal

" backup
set noswapfile
set noundofile

" show trailing whitepace and spaces before a tab
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/

"""""""""""
" PLUGINS "
"""""""""""

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_c_checkers=['make','gcc']

" indentLine
" apply for tabs instead of spaces
set list lcs=tab:\.\ 

"""""""""""""""
" DEVELOPMENT "
"""""""""""""""

" C
let &path.="src/include,/usr/include/AL,"
set makeprg=make\ -C\ ../build\ -j9
autocmd FileType c nnoremap <F1> :!clear; gcc -o a.out % && ./a.out<cr>
autocmd FileType c nnoremap <F2> :!clear; ./a.out<cr>

" Python
autocmd FileType python nnoremap <F1> :!clear; python %<cr>

" Markdown
augroup markdown
    au!
    au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

""""""""""""
" MAPPINGS "
""""""""""""

" disable ex mode
nnoremap Q <Nop>

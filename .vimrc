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

"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'chmp/mdnav'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'

Plugin 'ycm-core/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'

Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'

call vundle#end()
filetype plugin indent on

"""""""""""""""""
" CONFIGURATION "
"""""""""""""""""
" sourcing configuration from working dir
set exrc
set secure

" clipboard
set clipboard=unnamedplus

" linenumbers
set number
set relativenumber
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

" show trailing whitespace and spaces before a tab
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
" INDENTLINE "
set list lcs=tab:\.\ 

" LIMELIGHT "
let g:limelight_conceal_ctermfg='gray'
let g:limelight_priority=-1

" AIRLINE
let g:airline_theme='sol'
"let g:airline#extensions#tabline#enabled=1

" MARKDOWN
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_new_list_item_indent=0

" MARKDOWN PREVIEW
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

" PANDOC
let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
let g:pandoc#filetypes#pandoc_markdown = 0
"let g:pandoc#command#autoexec_command = "Pandoc! pdf"
let g:pandoc#formatting#mode = 'h'

"""""""""""""""
" DEVELOPMENT "
"""""""""""""""
" C
let &path.="src/include,/usr/include/AL,"
set makeprg='make\ -C\ ../build\ -j9'
autocmd FileType c nnoremap <F1> :!clear; gcc -o a.out % && ./a.out<CR>
autocmd FileType c nnoremap <F2> :!clear; ./a.out<CR>

" Python
autocmd FileType python nnoremap <F1> :!clear; python %<CR>

""""""""""""
" MAPPINGS "
""""""""""""
" disable ex mode
nnoremap Q <Nop>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-q> <C-w>q

""""""""""""""""
" NOTES SYSTEM "
""""""""""""""""
nnoremap <C-n>i :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>

let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
if executable('rg')
	set grepprg=rg\ --color=never\ --vimgrep
	let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
	let g:ctrlp_user_caching=0
endif

command! -nargs=1 Ngrep grep! "<args>" -ilg "*.md" $NOTES_DIR
nnoremap <C-n>n :Ngrep 

command! -nargs=1 NgrepAll grep! "<args>" -ig "*.md" $NOTES_DIR
nnoremap <C-n>t :NgrepAll 

command! Vlist botright vertical copen | vertical resize 60
nnoremap <C-n>v :Vlist<CR>

" This is not really needed anymore as pandoc does the hardwrapping instead.
augroup Markdown
	autocmd!
	autocmd FileType markdown set tw=79
augroup END

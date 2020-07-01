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
Plugin 'JamshedVesuna/vim-markdown-preview'
Plugin 'chmp/mdnav'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'dkarter/bullets.vim'

Plugin 'mattn/emmet-vim'

Plugin 'ycm-core/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-surround'
Plugin 'terryma/vim-multiple-cursors'

"Plugin 'bling/vim-bufferline'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'danilamihailov/beacon.nvim'
Plugin 'takac/vim-hardtime'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'

call vundle#end()
filetype plugin indent on

"""""""""""""""""
" CONFIGURATION "
"""""""""""""""""
" sourcing configuration from working dir
set exrc
set secure

" enable mouse
set mouse=a

" clipboard
set clipboard^=unnamed,unnamedplus

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

" AIRLINE
let g:airline_theme='sol'
let g:airline#extensions#tabline#enabled=1

" MARKDOWN
let g:vim_markdown_auto_insert_bullets=0
let g:vim_markdown_new_list_item_indent=0

" MARKDOWN PREVIEW
let vim_markdown_preview_hotkey='<C-m>'
let vim_markdown_preview_browser='Firefox'
let vim_markdown_preview_github=1
let vim_markdown_preview_use_xdg_open=1

" PANDOC
"let g:pandoc#filetypes#handled = ["pandoc", "markdown"]
"let g:pandoc#filetypes#pandoc_markdown = 0
"let g:pandoc#command#autoexec_command = "Pandoc! pdf"
let g:pandoc#formatting#mode = 'h'

" SESSIONS
let g:session_autosave=0

" BEACON
highlight Beacon ctermbg=6

" HARDTIME
let g:hardtime_default_on=1

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
" Disable ex mode.
nnoremap Q <Nop>

" Move around windows using Ctrl+<hjkl>. Kill window using Ctrl+q.
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-q> <C-w>q

""""""""""""""""
" NOTES SYSTEM "
""""""""""""""""
" Setup the fuzzy finder to use ripgrep.
let g:ctrlp_map='<C-p>'
let g:ctrlp_cmd='CtrlP'
if executable('rg')
	set grepprg=rg\ --color=never\ --vimgrep
	let g:ctrlp_user_command='rg %s --files --color=never --glob ""'
	let g:ctrlp_user_caching=0
endif

" Go to the index note.
nnoremap <C-n>i :e $NOTES_DIR/index.md<CR>:cd $NOTES_DIR<CR>
" Create a new timestamped note in the notes directory.
command! -nargs=1 NewZettel :execute ":e" $NOTES_DIR . strftime("%d%m%Y%H%M") . "-<args>.md"
nnoremap <C-n>a :NewZettel 
" Search for a keyword in the notes directory.
command! -nargs=1 Ngrep grep! "<args>" -ilg "*.md" $NOTES_DIR
nnoremap <C-n>n :Ngrep 
command! -nargs=1 NgrepAll grep! "<args>" -ig "*.md" $NOTES_DIR
nnoremap <C-n>t :NgrepAll 
" Show a list of the previous command's results.
command! Vlist botright vertical copen | vertical resize 60
nnoremap <C-n>v :Vlist<CR>

augroup Pandoc
	autocmd!
	autocmd FileType pandoc set tw=79
augroup END

" Enable spellchecking.
set spelllang=en_us,pl
" Enable linking filenames with specific lines after colon.
set isfname-=:

" CtrlP function for inserting a markdown link with Ctrl-X.
function! CtrlPOpenFunc(action, line)
	if a:action =~ '^h$'
		" Get the filename
		let filename = fnameescape(fnamemodify(a:line, ':t'))
		let filename_wo_timestamp = fnameescape(fnamemodify(a:line, ':t:s/\d+-//'))

		" Close CtrlP
		call ctrlp#exit()
		call ctrlp#mrufiles#add(filename)

		" Insert the markdown link to the file in the current buffer
		let mdlink = "[".filename_wo_timestamp."](".filename.")"
		put=mdlink
	else
		" Use CtrlP's default file opening function
		call call('ctrlp#acceptfile', [a:action, a:line])
	endif
endfunction

let g:ctrlp_open_func = {
			\ 'files': 'CtrlPOpenFunc',
			\ 'mru files': 'CtrlPOpenFunc'
			\ }

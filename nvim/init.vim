set shell=/bin/bash
set clipboard+=unnamedplus


" bindings
map ; :
let mapleader = ";;"
map <Space> <Leader>
" make executable
" nmap <silent> <leader>x :!chmod +x %<CR> 
" autoindent
map <tab> =

" indent
" set noautoindent
set tabstop=4
set shiftwidth=4

" Notify on file save
" autocmd BufWritePost * silent ! notify-send '% saved'

" auto-chmod files with a shebang
autocmd BufWritePost * if getline(1) =~ '^#!' && !executable(expand('%:p')) | silent execute '!chmod +x -- '.shellescape(@%) | endif

" Enable true color for neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 0

" enable mouse wheel (iterm2)
:set mouse=a 

" Change window title to filename
set title
set titlestring=%t

" Turn on linenumbers
set number relativenumber

" Hide ruler
set noruler

" Don't redraw screen as often
set lazyredraw

" draw tab line
" set list lcs=tab:\▏\ 

" allow cursor to go to end of line
set ve+=onemore

" Enable cursor line position tracking:
set nocursorcolumn
"set nocursorline
set cursorline
" Remove the underline from enabling cursorline:
" highlight clear CursorLine

" Don’t show the intro message when starting Vim
set shortmess=atI

" Hide mode indicator
set noshowmode

" Always show statusline
set laststatus=0

" Highlight search matches
set hlsearch

" Show search results as you type
set incsearch

" Ignore case in searches if query doesn't include capitals
set ignorecase
set smartcase

" backspace over anything but EOL
set backspace=indent,start

" No swapfiles
set noswapfile

" Specify a directory for plugins
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" do ":PlugInstall" to install plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'zirrostig/vim-repaste'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'danro/rename.vim'
Plug 'preservim/nerdtree'
call plug#end()

" nerdcommenter
filetype plugin on
map c <Leader>c<space>
let NERDSpaceDelims = 1
let NERDDefaultAlign = 'left'
let NERDCommentEmptyLines = 1
let NERDToggleCheckAllLines = 1

" vim-repaste
let g:RePaste_DeleteRegister = "r"
map r <Leader>r

" Goyo + Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
nmap <silent> ;g :Goyo<CR>
nmap <silent> ;G :Goyo!<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> ;p :Prettier <CR>

" nerdtree
nmap <silent> ;o :NERDTreeToggle <CR>A
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeShowHidden = 1
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeHighlightCursorline = 0
let g:NERDTreeMouseMode = 2
autocmd FileType nerdtree nmap <buffer> <right> o
autocmd FileType nerdtree nmap <buffer> <left> o

colorscheme wal

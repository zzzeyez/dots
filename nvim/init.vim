set shell=/bin/bash
set clipboard+=unnamedplus

" bindings
let mapleader = ";"
map <Space> <Leader>
" make executable
nmap <silent> <leader>x :!chmod +x %<CR> 
" repaste plugin
map r <Leader>r
" nerdcommenter plugin
map c <Leader>c<space>
" autoindent
map <tab> =

" indent
" set noautoindent
set tabstop=4
set shiftwidth=4

" Notify on file save
autocmd BufWritePost * silent ! notify-send '% saved'

" Enable true color for neovim
let $NVIM_TUI_ENABLE_TRUE_COLOR = 0

" enable mouse wheel (iterm2)
:set mouse=a 

" Change window title to filename
set title
set titlestring=%t

" Turn on linenumbers
set number

" Hide ruler
set noruler

" Don't redraw screen as often
set lazyredraw

" tab line
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
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'easymotion/vim-easymotion'
Plug 'danro/rename.vim'
call plug#end()

" nerdcommenter
filetype plugin on

" vim-repaste
let g:RePaste_DeleteRegister = "r"

" Goyo + Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
cabbrev goyo Goyo 40%x60%
cabbrev goyo! Goyo!
nmap <silent> <leader>g :Goyo 40%x60%<CR>
nmap <silent> <leader>G :Goyo!<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
cabbrev prettier Prettier
nmap <silent> <leader>p :Prettier<CR>

" vim-easymotion (f for line, F for word)
map  <Leader>F <Plug>(easymotion-bd-w)
nmap <Leader>F <Plug>(easymotion-overwin-w)
map <Leader>f <Plug>(easymotion-bd-jk)
nmap <Leader>f <Plug>(easymotion-overwin-line)

colorscheme wal

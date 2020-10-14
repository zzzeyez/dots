set shell=/bin/bash
set clipboard+=unnamedplus


" bindings
map ; :
let mapleader = ";;"
map <Space> <Leader>
" make executable
" nmap <silent> <leader>x :!chmod +x %<CR> 
" autoindent;o
map <tab> =
nnoremap U <C-R>

" close all buffers on ;q
nmap :q :qa

" indent
" set noautoindent
set tabstop=4
set shiftwidth=4

" Notify on file save
" autocmd BufWritePost * silent ! notify-send '% saved'

" auto-chmod files with a shebang
autocmd BufWritePost * if getline(1) =~ '^#!' && !executable(expand('%:p')) | silent execute '!chmod +x -- '.shellescape(@%) | endif

" Enable true color for neovim
" let $NVIM_TUI_ENABLE_TRUE_COLOR = 0
" set termguicolors

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
" set lazyredraw

" draw tab line
set list lcs=tab:\┊\ 

" draw vertical splitt
set fillchars+=vert:\ 

" allow cursor to go to end of line
set ve+=onemore

" Enable cursor line position tracking:
set nocursorcolumn
" set nocursorline
set cursorline

" Don’t show the intro message when starting Vim
set shortmess=atI

" Hide mode indicator
set noshowmode

" hide statusline
set laststatus=0

" Highlight search matches
set hlsearch

" show search results as you type
set incsearch

" ignore case in searches if query doesn't include capitals
set ignorecase
set smartcase

" backspace over anything but EOL
set backspace=indent,start

" no swapfiles
set noswapfile

" do ":PlugInstall" to install plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'zirrostig/vim-repaste'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'wfxr/minimap.vim'
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

" minimap
let g:minimap_auto_start=1
let g:minimap_width=13
let g:minimap = 'NonText'
" hi MinimapCurrentLine ctermfg=0 guifg=0 guibg=0
" let g:minimap_highlight = 'MinimapCurrentLine'

" nerdtree
nmap <silent> ;o :wincmd h<CR>
" auto open and focus on file
autocmd VimEnter * NERDTree
" Go to previous (last accessed) window.
autocmd VimEnter * wincmd p
let NERDTreeMinimalUI = 1
let NERDTreeQuitOnOpen = 0
let NERDTreeShowHidden = 1
let NERDTreeWinSize=13
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
" let NERDTreeHighlightCursorline = 1
let g:NERDTreeMouseMode = 2
autocmd FileType nerdtree nmap <buffer> <right> o
autocmd FileType nerdtree nmap <buffer> <left> o

" colors
colorscheme wal
" disable highlight current line
" highlight clear CursorLine
" hide splits
hi VertSplit cterm=NONE
" hide empty line tilde
hi! EndOfBuffer ctermbg=0 ctermfg=0 guibg=0 guifg=0
" minimap
hi MinimapCurrentLine ctermfg=0 guifg=2 guibg=2
" nerdtree
" hi Directory ctermbg=8
hi NERDTreeDirSlash ctermbg=NONE ctermfg=4
hi NERDTreeExecFile ctermbg=NONE ctermfg=7

" italics
hi Comment cterm=italic
hi String cterm=italic
hi Statement cterm=italic

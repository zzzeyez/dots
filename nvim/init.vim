set shell=/bin/bash
set clipboard+=unnamedplus
" set noautoindent
set tabstop=4
set shiftwidth=4
" let $NVIM_TUI_ENABLE_TRUE_COLOR = 0
" set termguicolors
set mouse=a "enables mousewheel (iterm2)
set title "set title to filename
set titlestring=%t
set number relativenumber
set noruler
set lazyredraw
set list lcs=tab:\┊\  "draw tabline
set fillchars+=vert:\  "draw verticle split
set ve+=onemore "allow cursor to go to end of line
set nocursorcolumn "cursor tracking
" set nocursorline "cursor tracking
set cursorline "cursor tracking
set shortmess=atI "no intro message
set noshowmode "hide mode indicator
set laststatus=0 "hide status bar
set hlsearch
set incsearch
set ignorecase
set smartcase
set backspace=indent,start "no backspace past end of line
set noswapfile
set autochdir

" python providers
let g:python_host_prog = '/usr/local/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3.8'

" bindings
map ; :
let mapleader = ";;"
map <Space> <Leader>
" make executable
" nmap <silent> <leader>x :!chmod +x %<CR> 
" autoindent;o
map <tab> =
nnoremap U <C-R>
" nmap :q :qa
" autocmd BufWritePost * silent ! notify-send '% saved'

" plugins
call plug#begin('~/.config/nvim/bundle')
Plug 'zirrostig/vim-repaste'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" Plug 'nvim-treesitter/completon-treesitter'
Plug 'wfxr/minimap.vim'
Plug 'danro/rename.vim'
Plug 'preservim/nerdtree'
Plug 'mhinz/vim-startify'
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
nmap <silent> ;g :Limelight<CR>
nmap <silent> ;G :Limelight!<CR>

" coc.nvim
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <silent> ;p :Prettier <CR>

" nvim-lspconfig
lua <<EOF
require'nvim_lsp'.html.setup{}
require'nvim_lsp'.tsserver.setup{}
require'nvim_lsp'.cssls.setup{}
require'nvim_lsp'.bashls.setup{}
EOF

" tree-sitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
" highlighting
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
  },
}
EOF

" completion-nvim
lua require'nvim_lsp'.html.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.tsserver.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.cssls.setup{on_attach=require'completion'.on_attach}
lua require'nvim_lsp'.bashls.setup{on_attach=require'completion'.on_attach}
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect
" Avoid showing message extra message when using completion
" set shortmess+=c
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" diagnostic-nvim
lua require'nvim_lsp'.html.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.tsserver.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.cssls.setup{on_attach=require'diagnostic'.on_attach}
lua require'nvim_lsp'.bashls.setup{on_attach=require'diagnostic'.on_attach}
let g:diagnostic_enable_virtual_text = 1

" minimap
let g:minimap_auto_start=1
let g:minimap_width=6
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
let NERDTreeShowHidden = 0
let NERDTreeWinSize = 10
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | quit | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let NERDTreeHighlightCursorline = 1
let g:NERDTreeMouseMode = 2
let NERDTreeChDirMode=2
autocmd FileType nerdtree nmap <buffer> <right> C
autocmd FileType nerdtree nmap <buffer> <left> u
autocmd FileType nerdtree nmap <buffer> <return> o
autocmd FileType nerdtree nmap <buffer> . I
autocmd FileType nerdtree nmap <buffer> r R

" startify
let g:startify_custom_header = [
	\ '  _  _    _   __       *   _  _  _   ',
	\ ' / |/ |  |/  /  \_|  |_|  / |/ |/ |  ',
	\ '   |  |_/|__/\__/  \/  |_/  |  |  |_/',
	\ ' - - - - - - - - - - - - - - - - - - ',
	\ ]
let g:startify_files_number = 5
let g:startify_bookmarks = [
	\ '~/.config/nvim/init.vim',
	\ '~/.tmux.conf',
	\ '~/.zshrc',
	\ '~/scripts/pecan/scss/style.scss'
	\ ]
let g:startify_commands = [
	\ ['check health', 'checkhealth'],
	\ ['install html ls', 'LspInstall html'],
	\ ['install cssls ls', 'LspInstall cssls'],
	\ ['install tsserver ls', 'LspInstall tsserver'],
	\ ['install bashls ls', 'LspInstall bashls'],
	\ ['plug install', 'PlugInstall']
	\ ]
let g:startify_lists = [
	\ { 'type': 'files',     'header': ['   recents']            },
	\ { 'type': 'bookmarks', 'header': ['   bookmarks']      },
	\ { 'type': 'commands',  'header': ['	commands']       }
	\ ]

" colors
colorscheme wal
" hide splits
hi VertSplit cterm=NONE
" hide empty line tilde
hi! EndOfBuffer ctermbg=0 ctermfg=0 guibg=0 guifg=0
" minimap
hi MinimapCurrentLine ctermfg=1 ctermbg=NONE
let g:minimap_highlight = 'MinimapCurrentLine'
" nerdtree
hi NERDTreeDirSlash ctermbg=NONE ctermfg=8
hi NERDTreeExecFile ctermbg=NONE ctermfg=8
hi NERDTreeOpenable ctermbg=NONE ctermfg=8
hi NERDTreeClosable ctermbg=NONE ctermfg=8
hi NERDTreeDir ctermbg=NONE ctermfg=8
hi NERDTreeFile ctermbg=NONE ctermfg=8
hi NERDTreeLinkFile ctermbg=NONE ctermfg=8
hi NERDTreeLinkDir ctermbg=NONE ctermfg=8
hi NERDTreeLinkTarget ctermbg=NONE ctermfg=8
hi NERDTreeCurrentNode ctermbg=NONE ctermfg=7
hi NERDTreeCWD ctermbg=NONE ctermfg=6
" dim bg windows
" hi ActiveWindow ctermfg=7 
hi InactiveWindow ctermfg=8 ctermbg=NONE
set winhighlight=NormalNC:InactiveWindow
" italics
hi Directory cterm=italic
hi Comment cterm=italic
hi String cterm=italic
hi Statement cterm=italic

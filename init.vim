call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'preservim/tagbar'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'vim-airline/vim-airline'
Plug 'frazrepo/vim-rainbow'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'kdheepak/lazygit.nvim'
Plug 'shaunsingh/solarized.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

colorscheme solarized

" ==============enable treesitter"
lua require('config/treesitter')

" ==============NEARTree
nmap nt :NERDTreeToggle<CR>

" ==============rainbow bracket
let g:rainbow_active=1

" ==============lazygit
let g:lazygit_floating_window_winblend = 0 " transparency of floating window
let g:lazygit_floating_window_scaling_factor = 0.9 " scaling factor for floating window
let g:lazygit_floating_window_border_chars = ['╭','─', '╮', '│', '╯','─', '╰', '│'] " customize lazygit popup window border characters
let g:lazygit_floating_window_use_plenary = 0 " use plenary.nvim to manage floating window if available
let g:lazygit_use_neovim_remote = 1 " fallback to 0 if neovim-remote is not installed
let g:lazygit_use_custom_config_file_path = 0 " config file path is evaluated if this value is 1
let g:lazygit_config_file_path = [] " list of custom config file paths
nmap gl :LazyGit<CR>

" ==============viminspector(debug inspect)
" base dir
let g:vimspector_base_dir = '/Users/han/.vim/plugged/vimspector'
" Human Mode
" F5	<Plug>VimspectorContinue	When debugging, continue. Otherwise start debugging.
" F3	<Plug>VimspectorStop	Stop debugging.
" F4	<Plug>VimspectorRestart	Restart debugging with the same configuration.
" F6	<Plug>VimspectorPause	Pause debuggee.
" F9	<Plug>VimspectorToggleBreakpoint	Toggle line breakpoint on the current line.
" <leader>F9	<Plug>VimspectorToggleConditionalBreakpoint	Toggle conditional line breakpoint on the current line.
" F8	<Plug>VimspectorAddFunctionBreakpoint	Add a function breakpoint for the expression under cursor
" <leader>F8	<Plug>VimspectorRunToCursor	Run to Cursor
" F10	<Plug>VimspectorStepOver	Step Over
" F11	<Plug>VimspectorStepInto	Step Into
" F12	<Plug>VimspectorStepOut	Step out of current function scope
let g:vimspector_enable_mappings = 'HUMAN'

" for normal mode - the word under the cursor
nmap <leader>di <Plug>VimspectorBalloonEval

" for visual mode, the visually selected text
xmap <leader>di <Plug>VimspectorBalloonEval

" close vimspector
nmap <F7> :call vimspector#Reset()<CR>

" breake point
nmap <leader>b :call vimspector#ToggleBreakpoint()<CR>
nmap <leader>B :call vimspector#ClearBreakpoints()<CR>

" ==============CoC
" CoC for python
" :CocInstall coc-pyright
" use <tab> to trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
" remap <cr> to make it confirm completion
inoremap <expr> <cr> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" ==============MarkdownPreview
nmap mp <Plug>MarkdownPreviewToggle

" ==============vim config
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=4               " number of columns occupied by a tab 
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
filetype plugin on
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set relativenumber
" set mouse=v                 " middle-click paste with 
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim " Directory to store backup files.


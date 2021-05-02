call plug#begin()
Plug 'nvim-telescope/telescope.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'cohama/lexima.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'scrooloose/nerdtree-project-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

colorscheme gruvbox
highlight Normal guibg=none
set background=dark
syntax on
set backspace=indent,eol,start

set encoding=UTF-8
set exrc
set guicursor=
set nu
set nohlsearch
set hidden
set noerrorbells
set number
set relativenumber
set mouse=a
set inccommand=split
set clipboard=unnamedplus
set autoindent
set smartindent
set expandtab
set shiftwidth=2
set tabstop=2 softtabstop=2
set noswapfile
set nobackup
set incsearch
set scrolloff=8
set signcolumn=yes
set ma
let mapleader="\<space>"
let g:NERDTreeGitStatusUseNerdFonts = 1

nnoremap <silent> <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>sv :source ~/.config/nvim/init.vim<cr>

nnoremap <silent> <leader>= <insert>`<esc>$<insert><right>`<esc>
vnoremap <silent> <leader>+ "*x<insert>```<cr><esc>gp$<insert><right><cr><esc>0<insert>```<cr><esc>

nnoremap <silent> <c-O> <insert><cr><esc>

nnoremap <silent> <leader>q :bnext<cr> 

nnoremap <silent> <leader>y "*y<cr>
nnoremap <silent> <leader>Y "+yy<cr>
nnoremap <silent> <leader>x "*x<cr>
nnoremap <silent> <leader>X "+x<cr>
nnoremap <silent> <leader>p "*p<cr>
nnoremap <silent> <leader>P "+p<cr>

nnoremap <silent> <leader>n :NERDTreeFocus<cr>

nnoremap <silent> <c-p> :Files<cr>
nnoremap <silent> <c-f> :Ag<space>

nnoremap <silent> <c-n> :NERDTree<cr>
nnoremap <silent> <c-t> :NERDTreeToggle<cr>
nnoremap <silent> <c-f> :NERDTreeFind<cr>

autocmd VimEnter * NERDTree | wincmd p

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeShowHidden = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1


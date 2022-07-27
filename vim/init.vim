call plug#begin()
" Search
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Color Scheme
Plug 'gruvbox-community/gruvbox'
" Multi cursor
Plug 'terryma/vim-multiple-cursors'
" Multi language packs
Plug 'sheerun/vim-polyglot'
" Auto close parentheses and repeat by dot dot dot...
Plug 'cohama/lexima.vim'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Js
Plug 'pangloss/vim-javascript'    " JavaScript support
"" Ts
Plug 'HerringtonDarkholme/yats.vim'
Plug 'leafgarland/typescript-vim'
"" Jsx
Plug 'maxmellon/vim-jsx-pretty'
Plug 'chemzqm/vim-jsx-improve'
"" GraphQL
Plug 'jparise/vim-graphql'        " GraphQL syntax
" GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Completition/Emmet
Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
Plug 'mattn/emmet-vim'
" HTML Tags
Plug 'gregsexton/MatchTag'
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
" NERDTree
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'
Plug 'ryanoasis/vim-devicons'
Plug 'mhinz/vim-startify'
" Identention Highlight
" Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'
" Don't know what it's for
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive', { 'tag': '*' }
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
" Prettier
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
call plug#end()

" Colors
colorscheme gruvbox
highlight Normal guibg=none
autocmd VimEnter * hi Normal ctermbg=none

" Folding
set foldmethod=indent
set nofoldenable
nnoremap <silent> <leader>z za<cr>

" Startify
autocmd VimEnter * Startify

syntax on
set background=dark
set backspace=indent,eol,start
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
set nocompatible
" NeoVim 
let mapleader="\<space>"
nnoremap <silent> <leader>ev :vsplit ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>sv :source ~/.config/nvim/init.vim<cr>
inoremap <silent> <c-s> <ESC>:w<insert><cr>
nnoremap <silent> <c-s> :w<cr>
" Custom Inserts
nnoremap <silent> <leader>= <insert>`<esc>$<insert><right>`<esc>
nnoremap <silent> <leader>" <insert>"<esc>$<insert><right>"<esc>
vnoremap <silent> <leader>+ "*x<insert>```<cr><esc>gp$<insert><right><cr><esc>0<insert>```<cr><esc>
nnoremap <silent> <c-O> <insert><cr><esc>
" ?
nnoremap <silent> <c-f>:Ag<space>
" Buffer Things
nnoremap <silent> <leader>q :bp<cr>
" Copy/Paste Custom Tings
nnoremap <silent> <leader>y "*y<cr>
nnoremap <silent> <leader>Y "+yy<cr>
nnoremap <silent> <leader>x "*x<cr>
nnoremap <silent> <leader>X "+x<cr>
nnoremap <silent> <leader>p "*p<cr>
nnoremap <silent> <leader>P "+p<cr>
" NERDTree
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeDirArrowExpandable    = ''
let g:NERDTreeDirArrowCollapsible   = ''
let g:NERDTreeShowHidden            = 1
nnoremap <silent> <leader>n :NERDTreeFocus<cr>
nnoremap <silent> <c-n> :NERDTree<cr>
nnoremap <silent> <c-t> :NERDTreeToggle<cr>
nnoremap <silent> <c-f> :NERDTreeFind<cr>
autocmd VimEnter * NERDTree | wincmd p
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
" AirLine
let g:airline#extensions#tabline#enabled        = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
" Emmet
let g:user_emmet_leader_key = ','
" Search
"" Fzf
nnoremap <silent> <c-p> :Files<cr>
"" Telescope
""" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Multi line cursor
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'
" Snippets
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<c-b>"
let g:UltiSnipsJumpBackwardTrigger = "<c-z>"
" Identention
let g:indentLine_char = '┊'
" MarkdownPreview
nnoremap <leader>m <Plug>MarkdownPreview
" COC.nvim default settings
"" Better display for messages
set cmdheight=1
"" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
"" don't give |ins-completion-menu| messages.
set shortmess+=c
"" Use tab for trigger completion with characters ahead and navigate.
"" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
"" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
"" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>
"" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
"" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" Prettier config
let g:prettier#config#tab_width = 2

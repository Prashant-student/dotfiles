let mapleader = " "

set termguicolors
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set number
set numberwidth=1
set relativenumber
set signcolumn=yes
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set nohlsearch
set ignorecase
set smartcase
set nowrap
set splitbelow
set splitright
set hidden
set noshowmode
set updatetime=250 
set encoding=UTF-8
set mouse=a

" --- Plugins

call plug#begin('~/.config/nvim/plugged')

" General
Plug 'kyazdani42/nvim-web-devicons'                " Devicons
Plug 'nvim-lualine/lualine.nvim'                   " Status line
Plug 'akinsho/bufferline.nvim'                     " Buffers
Plug 'machakann/vim-highlightedyank'               " Highlight yanked text
Plug 'kyazdani42/nvim-tree.lua'                    " File explorer
Plug 'folke/tokyonight.nvim', { 'branch': 'main' } " Color scheme
" Lsp
Plug 'neovim/nvim-lspconfig'     
Plug 'jose-elias-alvarez/null-ls.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'onsails/lspkind-nvim'
" Git
Plug 'tpope/vim-fugitive'
Plug 'lewis6991/gitsigns.nvim'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-file-browser.nvim'
" Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" copilot
Plug 'github/copilot.vim',
Plug 'ur4ltz/surround.nvim',

Plug 'ygm2/rooter.nvim',
" random
Plug 'folke/trouble.nvim'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'j-hui/fidget.nvim'
Plug 'kosayoda/nvim-lightbulb'
Plug 'm-demare/hlargs.nvim'
Plug 'simrat39/rust-tools.nvim'
Plug 'weilbith/nvim-code-action-menu'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-cmdline' 

call plug#end()
lua require('Prashant')


" --- Colors

set background=dark
colorscheme tokyonight


" --- Remaps

nnoremap <leader>h :wincmd h<Cr>
nnoremap <leader>j :wincmd j<Cr>
nnoremap <leader>k :wincmd k<Cr>
nnoremap <leader>l :wincmd l<Cr>
nnoremap <silent><leader>[ :BufferLineCyclePrev<Cr>
nnoremap <silent><leader>] :BufferLineCycleNext<Cr>
nnoremap <silent><leader>q :bdelete<Cr>


" --- Autocommands

" Remove vert split 
" https://www.reddit.com/r/vim/comments/effwku/transparent_vertical_bar_in_vim/
" https://gist.github.com/romainl/379904f91fa40533175dfaec4c833f2f
set fillchars=vert:\  " there is whitespace after the backslash
augroup RemoveVertSplit
    autocmd!
    autocmd BufEnter,ColorScheme * highlight VertSplit ctermfg=1 ctermbg=None cterm=None
augroup END


" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-y>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"nmap <silent>,y <>"+y

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

let g:go_def_mapping_enabled = 0

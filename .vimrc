" vim:fdm=marker

if has('python3')
  silent! python3 1
endif

"Global settings {{{
set incsearch
set hlsearch
set hidden
"}}}
" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-bufferline'
Plug 'fatih/vim-go'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'airblade/vim-gitgutter'
call plug#end()
"}}}
" Filetype {{{
syntax on
filetype on
filetype plugin on
filetype indent on
"}}}
" Colorscheme and Font {{{
colorscheme solarized 
set background=dark
set guifont=Meslo\ LG\ S\ for\ Powerline
"}}}
" Folding {{{
set foldmethod=indent
set foldlevel=99
"}}}
" Encoding support {{{
set encoding=utf-8
"}}}
" GUI settings {{{
" remove scrollbars
set guioptions=
set number
set ai
set bs=2
set ruler
set cursorline
" }}}
" Tab settings {{{
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
"}}}
" FZF settings {{{
set rtp+=/usr/local/opt/fzf
"}}}
" NerdTree settings {{{
map <leader>r :NERDTreeFind<cr>
" }}}
" CtrlP settings {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" prevent cache saving, so that any folder structures are reflected immediately
let g:ctrlp_use_caching = 0
"}}}
" Statusline settings {{{
set laststatus=2
let g:airline_theme='badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
"}}}
" Airline settings {{{
let g:bufferline_echo = 0
"}}}
" Indent guides settings {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
"}}}
" Syntax highlight {{{
syntax on
let g:python_highlight_all = 1
let g:python_space_error_highlight = 1
"}}}
" Key assignments {{{ 
let mapleader=";"
" Navigating buffers
map <Tab> :bnext<CR>
map <S-Tab> :bprevious<CR>
" Folding
map <Space> za
" Shortcuts 
map <C-n> :NERDTreeToggle<CR>
map <C-l> :TagbarToggle<CR>
map <C-m> gc
"}}}
" Python file {{{
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
"}}}
" Full stack file {{{
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
"}}}
" Latex Settings {{{

let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"}}} 
" Golang Settings {{{ 

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
let g:go_def_mapping_enabled = 0
" }}}
" vim:foldmethod=marker:foldlevel=0:textwidth=79

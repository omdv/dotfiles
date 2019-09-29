" vim:fdm=marker

if has('python3')
  silent! python3 1
endif

" Plugins {{{
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tomtom/tcomment_vim'
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-surround'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
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
" CtrlP settings {{{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
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
" Change leader
let mapleader = ","
" Navigating tabs
nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>
" Navigation between windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Folding
nnoremap <Space> za
" Shortcuts 
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>
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
" YouCompleteMe {{{
let g:ycm_register_as_syntastic_checker = 1 "default 1
let g:ycm_show_diagnostics_ui = 1 "default 1

"will put icons in Vim's gutter on lines that have a diagnostic set.
"Turning this off will also turn off the YcmErrorLine and YcmWarningLine
"highlighting
let g:ycm_enable_diagnostic_signs = 1
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_always_populate_location_list = 1 "default 0
let g:ycm_open_loclist_on_ycm_diags = 1 "default 1

let g:ycm_complete_in_strings = 1 "default 1
let g:ycm_collect_identifiers_from_tags_files = 0 "default 0
let g:ycm_path_to_python_interpreter = '' "default ''

let g:ycm_server_use_vim_stdout = 0 "default 0 (logging to console)
let g:ycm_server_log_level = 'info' "default info

let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'  "where to search for .ycm_extra_conf.py if not found
let g:ycm_confirm_extra_conf = 1

let g:ycm_goto_buffer_command = 'same-buffer' "[ 'same-buffer', 'horizontal-split', 'vertical-split', 'new-tab' ]
let g:ycm_filetype_whitelist = { '*': 1 }
let g:ycm_key_invoke_completion = '<C-Space>'

nnoremap <F11> :YcmForceCompileAndDiagnostics <CR>
"}}}
" Latex Settings {{{

let g:livepreview_previewer = 'open -a Preview'
let g:vimtex_compiler_latexmk = {'callback' : 0}

"}}}
" vim:foldmethod=marker:foldlevel=0:textwidth=79

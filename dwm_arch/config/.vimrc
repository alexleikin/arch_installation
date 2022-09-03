let mapleader=' ' 
syntax on
set belloff=all
set nocompatible
set backspace=indent,eol,start
set history=50
set ruler
set background=dark
set showcmd
set incsearch
set hlsearch
set smartcase
set ignorecase
set mouse=a
filetype indent on
syntax enable
set encoding=UTF-8
set laststatus=2

call plug#begin("~/.vim/plugged")

Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'

call plug#end()


" Setup the colorscheme
" colorscheme ayu
" colorscheme ayu

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
colorscheme nord


" Call NERDTree 
nmap <F6> :NERDTreeToggle<CR>

" Open the new file and a new Tab
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" Map moving between tabs
nnoremap <C-l> gt
nnoremap <C-h> gT

" Set some setting for python and yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 nu expandtab
" autocmd FileType python setlocal rnu

" Draw the indentLine only for Yaml files
let g:indentLine_color_term = 255
let g:indentLine_fileTypeExclude = ['help', 'man', 'text', 'txt', '']
autocmd Filetype yaml,python let g:indentLine_char = '⦙'

" Setting for ALE
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" Execute Python script
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" Toggle Paste/NoPaste
set pastetoggle=<F3>

" Map split Horiz and Vert
nnoremap <leader>h :split<Space><CR>
nnoremap <leader>v :vsplit<Space><CR>

" Toggle Auto Pairing
nnoremap <leader>P :let b:autopairs_enabled=1<CR>
nnoremap <leader>p :let b:autopairs_enabled=0<CR>

" Toggle Insert/Remote Comments in Visual Mode
vnoremap <leader>c :s/^/# /<CR>:nohlsearch<CR>
vnoremap <leader>C :s/^#.//<CR>:nohlsearch<CR>

autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* loadview
nmap <F2> :ColorToggle<CR>
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

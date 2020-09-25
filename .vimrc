"""
" Vundle Configuration """
set nocompatible               " be iMproved
filetype off                   " required for vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" Bundles here:
Bundle 'scrooloose/syntastic'
Bundle 'pangloss/vim-javascript'
Bundle 'vim-scripts/python.vim'
Bundle 'vim-scripts/django.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Lokaltog/powerline'
Bundle 'sjl/gundo.vim'
" autocomplete
Bundle 'davidhalter/jedi-vim'
" fuzzy search
Bundle 'wincent/Command-T'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-fugitive'
Plugin 'python/black'
" plantuml stuff directly on vim
Plugin 'scrooloose/vim-slumlord'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'thosakwe/vim-flutter'
Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tpope/vim-repeat'
Plugin 'raimon49/requirements.txt.vim'
Plugin 'cespare/vim-toml'

" color scheme
Plugin 'sickill/vim-monokai'

"
" ...

filetype plugin indent on     " required for vundle
"""
" End of Vundle Configuration
"""

" searching
set hlsearch

" default encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" indenting
set autoindent

" allow backspace over everything
set backspace=indent,eol,start

" color scheme, menus, etc.
set background=dark
set number
set ruler

" remap for Gundo
noremap <C-G>     :GundoToggle<cr>

" always save undo
set undofile

" powerline config
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2
" powerline & gnome terminal
set t_Co=256
let g:Powerline_symbols="fancy"

" allow syntax
syntax on
syntax enable
colorscheme monokai

" jedi vim configs
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
" don't popup docstring window:
autocmd FileType python setlocal completeopt-=preview

" command-t
let g:CommandTFileScanner = "find"  " use find over ruby alternative
let g:CommandTWildIgnore=&wildignore . ",*.pyc,*/node_modules"  " ignore .pyc files

" synstatisc
let g:syntastic_check_on_open = 1

" disable vim markdown folding
let g:vim_markdown_folding_disabled=1

" editorconfig + fugitive
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" disable folding on vim-latex
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""

" remaps
nnoremap <C-J>          <C-W>j
nnoremap <C-K>          <C-W>k
nnoremap <C-H>          <C-W>h
nnoremap <C-L>          <C-W>l
nnoremap <leader>d      oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader><S-d>  Oimport ipdb; ipdb.set_trace()<Esc>
nnoremap <leader>f      :CommandTFlush<CR>
noremap <leader>p      o<ESC>"+p
noremap <leader>P      O<ESC>"+p
noremap <leader>y      "+y
noremap <leader>Y      "+yy
nnoremap <leader>r      :! python %<CR>
nnoremap <leader>s      :w<CR>
nnoremap <leader>q      :wq<CR>
nnoremap <leader>Q      :q!<CR>

" swap dict key to its value (only works for 1 line key-value pair)
nnoremap <leader>S      ^ldt'f'lPldt'2F'Pj^

" change dict key to keyword argument
nnoremap <silent> <Plug>tokwarg     :normal! ^xf'xr=lxj:silent! call repeat#set("\<Plug>tokwarg",v:count)<CR>
nmap <leader>K      <Plug>tokwarg

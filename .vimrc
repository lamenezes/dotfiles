"""
" Vundle Configuration
"""
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
Bundle 'fholgado/minibufexpl.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'Lokaltog/powerline'
Bundle 'sjl/gundo.vim'
Bundle 'davidhalter/jedi-vim'
Bundle 'wincent/Command-T'
Bundle 'vim-latex/vim-latex'
Plugin 'godlygeek/tabular'

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

" remaps for working with minibufexpl.vim
noremap <C-J>     <C-W>j
noremap <C-K>     <C-W>k
noremap <C-H>     <C-W>h
noremap <C-L>     <C-W>l

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

" jedi vim configs
let g:jedi#popup_on_dot = 0
let g:jedi#show_call_signatures = "0"
" don't popup docstring window
autocmd FileType python setlocal completeopt-=preview

" command-t
let g:CommandTFileScanner = "find"  " use find over ruby alternative
let g:CommandTWildIgnore=&wildignore . ",*.pyc"  " ignore .pyc files

" synstatisc
let g:syntastic_check_on_open = 1

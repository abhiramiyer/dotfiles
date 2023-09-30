" A vimrc file based on $VIMRUNTIME/vimrc_example from 8.2.

" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup    " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile  " keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Download and install vim-plug if it's not present
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Add plugins
call plug#begin()
" After updating this list, run :source % followed by :PlugInstall
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Set solarized dark colorscheme
set background=dark
colorscheme solarized

" vim-airline settings
let g:airline_theme='<theme>'
" Automatically display all buffers when there's only one tab open
let g:airline#extensions#tabline#enabled = 1
" Set solarized theme
let g:airline_theme='solarized'

" Leader
let mapleader = " "

" Enable line numbers
set number

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Tabs and spaces
set tabstop=2
set shiftwidth=2
set expandtab

" Use one space, not two, after a '.', '?' and '!' with a join command
set nojoinspaces

" Search settings
set ignorecase
set smartcase
nnoremap <C-l> :nohlsearch<CR><C-l>

" Some options to experiment with
" set cursorline
" set autoread


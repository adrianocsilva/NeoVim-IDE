
"*****************************************************************************
"" Vim-Plug core
"*****************************************************************************

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))


"*****************************************************************************
"" Plug install packages
"*****************************************************************************

"" Color
Plug 'morhetz/gruvbox'
Plug 'tomasr/molokai'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'

"*****************************************************************************
"*****************************************************************************
call plug#end()

" Required:
filetype plugin indent on


"*****************************************************************************
"" Visual Settings
"*****************************************************************************

syntax on
set ruler
set number
set relativenumber
set cursorline


let no_buffers_menu=1
silent! colorscheme gruvbox

set mousemodel=popup
set t_Co=256


"*****************************************************************************
"" Basic Setup
"*****************************************************************************"

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8


"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

"" Map leader to ,
let mapleader="\<space>"

"" Enable hidden buffers
set hidden

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split
set fileformats=unix,dos,mac


"*****************************************************************************
"" Mappings
"*****************************************************************************

"" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>eb :source $MYVIMRC<cr>

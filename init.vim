set hidden
set inccommand=split
let mapleader="\<space>"
nnoremap <leader>; A;<esc>
nnoremap <leader>ev :vsplit $MYVIMRC<cr><C-w>w
nnoremap <leader>eb :source $MYVIMRC<cr>


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

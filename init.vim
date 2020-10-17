"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug core (Begin)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom configs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" COC-parameters
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.config/nvim',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Vim-Airline Configuration
    
    let g:airline#extensions#tabline#formatter = 'default'
    let g:airline#extensions#virtualenv#enabled = 1
    
    " Enable powerline fonts
        let g:airline_powerline_fonts = 1
        let g:airline_left_sep = ''
        let g:airline_right_sep = ''
    " Enable tabline
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#left_sep = ' '
        let g:airline#extensions#tabline#left_alt_sep = '|' 
        let g:airline#extensions#tabline#right_sep = ' '
        let g:airline#extensions#tabline#right_alt_sep = '|'
        " Always show tabs
        set showtabline=2
    
    " We don't need to see things like -- INSERT -- anymore
        set noshowmode

" Python env
"let g:pthon3_host_prog = '/usr/bin/python3'        " <-- System 
"let g:python3_host_prog = '~/anaconda3/bin/python3' " <-- Anaconda


" Vista
    " How each level is indented and what to prepend.
    " This could make the display more compact or more spacious.
    " e.g., more compact: ["▸ ", ""]
    " Note: this option only works the LSP executives, doesn't work for `:Vista ctags`.
    let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]
    
    " Executive used when opening vista sidebar without specifying it.
    " See all the avaliable executives via `:echo g:vista#executives`.
    let g:vista_default_executive = 'coc'
    
    " Set the executive for some filetypes explicitly. Use the explicit executive
    " instead of the default one for these filetypes when using `:Vista` without
    " specifying the executive.
    let g:vista_executive_for = {
      \ 'cpp': 'vim_lsp',
      \ 'php': 'vim_lsp',
      \ }

    " Declare the command including the executable and options used to generate ctags output
    " for some certain filetypes.The file path will be appened to your custom command.
    " For example:
    let g:vista_ctags_cmd = {
          \ 'haskell': 'hasktags -x -o - -c',
          \ }
    
    " To enable fzf's preview window set g:vista_fzf_preview.
    " The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
    " For example:
    let g:vista_fzf_preview = ['right:50%']
    " Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
    let g:vista#renderer#enable_icon = 1
    
    " The default icons can't be suitable for all the filetypes, you can extend it as you wish.
    let g:vista#renderer#icons = {
    \   "function": "\uf794",
    \   "variable": "\uf71b",
    \  }

" Clap
let g:clap_theme = { 'search_text': {'guifg': 'red', 'ctermfg': 'red'} }


" Vim-Rainbow
let g:rainbow_active = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plug install packages
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Utility
Plug 'liuchengxu/vista.vim'
Plug 'arp242/auto_mkdir2.vim'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'triglav/vim-visual-increment'   
Plug 'frazrepo/vim-rainbow'
    " COC Extensions
   " Plug 'Shougo/neco-vim'
   " Plug 'neoclide/coc-neco'

" Color / Themes
Plug 'drewtempelmeyer/palenight.vim'
"Plug 'ayu-theme/ayu-vim'
"Plug 'morhetz/gruvbox'
"Plug 'arcticicestudio/nord-vim'
"Plug 'tomasr/molokai'
"Plug 'laggardkernel/vim-one'
"Plug 'tomasiser/vim-code-dark'

" Interface
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
"Plug 'severin-lemaignan/vim-minimap'

" Syntax
"Plug 'sheerun/vim-polyglot'
"Plug 'mileszs/ack.vim'
"Plug 'dense-analysis/ale'

" Search
"if isdirectory('/usr/local/opt/fzf')
"  Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
"else
"  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"  Plug 'junegunn/fzf.vim'
"endif
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
Plug 'mileszs/ack.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim-Plug core (End)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#end()

" Required:
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set ruler
set number
set relativenumber
set cursorline

" Some servers have issues with backup files
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

let no_buffers_menu=1

" True color support
if (has("termguicolors"))
  set termguicolors
endif

set background=dark

" Ayucolor options
"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme

" Palenight color options
"let g:lightline = { 'colorscheme': 'palenight' }
"let g:airline_theme = 'palenight'

" Italic support
"let g:one_allow_italics=1 
let g:palenight_terminal_italics=1

colorscheme palenight 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overridden by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

" Map leader to ,
let mapleader="\<space>"

" Enable hidden buffers
set hidden

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set inccommand=split
set fileformats=unix,dos,mac


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

nnoremap <leader>; A;<esc>
nnoremap <leader>v :vsplit $MYVIMRC<CR>
nnoremap <leader>s :source $MYVIMRC<CR>
nnoremap <C-p> :Clap files<CR>
nnoremap <leader>p :Clap filer<CR>
nnoremap <leader>bd :bdelete<CR>
" COC
    nmap <space>e :CocCommand explorer<CR>
    nmap <space>f :CocCommand explorer --preset floating<CR>
    autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
   
" use <c-space>for trigger completion
inoremap <silent><expr> <C-space> coc#refresh()

" Clap
nmap <silent> <C-l> :Clap providers<CR>
nnoremap <C-f> :Clap blines<CR>
noremap <C-g> :Clap grep<CR>
nnoremap <leader>bf :Clap buffers<CR>

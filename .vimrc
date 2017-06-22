set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'easymotion/vim-easymotion'
Plugin 'wikitopian/hardmode'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'joshdick/onedark.vim'
Plugin 'tyrannicaltoucan/vim-quantum'
Plugin 'elixir-lang/vim-elixir'
Plugin 'slashmilli/alchemist.vim'
Plugin 'tpope/vim-endwise'
Plugin 'avdgaag/vim-phoenix'
Plugin 'Shougo/neocomplete.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'w0rp/ale'
Plugin 'duggiefresh/vim-easydir'

" START OF PLUGIN
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" END OF PLUGINS


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
set background=dark
set termguicolors
colorscheme quantum

" Configure 24 bit colors
if (empty($TMUX))
    if (has("nvim"))
      let $NVIM_TUI_ENABLE_TRUE_COLOR=1
        endif
    if (has("termguicolors"))
      set termguicolors
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set leader key
let mapleader="\<Space>"

" Set Default font
set guifont=Operator\ Mono\ 12

" Set new buffer location
set splitright
set splitbelow

" Fixes issue where Vim waits a few seconds after
" ESC is pressed.
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
	set ttimeoutlen=10
	augroup FastEscape
		autocmd!
		au InsertEnter * set timeoutlen=0
		au InsertLeave * set timeoutlen=1000
	augroup END
endif

" Set cursor color depending on mode
let &t_SI = "\<Esc>]12;yellow\x7"
let &t_SR = "\<Esc>]12;red\x7"
let &t_EI = "\<Esc>]12;blue\x7"

" Set color of airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Enable neocomplete at start
let g:neocomplete#enable_at_startup = 1

" Enable universal linter
let &runtimepath.=',~/.vim/bundle/ale'

" Automatically clear ctrlp cache to avoid manual refresh after new files are
" added
let g:ctrlp_max_files=0 

" Automatically show hidden files in nerdtree and ctrlp
let NERDTreeShowHidden=1
let g:ctrlp_show_hidden = 1

" Set ignore options for ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab = 4 spaces
set shiftwidth=2
set tabstop=2

" Highlight searches
set hlsearch

" Ignore case of searches
set ignorecase

" Always show status line
set laststatus=2

" Don't reset cursor to start of the line when moving around
set nostartofline

" Show cursor position
set ruler

" Show the current mode
set showmode

" Use relative line numbers
if exists("&relativenumber")
	set relativenumber
	au BufReadPost * set relativenumber
endif

" Settings for vertical indent lines
let g:indentLine_char='|'

" Allow cursor keys in insert mode
set esckeys

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" System Keybinding Overrides
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap save and quit commands
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Remap buffer toggle keys to remove excess 'w'
nnoremap <leader>bj <C-W><C-J>
nnoremap <leader>bk <C-W><C-K>
nnoremap <leader>bl <C-W><C-L>
nnoremap <leader>bh <C-W><C-H>

" Remap buffer splitting keybindings
nnoremap <leader>vs :vsplit<ENTER>
nnoremap <leader>sp :sp<ENTER>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hard Mode
" Hardmode is enabled by default
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
" Toggle Vim Hardmode
nnoremap <leader><leader>h <Esc>:call ToggleHardMode()<CR>

" Nerd Tree
" Easier to open and close NerdTree
nnoremap <leader>j :NERDTree<ENTER>
nnoremap <leader>k :NERDTreeClose<Enter>

" CTRLP
" Launch CtrlP via leader key
nnoremap <Leader>p :CtrlP<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Golang Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Elixir / Alchemist keybindings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap Mix command
nnoremap <leader>m :Mix <Enter>

" Remap Mix test command
nnoremap <leader>mt :Mix test<Enter>

" Remap Mix deps.get command
nnoremap <leader>mdg :Mix deps.get<Enter>

" Remap Mix dogma (lint) command
nnoremap <leader>ml :Mix dogma<Enter>

" Remap Mix compile command
nnoremap <leader>mc :Mix compile<Enter>


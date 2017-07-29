set nocompatible              " be iMproved, required
filetype off                  " required

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" let Vundle manage Vundle, required
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-endwise'
Plug 'duggiefresh/vim-easydir'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Themes 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark " or light if you prefer the light version
set t_Co=256

" for vim 8
 if (has("termguicolors"))
  set termguicolors
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
" let g:airline_theme='solarized'
" let g:airline_solarized_bg='dark'

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
" Use auto write  to allow :GoBuild call without saving first
set autowrite

" All error windows will use quickfix window format
let g:go_list_type = "quickfix"

" Shortcuts for navigating errors in quick fix window
map <C-j> :cnext<CR>
map <C-k> :cprevious<CR>
nnoremap <C-c> :cclose<CR>

" Shortcut for running GO
autocmd FileType go nmap <leader>gr  <Plug>(go-run)

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>gb :<C-u>call <SID>build_go_files()<CR>

" Shortcut for test coverage
autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)

" Automatically run fmt and complete import, remove if slowing down system
let g:go_fmt_command = "goimports"

" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1

" Use metalinter
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1

" Column Setup for Go
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4

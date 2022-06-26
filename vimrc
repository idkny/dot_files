set nocompatible

# GENERAL

let $RC="$HOME/.vim/vimrc"
let $RTP=split(&runtimepath, ',')[0]
set path+=**

# PYTHON

#rm traling white space from py files 
autocmd BufWritePre *.py :%s/\s+$//e

#set shift width to 4 spaces.
set shiftwidth=4

# Set tab width to 4 columns.
set tabstop=4 
set softtabstop=4 expandtab autoindent smartindent

# Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

# Ignore capital letters during search.
set ignorecase

# Override the ignorecase option if searching for capital letters.
# This will allow you to search specifically for capital letters.
set smartcase

# Set the commands to save in history default number is 20.
set history=1000


# FILETYPE

# Enable type file detection.
filetype on

# Enable plugins and load plugin for the detected file type.
filetype plugin on

# Load an indent file for the detected file type.
filetype indent on


# HIGHLIGHT

# Turn syntax highlighting on.
syntax on

# Add numbers line.
set number

# Highlight cursor line underneath the cursor horizontally.
set cursorline

# Highlight cursor line underneath the cursor vertically.
set cursorcolumn

# Use highlighting when doing a search.
set hlsearch

# While searching though a file incrementally highlight matching characters as you type.
set incsearch


# SHOW
# Show partial command you type in the last line of the screen.
set showcmd

# Show the mode you are on the last line.
set showmode

# Show matching words during a search.
set showmatch

# Add status bar at the bottom of the file.
set laststatus=2


# WILDMENU

# Enable auto completion menu after pressing TAB.
set wildmenu

# Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

# There are certain files that we would never want to edit with Vim.
# Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx


# FOLDING

set foldenable

# If the value is set to 0, then all the folds would be closed. For value 99,
# all the folds would be open. So, 10 ensures that only heavily nested blocks are folded."
set foldlevelstart=10

set foldmethod=indent

# MAPPINGS
vmap <C-c> "+y

# NERDTreeToggle Ctrl+N
map <C-n> :NERDTreeToggle<CR>


# Vimspectore

nnoremap <leader>da :call vimspector#Lunch()<CR>                                                                          
nnoremap <leader>dx :call vimspector"Reset()<CR>
nnoremap <S-k> :call vimspector"StepOut()<CR>
nnoremap <S-l> :call vimspector"StepInto()<CR>
nnoremap <S-j> :call vimspector"StepOver()<CR>
nnoremap <leader>d_ :call vimspector"Restart()<CR>
nnoremap <leader>dn :call vimspector"Continue()<CR>
nnoremap <leader>drc :call vimspector"RunToCursor()<CR>
nnoremap <leader>dh :call vimspector"ToggleBreakpoint()<CR>
nnoremap <leader>de :call vimspector"ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dx :call vimspector"ClearBreakpoint()<CR>
nnoremap <leader>d? :call vimspector"AddToMatch()<CR>

# shortcut for opening/closing folds"
nnoremap <space> za

# Press ii to return to normal mode when in insert mode
inoremap ii <ESC>
inoremap <ESC> <NOP>

# Press ii to return to normal mode when in visual mode
vnoremap ii <ESC>
vnoremap <ESC> <NOP>

# Press ii when in Command mode, to go back to normal mode
cnoremap ii <ESC>

# map leader key
let mapleader=","

# PLUGINS

# automaticly download vim"plug manager (useful if you want to use in a new
# system  https://www.youtube.com/watch?v=MztQMLyyCnU

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
      silent execute '!curl "fLo '.data_dir.'/autoload/plug.vim ""create"dirs  https://raw.githubusercontent.com/junegunn/vim"plug/master/plug.vim'
        autocmd VimEnter * PlugInstall ""sync | source $MYVIMRC
    endif

call plug#begin()

Plug 'preservim/nerdtree'
Plug 'honza/vim-snippets'
Plug 'puremourning/vimspector'
Plug 'ycm-core/YouCompleteMe'
Plug 'mattn/emmet-vim'

# Fuzzy file search
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()


# VIMSCRIPT

#Enable marker method of folding.
augroup filetype_vim
    autocmd!


set nocompatible
set ruler
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" The bundles you install will be listed here
syntax on
filetype plugin indent on
" The rest of your config follows here

augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 120
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%120v.*/
    autocmd FileType python set nowrap
augroup END

call vundle#begin('~/.vim/bundle')

Plugin 'tpope/vim-sensible'
Plugin 'fatih/vim-go'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plugin 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
Plugin 'davidhalter/jedi-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'moorereason/vim-markdownfmt'

call vundle#end()

let python_highlight_all=1
syntax on

" check if mouse suitable
if has('mouse')
  set mouse=a
endif

" python indent
autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 textwidth=80 smarttab expandtab

au FileType go nmap <F8> :TagbarToggle<CR>
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>i <Plug>(go-info)

" nerd tree settings
map <F2> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

set number
set tabstop=4
set shiftwidth=4
set expandtab

" more subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
else
    set background=dark
    colorscheme solarized
endif

set laststatus=2


let g:pymode_rope = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

set encoding=utf-8


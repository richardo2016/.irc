" Manual Page for Options
" http://vimdoc.sourceforge.net/htmldoc/options.html
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
execute pathogen#helptags()
set nocompatible
filetype plugin indent on
syntax on
set background=dark
colorscheme jellybeans
set grepprg=ack
set grepformat=%f:%l:%m
let &termencoding=&encoding
set encoding=utf-8
set fileencodings=ucs-bom,utf-8
set number
set hlsearch
set autoindent
set smartindent
set autoread
set autowrite
set backspace=indent,eol,start
set display=lastline
set expandtab
set shiftwidth=4
set tabstop=4
set formatoptions=cromM
set mouse=a
set hidden
set ignorecase
set incsearch
set linespace=6
set lazyredraw
set ruler
set scrolloff=2
set textwidth=79
set whichwrap=b,s,<,>,[,]
set wildmenu
set t_Co=256
set foldmethod=marker
set list
set listchars=tab:→\ ,trail:·
set cursorline
set cursorcolumn

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

autocmd BufWritePre * :%s/\s\+$//e
autocmd BufRead,BufNewFile *.py,*.java,*.cpp,*.c,*.h set cc=80 ts=4 sw=4
autocmd BufRead,BufNewFile *.tex,*.xml,*.json,*.conf,*.html,*.js,*.jsx,*.css,*.scss,*.less set ts=2 sw=2
" bufexplorer
let g:bufExplorerShowRelativePath=1  " Show relative paths.
let g:bufExplorerDisableDefaultKeyMapping=1
noremap <leader>e :BufExplorer<CR>
" ctrl-p
let g:ctrlp_working_path_mode=0
let g:ctrlp_custom_ignore = '\v[\/]\.(git|svn)$'
let g:ctrlp_user_command = {
  \ 'types': {
    \ 1: ['.git', 'cd %s && git ls-files'],
    \ 2: ['.svn', 'cd %s && svn list -R'],
    \ },
  \ 'fallback': 'find %s -type f'
  \ }
" syntastic
let g:syntastic_python_checkers=['flake8']
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_java_checkers = ['javac']
" nerdtree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <C-n> :NERDTreeToggle<CR>

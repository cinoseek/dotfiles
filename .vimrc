"
" My Setting
"
execute pathogen#infect()
set nu
set hls
filetype on

set tags=./tags
set csprg=/usr/bin/cscope
set csto=0
set cst
set nocsverb
set nowrap
set ruler
set tabstop=7
set noautoindent
set nocindent
set nosmartindent
set indentexpr=
set paste

if filereadable('./cscope.out')
    cs add cscope.out
endif

set csverb

if &term == "screen"
      set t_Co=256
endif

syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme solarized

set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
command Spaceshow exe "set list listchars=tab:\<Char-0xBB>\<Char-0xB7>,trail:\<Char-0xB7>"
command Spacefind /\s\s*$

function! FindAll()
    call inputsave()
    let p = input('Enter pattern:')
    call inputrestore()
    execute 'vimgrep "'.p.'" % |copen'
endfunction

nmap <F5> :call FindAll()<CR>
nmap <F6> :NERDTreeToggle<CR>
nmap <F7> :TlistToggle<CR>
nmap <F8> :TagbarToggle<CR>

if executable('cquery')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'cquery',
      \ 'cmd': {server_info->['cquery']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': { 'cacheDirectory': '/home/cno/bin/cquery_git/temp/cache' },
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
endif

"
" Vundle.vim
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
Plugin 'The-NERD-Tree'
Plugin 'vim-airline/vim-airline'
Plugin 'airblade/vim-gitgutter'
Plugin 'scrooloose/syntastic'
Plugin 'Mark'

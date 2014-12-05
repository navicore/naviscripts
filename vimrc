" 1) install vundle:
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 2) restart vim
" 3) :BundleInstall
" 4) build ~/.vim/bundle/YouCompleteMe with './install.sh --clang-completer'

"set term=builtin_ansi
syntax on

:set nu
set nocompatible              " be iMproved
filetype off                  " required!

set hidden
set expandtab
set tabstop=2
set shiftwidth=2

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'fatih/vim-go'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rollxx/vim-antlr'
Plugin 'derekwyatt/vim-scala'
Plugin 'ervandew/screen'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'guns/vim-clojure-static'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'navicore/vis.vim'
Plugin 'navicore/vissort.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tfnico/vim-gradle'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround.git'
Plugin 'wannesm/wmgraphviz.vim'

filetype plugin indent on     " required!

set completeopt-=preview

let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_mode_map = { "mode": "active"}
"                           \ "active_filetypes": ["ruby", "java", "python", "javascript"],
"                           \ "passive_filetypes": ["puppet"] }

let g:ctrlp_user_command = ['.git/', 'cd %s && git ls-files --exclude-standard -co']
let g:ctrlp_max_files=0
let g:ctrlp_max_depth=40

let g:ScreenImpl = 'Tmux'

nmap <F4> :w<CR>:make<CR>:copen<CR>

if has('gui_running')
  set background=dark
else
  "set background=light
  set background=dark
endif
colorscheme gruvbox
map <F5> :call ToggleBg()<CR>
function! ToggleBg()
  if &background == 'dark'
    set bg=light
  else
    set bg=dark
  endif
endfunc
"set nu

function SetIDEOptions()
  "NERDTree
  "Tagbar
  if isdirectory('.git')
    CtrlP
  endif
endfunction

autocmd vimenter * if !argc() | call SetIDEOptions() | endif
map <C-n> :NERDTreeToggle<CR>

map <C-t> :TagbarToggle<CR>

"set the source for autocomplete
set complete=.,w,b,u,t,i

set tags=.tags

let g:syntastic_java_javac_config_file_enabled=1

set spell
set spelllang=en_us

"hit enter after search to remove highlights
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

"let g:gist_show_privates = 1

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:solarized_termcolors=256

set colorcolumn=81
"change the color of the 81st char
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

"hightlight real tabs and trailing whitespace
set listchars=tab:>~,nbsp:_,trail:.
set list

xnoremap . :normal .<CR>

"buble single line
nmap <C-k> ddkP
nmap <C-j> ddp
"buble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]


"  1) install vundle:
"  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"  2) restart vim
"  3) :BundleInstall
"  4) build ~/.vim/bundle/YouCompleteMe with:
"    ./install.py --clang-completer --gocode-completer --tern-completer
"  5) npm install -g eslint
"  6) npm install -g babel-eslint
"  7) npm install -g eslint-plugin-react
"  8) npm install -g jslint
"  9) npm install -g eslint
" 10) mkdir ~/.zsh/completion
" 11) curl -L https://raw.githubusercontent.com/docker/compose/$(docker-compose version --short)/contrib/completion/zsh/_docker-compose > ~/.zsh/completion/_docker-compose

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

Plugin 'Chiel92/vim-autoformat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'derekwyatt/vim-scala'
Plugin 'diepm/vim-rest-console'
Plugin 'digitaltoad/vim-jade'
Plugin 'ervandew/screen'
Plugin 'fatih/vim-go'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'jcfaria/Vim-R-plugin'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mbbill/undotree'
Plugin 'morhetz/gruvbox'
Plugin 'navicore/vis.vim'
Plugin 'navicore/vissort.vim'
Plugin 'rollxx/vim-antlr'
Plugin 'rust-lang/rust.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'simonhicks/gradle-vim-syntastic-plugin'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'wannesm/wmgraphviz.vim'

filetype plugin indent on     " required!

set completeopt-=preview

"turn off pandoc folding
let g:pandoc#modules#disabled = ["folding"]

"let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_jslint_args = ['--edition=es6']

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes':['go']}

let g:syntastic_aggregate_errors = 1

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
  if isdirectory('.git')
    "CtrlP
    NERDTree
    "Tagbar
    "set bg=light
  endif
endfunction

autocmd vimenter * if !argc() | call SetIDEOptions() | endif
map <C-n> :NERDTreeToggle<CR>

map <C-t> :TagbarToggle<CR>

"set the source for autocomplete
set complete=.,w,b,u,t,i

"golang
let g:go_fmt_command = "goimports"

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

command Whitespace :call Whitespace()<CR>
"map <F6> :call Whitespace()<CR>
function! Whitespace()
  "hightlight real tabs and trailing whitespace
  set listchars=tab:>~,nbsp:_,trail:.
  set list
endfunc

xnoremap . :normal .<CR>

"buble single line
nmap <C-k> ddkP
nmap <C-j> ddp
"buble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

"macros
"quote words
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl
nnoremap qj ::%!python -m json.tool

let g:syntastic_python_checkers = ['pylint', 'pep8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'

set clipboard=unnamed

if filereadable(glob('./.vimrc.local'))
     so ./.vimrc.local
endif

"
" commands:
"
" json pretty print:  :%!python -m json.tool
"
vnoremap <leader>j :!python -mjson.tool<cr>

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

nnoremap <F6> :UndotreeToggle<cr>


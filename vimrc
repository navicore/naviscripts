" --------- OSX ---------
" brew install olafurpg/scalafmt/scalafmt
" brew install haskell-stack
" brew install ctags-exuberant
" --------- LNX --------- (debian-based)
" curl -sSL https://get.haskellstack.org/ | sh
" sudo apt install exuberant-ctags
" apt install build-essential python-dev cmake zsh
" --------- ALL ---------
" brew install yarn
" yarn global add prettier eslint
" git clone git@github.com:zsh-users/antigen.git .antigen/git/
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" mkdir -p ~/.vim/swapfiles
" restart vim :BundleInstall
" build ~/.vim/bundle/YouCompleteMe with: ./install.py --clang-completer --gocode-completer --tern-completer
" build ~/.vim/bundle/vimproc.vim with: make
" stack setup
" stack install hlint
" stack --no-system-ghc --install-ghc build ghc-mod
" stack --no-system-ghc --install-ghc install ghc-mod

" in each proj: ctags -R -f ./.git/tags .

syntax on

:set nu
set nocompatible " be iMproved
filetype off     " required!

set directory=~/.vim/swapfiles// 

set hidden
set expandtab
set tabstop=2
set shiftwidth=2

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Plugin 'google/vim-jsonnet'
Plugin 'fleischie/vim-styled-components'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/vimproc.vim.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'aklt/plantuml-syntax'
Plugin 'derekwyatt/vim-sbt'
Plugin 'derekwyatt/vim-scala'
Plugin 'diepm/vim-rest-console'
Plugin 'eagletmt/ghcmod-vim.git'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/screen'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'navicore/vis.vim'
Plugin 'navicore/vissort.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'w0rp/ale'

Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'maxmellon/vim-jsx-pretty'

Plugin 'sbdchd/neoformat'

autocmd BufWritePre *.js Neoformat

let NERDTreeShowHidden=1

filetype plugin indent on     " required!

set completeopt-=preview

"dot / graphiz
let g:WMGraphviz_dot = 'dot'
let g:WMGraphviz_output = 'png'
let g:WMGraphviz_viewer = 'open'

let g:ycm_semantic_triggers = {'haskell' : ['.']}

let g:flow#autoclose=1
let g:flow#flowpath='node_modules/.bin/flow'
let g:eslint#autoclose=1
let g:eslint#eslintpath='node_modules/.bin/eslint'

set autoread

set statusline+=%#warningmsg#
set statusline+=%*

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

set tags=./.tags;,.tags;

set spell
set spelllang=en_us

"hit enter after search to remove highlights
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

let g:solarized_termcolors=256

set colorcolumn=81

set listchars=tab:>~,nbsp:_,trail:.
set list

xnoremap . :normal .<CR>

"buble single line
nmap <C-k> ddkP
nmap <C-j> ddp

"buble multiple lines
vmap <C-k> xkP`[V`]
vmap <C-j> xp`[V`]

" ********************* "
"     begin macros      "
" ********************* "

"quote words
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl

" ******************* "
"     end macros      "
" ******************* "

let g:vrc_output_buffer_name = '__VRC_OUTPUT.json'

set clipboard=unnamed

if filereadable(glob('./.vimrc.local'))
     so ./.vimrc.local
endif

if has("persistent_undo")
    set undodir=~/.undodir/
    set undofile
endif

nnoremap <F6> :UndotreeToggle<cr>

au BufRead,BufNewFile *.sbt set filetype=sbt

"plantuml
autocmd BufWritePost,FileWritePost *.uml :silent make

"autofmt scala
noremap <F3> :Autoformat<CR>
let g:formatdef_scalafmt = '"scalafmt --stdin 2>/dev/null"'
let g:formatters_scala = ['scalafmt']

" can't turn this on until scalafmt respects akka http dsl
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

" in anticipation of the idiotic removal of the esc key from apple hardware
"inoremap <silent> jj <C-c>:stopinsert<cr>l


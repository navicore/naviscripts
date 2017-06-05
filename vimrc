" --------- OSX ---------
" brew install olafurpg/scalafmt/scalafmt
" brew install haskell-stack
" brew install the_silver_searcher
" brew install ctags-exuberant
" --------- LNX --------- (debian-based)
" curl -sSL https://get.haskellstack.org/ | sh
" sudo apt install exuberant-ctags
" sudo apt install silversearcher-ag
" apt install build-essential python-dev cmake zsh
" --------- ALL ---------
" brew install yarn
" yarn global add prettier eslint
" curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
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

Plugin 'fleischie/vim-styled-components'
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/vimproc.vim.git'
Plugin 'Valloric/YouCompleteMe'
Plugin 'aklt/plantuml-syntax'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'derekwyatt/vim-sbt'
Plugin 'derekwyatt/vim-scala'
Plugin 'diepm/vim-rest-console'
Plugin 'eagletmt/ghcmod-vim.git'
Plugin 'eagletmt/neco-ghc'
Plugin 'ervandew/screen'
Plugin 'fatih/vim-go'
Plugin 'gmarik/vundle'
Plugin 'godlygeek/tabular'
Plugin 'majutsushi/tagbar'
Plugin 'mattn/gist-vim'
Plugin 'mattn/webapi-vim'
Plugin 'mbbill/undotree'
Plugin 'morhetz/gruvbox'
Plugin 'navicore/vis.vim'
Plugin 'navicore/vissort.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'tomtom/tcomment_vim'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'wannesm/wmgraphviz.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/yajs.vim'
Plugin 'maxmellon/vim-jsx-pretty'
Plugin 'flowtype/vim-flow.git'
Plugin 'sbdchd/neoformat'

autocmd BufWritePre *.js Neoformat

let NERDTreeShowHidden=1

filetype plugin indent on     " required!

set completeopt-=preview

"dot / graphiz
let g:WMGraphviz_dot = 'dot'
let g:WMGraphviz_output = 'png'
let g:WMGraphviz_viewer = 'open'

"turn off pandoc folding
let g:pandoc#modules#disabled = ["folding"]

let g:ycm_semantic_triggers = {'haskell' : ['.']}

let g:syntastic_javascript_eslint_exe = 'node_modules/.bin/eslint'
let g:syntastic_javascript_checkers = ['eslint', 'flow']
let g:flow#autoclose=1
let g:flow#flowpath='node_modules/.bin/flow'
let g:eslint#autoclose=1
let g:eslint#eslintpath='node_modules/.bin/eslint'

set autoread

let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes':['go']}

let g:syntastic_aggregate_errors = 1

let g:syntastic_java_javac_config_file_enabled=1

let g:syntastic_python_checkers = ['pylint', 'pep8']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn

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

"map <F12> :!ctags -R -f ./.git/tags .<CR>
map <F12> :!ctags -R -f ./.tags .<CR>

set tags=./.tags;,.tags;

set spell
set spelllang=en_us

"hit enter after search to remove highlights
set hlsearch
nnoremap <CR> :nohlsearch<CR><CR>

" search project for word under *
nnoremap <Leader>* :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

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

" ********************* "
"     begin macros      "
" ********************* "

"quote words
nnoremap qw :silent! normal mpea'<Esc>bi'<Esc>`pl
nnoremap qd :silent! normal mpea"<Esc>bi"<Esc>`pl

"pretty format json
nnoremap qj ::%!python -m json.tool

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

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

"plantuml
autocmd BufWritePost,FileWritePost *.uml :silent make

"autofmt scala
noremap <F3> :Autoformat<CR>
let g:formatdef_scalafmt = "'scalafmt --stdin'"
let g:formatters_scala = ['scalafmt']


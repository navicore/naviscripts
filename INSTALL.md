" --------- LNX --------- (debian-based)
" dnf group install "Development Tools"
" dnf install devel
"
" apt install build-essential python-dev cmake zsh gmp-devel
" apt install neovim
"
" --------- OSX ---------
" defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
" defaults write -g ApplePressAndHoldEnabled -bool false # global fix when the above
"   doesn't work for all idea products
" brew install exa python3 fzf ripgrep libxml2 xml2 libgit2 reattach-to-user-namespace nvm zplug zsh-history-substring-search nailgun cmake tmux sbt graphviz pandoc hub neovim readline xz chafa viu
" brew install --cask racket
" brew install --cask wezterm
" --------- ALL ---------
"
" nvm install stable
" nvm use stable
" npm i -g babel-eslint eslint eslint-config-airbnb eslint-plugin-import
"
" --------- DENO ---------
" curl -fsSL https://deno.land/x/install/install.sh | sh
" 
" install zplug
" curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

" let g:python3_host_prog = '/usr/local/bin/python3'
" let s:uname = system("echo -n \"$(uname)\"")
" if !v:shell_error && s:uname == "Linux"
"   let g:python3_host_prog = "/usr/bin/python3"
" endif

" BEGIN R:
"
" apt install libfontconfig1-dev libharfbuzz-dev libfribidi-dev libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
"
" my_packages <- c("tidyverse", "broom", "coefplot", "cowplot", "gapminder", "GGally", "ggrepel", "ggridges", "gridExtra", "here", "interplot", "margins", "maps", "mapproj", "mapdata", "MASS", "quantreg", "rlang", "scales", "survey", "srvyr", "viridis", "viridisLite", "devtools", "lintr", "plumber", "rmarkdown", "ggthemes", "httr", "gert", "languageserver", "ggpubr", "pivottabler", "kableExtra")
" install.packages(my_packages, repos = "https://cran.rstudio.com")
"
" tinytex::install_tinytex() 
"
" update all R packages:
"
" update.packeges(ask=FALSE)
"
" END R:
"
" :TSInstall java go rust r c cpp python bash awk lua 
"
" mkdir -p ~/.vim/swapfiles
" eval `ssh-agent -s`
" ssh-add
"
" BEGIN RUST:
"
" curl https://sh.rustup.rs -sSf | sh
" rustup component add rust-analysis rust-src
" rustup component add rustfmt
" rustup target add wasm32-wasi
" ssh-add -K ~/.ssh/id_rsa
"
" END RUST:j
"
" BEGIN HASKELL:
"
" curl -sSL https://get.haskellstack.org/ | sh
"   or
" brew install haskell-stack
" git clone git@github.com:olivierverdier/zsh-git-prompt.git ~/tmp/zsh-git-prompt
" for haskell above: stack setup && stack build && stack install
"
" you now have a haskell repl ghci via 'stack repl'
"
" END HASKELL:
"
" BEGIN PYTHON:
"
" sudo pip3 install flake8 jedi
" pip3 install argcomplete 
" activate-global-python-argcomplete
"
" END PYTHON:
"
" install https://github.com/romainl/flattened
"
" build ~/.vim/bundle/vimproc.vim with: make
"
" nerd fonts
" https://github.com/ryanoasis/nerd-fonts#option-3-install-script
" cd tmp && git clone git@github.com:ryanoasis/nerd-fonts.git
"
" GIT CONFIG
"
" git config --global core.excludesfile '~/.gitignore'
" # for when an installation won't let git diff show colors
" git config --global core.pager cat 
"
" END GIT CONFIG
"
" install more k8s stuff
"
" kind https://kind.sigs.k8s.io/docs/user/quick-start/
" 	% kind completion zsh > /usr/local/share/zsh/site-functions/_kind
"
" flux2 https://fluxcd.io/docs/get-started/
" 	% flux completion zsh > /usr/local/share/zsh/site-functions/_flux
"
" install k3d
"
" tell git to use the global gitignore:
" git config --global core.excludesfile ~/.gitignore
"

" xcode commandline tools:

xcode-select --install


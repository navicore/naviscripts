"
" --------- OSX ---------
"
" chsh -s /bin/zsh
"
" install via brew:
"
" brew bundle
"
" periodically run "brew bundle dump" to maintain the Brewfile
"
" defaults write com.jetbrains.intellij.ce ApplePressAndHoldEnabled -bool false
" defaults write -g ApplePressAndHoldEnabled -bool false # global fix when the above
"
" curl -fsSL https://raw.githubusercontent.com/ogham/exa/master/completions/zsh/_exa -o /usr/local/share/zsh/site-functions/_eza
" curl -fsSL https://raw.githubusercontent.com/go-task/task/main/completion/zsh/_task -o /usr/local/share/zsh/site-functions/_task
"
" sudo luarocks install tiktoken_core
"
" --------- ALL ---------
"
" install zinit
" bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
"
" then move your ~/.zshrc stuff to follow the stuff the above added
"
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
" mkdir -p ~/.vim/swapfiles
" eval `ssh-agent -s`
" ssh-add
"
" BEGIN RUST
"
" rustup component add rust-analyzer rust-analysis rust-src rustfmt
" rustup target add wasm32-wasi
" ssh-add -K ~/.ssh/id_rsa
"
" END RUST
"
" START PROMPT
"
" install https://github.com/navicore/zsh-git-prompt-rs
"
" END PROMPT
"
" build ~/.vim/bundle/vimproc.vim with: make
"
" nerd fonts
" https://github.com/ryanoasis/nerd-fonts#option-3-install-script
" cd tmp && git clone git@github.com:ryanoasis/nerd-fonts.git
"
" BEGIN GIT CONFIG
"
" git config --global core.excludesfile '~/.gitignore'
" # for when an installation won't let git diff show colors
" git config --global core.pager cat
"
" END GIT CONFIG
"
" kind completions:
" kind completion zsh > /usr/local/share/zsh/site-functions/_kind
"
" flux2 completions:
" flux completion zsh > /usr/local/share/zsh/site-functions/_flux
"
" tell git to use the global gitignore:
" git config --global core.excludesfile ~/.gitignore
"
" xcode commandline tools:
" xcode-select --install


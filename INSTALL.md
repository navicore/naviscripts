# Naviscripts Install Guide

## All Platforms

### Prerequisites

1. **Zinit** (zsh plugin manager):

   ```sh
   bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
   ```

   After zinit modifies `~/.zshrc`, ensure the naviscripts source line comes
   after zinit's block. If `~/.zshrc` doesn't exist yet, `install.sh` will
   copy the default one.

2. **Nerd Fonts** (for airline/powerline glyphs):

   ```sh
   cd /tmp && git clone --depth 1 git@github.com:ryanoasis/nerd-fonts.git
   cd nerd-fonts && ./install.sh FiraCode
   ```

3. **Git prompt** (optional — for the custom git status prompt):

   Install [zsh-git-prompt-rs](https://github.com/navicore/zsh-git-prompt-rs)

### Install dotfiles

```sh
git clone git@github.com:navicore/naviscripts.git ~/naviscripts
cd ~/naviscripts
./install.sh
```

This copies config files for zsh, neovim, tmux, ghostty, git, and zed.
Files that should not be overwritten (gitconfig, zshrc, gitignore, racketrc)
are only copied if they don't already exist.

### Post-install

```sh
mkdir -p ~/.vim/swapfiles
mkdir -p ~/.undodir

git config --global core.excludesfile '~/.gitignore'
git config --global core.pager cat
```

Start a new shell and let zinit install plugins on first launch.

### Rust

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup component add rust-analyzer rust-src rustfmt
rustup target add wasm32-wasi
```

### R (optional)

System libraries (Linux):

```sh
sudo apt install libfontconfig1-dev libharfbuzz-dev libfribidi-dev \
  libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev
```

R packages:

```r
my_packages <- c(
  "tidyverse", "broom", "coefplot", "cowplot", "gapminder", "GGally",
  "ggrepel", "ggridges", "gridExtra", "here", "interplot", "margins",
  "maps", "mapproj", "mapdata", "MASS", "quantreg", "rlang", "scales",
  "survey", "srvyr", "viridis", "viridisLite", "devtools", "lintr",
  "plumber", "rmarkdown", "ggthemes", "httr", "gert", "languageserver",
  "ggpubr", "pivottabler", "kableExtra"
)
install.packages(my_packages, repos = "https://cran.rstudio.com")
tinytex::install_tinytex()
```

---

## macOS

### Homebrew packages

```sh
brew bundle
```

To update the Brewfile after installing new packages:

```sh
brew bundle dump --force
```

### macOS-specific settings

Disable press-and-hold for key repeat (useful for vim):

```sh
defaults write -g ApplePressAndHoldEnabled -bool false
```

Xcode command line tools:

```sh
xcode-select --install
```

---

## Linux (Pop!_OS / Ubuntu)

### System packages

```sh
grep -v '^#' ~/naviscripts/apt-packages.txt | grep -v '^$' | xargs sudo apt install -y
```

The full package list is maintained in `apt-packages.txt` (similar to Brewfile on macOS).
To see what's in it: `cat apt-packages.txt`

### Set default shell

```sh
chsh -s $(which zsh)
```

### Ghostty

Install [Ghostty](https://ghostty.org) — the Linux config disables the GTK
title bar. Use **Super + drag** to move windows.

### Hyprland (optional)

The install script places a starter `hyprland.conf` in `~/.config/hypr/`.
If you want to use Hyprland, also install:

```sh
sudo apt install waybar wofi hyprpaper hypridle
```

---

## SSH

```sh
eval "$(ssh-agent -s)"
ssh-add
```

Personal scripts and dot files for vim and tmux and anything else I use.
============

I've lived in text shells since the 90s.
------------

Messy - created slowly over many years.  I'm not sure what some of parts
even do but I can't cope without it all.

* I've fully switch to nvim but should 99% work on vim8+
* Equally OSX and Linux - I use both and most of the setup works for both.
* zsh
* vim-plug
* tmux
* nerd fonts
* coc autocomplete
* Nvim-R is great - I could not use R if I had to use RStudio at all


### INSTALL

`git clone git@github.com:navicore/naviscripts.git`

`cd naviscripts`

`./install.sh`

* follow the tedious instructions at the top of `src/vimrc` to finish the setup
* beware of any hard coded `/home` or `/Users` paths - they sneak in.

### update the repo from the installed files

`./update_git.sh`

`git commit -a -m "my updates"`

`git push`

--------

dotfiles
========

 I've recently (after 15 years of using the other edtior) come to a revelation: VIM is the best text editor, ZSH is a superiour bash, TMUX is indespensible. Solarized (light and dark) are among the absolute best colorschemes and also the most widely spread. All configured together they can make Linux a pretty decent IDE for ASIC/FPGA development. These are my configuration to make life as painless as possoble. Comments/Forks welcomed.

Requirements:
-------------


OLD TEXT
========
My settings for VIM, TMUX, ZSH and other tools I use to create a great Linux based IDE environment for development. This file servesas my blog page for what I learn as I go along. I'm just beyond the novice step in VIM after using (x-)emacs for the last 15 years. So bare with me.

VIM & TMUX as a LINUX IDE
-------------------------

These are my notes on creating a pleasant, portable IDE environment under Linux/MacOSX. I was mainly inspired by [Dr Bunsen's Trium Virate][drbunsen] that looks stellar. These are my work to recerate this under MacOSX and CentOS 5/6 as well as getting SystemVerilog integration with VIM

[drbunsen]: http://www.drbunsen.org/text-triumvirate.html 

Installing on a new machine
---------------------------

All the text below are notes I took while creating this dotfiles repository. Note that while these files are public they are meant as a quick way for *me* to setup a new Linux or Mac machine. The linking script is not smart at all. These are the install steps:

1. You need a ~/Projects area. If you don't have it then mkdir ~/Projects.
2. cd Projects
3. *FOR ME:* git clone git@github.com:rekendahl/dotfiles.git *FOR ANYONE ELSE:*: git clone git://github.com/rekendahl/dotfiles.git
4. cd ~
5. Projects/dotfiles/link_to_files.sh

*Note!* The link_to_files.sh will make a backup copy of your .dotfiles and link to the Projects/dotfiles ones. Do this on your own risk


Goals:
------

1. Create a github dotfiles project
2. Enusre that VIM, TMUX, ZSH are all setup
3. Make sure my languages work, mainly SystemVerilog
4. Make sure it works on MacOSX, Linux (CentOS 5/6) and later Windows
5. Make sure to document tools/fonts needed.


ReMapping Caps Lock to Escape
-----------------------------

Before anyhting else. Using VIM keybindings means hitting escape *a lot*. On the other hand Caps Lock is rarley if ever used. This [key re-map program][pckeyboardhack] allows you to remap the Caps Lock key. For the moment I have remapped it to ESC but CTRL is another option. Another [key remap][keyremap] program I installed allows for other more general configurations that I currently don't use. I only installed this on my MacBook and don't intend to use it.

[pckeyboardhack]: http://pqrs.org/macosx/keyremap4macbook/index.html.en
[keyremap]: http://pqrs.org/macosx/keyremap4macbook/index.html.en 


Mac Specific
------------

###Iterm 2

I've decided to change from zenburn (that I like a lot) to solarized that I like almost as much. This bacuase of Dr Bunsen's setup. I like that he can switch his environment from dark to light easily. Will stick with dark for now.
For iterm2 you can download. The [main github page][solarized_github] can be cloned like this:

git clone git://github.com/altercation/solarized.git

There are a lot of "official" programs under there inclucing iterm2 (and VIM).

[solarized_github]: https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized


###MacPorts

Dr Bunsen uses homebrew but I'm alread setup for macports so I will try to use
macport for now. He recommneds installing the following packages:

git, MacVim, tmux, and reattach-to-user-namespace

Trying that with macports...

####reattach-to-user-namespace
reattach-to-user-namespace doesn't exist under macports instead:

cd Projects
git clone git://github.com/ChrisJohnsen/tmux-MacOSX-pasteboard.git
cd tmux-MacOSX-pasteboard/
make
cp reattach-to-user-namespace ~/bin/.


OH MY ZSH
---------

To install: 

curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh


Fonts
-----

I've recently switched fonts from [Iconsolata][Iconsolata] which is a great font in it's own right to [Source Code Pro][SourceFont] from of all companies Adobe (who I personally don't think are great coders. So one of the first step should be to make sure this font is installed as I assume it is.

[Iconsolata]: http://levien.com/type/myfonts/inconsolata.html
[SourceFont]: https://github.com/adobe/Source-Code-Pro


Github Dotfiles
---------------

This is somethign that's getting popular. Storing all your setup files ("dot files") in a git repo at github. The advantage is that if you work on several computers and/or change companies you still maintain all your settings. I've recreated be dot files so may times and I currently have three slightly different sets on the machines I use. Time to make sure they all behave the same.

So copied most dotfiles from work machine. Added gvimrc from macbook. Decided
to start with clean vim directory and add pathogen etc first. This means
redoing systemVerilog settings but should not be too bad.

Submodules
----------

This project will work with submodules borrowing from other git repositories for things like VIM modules etc. This is the first time I use this concept so here are my notes:

To add a submoudle you need to stand in your top directory and run (for example):

git submodule add git://github.com/altercation/vim-colors-solarized.git vim/bundle/vim-colors-solarized

This clones in the solarized bundle to the correct location.
Unfortunatley once my main repository is cloned two commands needs to be executed on the remote site. I don't know how to add that automatically yet. They are:

git submodule init
git submoudle update

I'm adding this to the linker script

VIM 
---

###Installing Pathogen:

https://github.com/tpope/vim-pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim


### Instaling Solarized in VIM

https://github.com/altercation/vim-colors-solarized

*Note! We need to add solarized (and other vim modules that uses GIT as submodules). So the install step is:
cd ~/.vim
git submodule add git://github.com/altercation/vim-colors-solarized.git vim/bundle/vim-colors-solarized


### VIM POWERLINE

This is a great looking VIM bar. See https://github.com/Lokaltog/vim-powerline for details.

cd ~/Projects/dotfiles
git submodule add git://github.com/Lokaltog/vim-powerline.git vim/bundle/vim-powerline

Added this to .vimrc:

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'

This makes the line work but (as expected) I need to patch the fonts. 

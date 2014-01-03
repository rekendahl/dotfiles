# dotfiles

These are my Mac and Linux 'dotfiles'. I've recently become a VIM, TMUX and ZSH
user and these are my settings. I have forked a version of [vim-spf13] that I
call [vimeda] and added some needed EDA libraries (while removing some
languages not used in the EDA filed). [vimeda] can be easily installed on Linux
& Mac (and soon Windows) so I recommend that you take a look at it if you work
in the EDA field. These are my local tweaks and hacks and as such not automated
and documented as much.

I keep my dotfiles on github so I can easily install my environment on a new
machine. Below are my notes for what tools I install and how I configure them.

# Steps to setup my environment on a new machine (mac/linux)

This is what I do when I setup a new machine (mac or linux).

## Requirements:

These are the tools I use when I code. Will deal with details of how I
configure them later. The General sections contains tools I use on Linux, Mac
(and should work on Windows).

General:
* [VIM 7.3+][vim]
* [ZSH][zsh]
* [TMUX][tmux]
* [Source Code Pro (for Powerline) Font][sourcecodepro]
* [Mosh Mobile Shell][mosh]

Mac:
* [Alfred App][alfred]
* [Homebrew][homebrew]
* [iTerm2][iterm2]

Todo:
* VIM build from source CentOS
* Linux Terminal solarized configuration
* Linux Terminal Source Code Pro for PowerLine configuration

Installing/Updating tools needed :
=================================

This secion goes through how to install and do basic configurations on the
tools I use day to day. Later sections will focus on configuration of the main
tools VIM, ZSH and TMUX. But before we get there we need a little bit of
sanity.

This sections follows the order I install them in on a new machine.

## Alfred [Mac only]

On a new mac the first thing I do is to install the [Alfred App][alfred]. It's
a small app launcher that is started with `Command+<space>`. It's has all types
of features but I mainly use it to switch between apps as I find it better then
`Command+Tab`.  I have paid for the PowerPack bundle, as I like to support
small *good* develeopers *but* for what I use it for mostly the free version is
more then enough.

## iTerm2 [Mac only]

Next I install [iTerm2][iterm2]. It's better terminal emulator then the
built-in `terminal` and is easier to skin. I configure iterm2 in two ways:
first I create two configurations for the [Solarized][solarized] dark & light
colorschemes and then I change the font to `Source Code Pro for Powerline`.

If you haven't checked out [Solarized][solarized] before I highly recommend you
do so. It's a subtle but great color scheme for programming. Not as flashy as
some but the contrast is just right for exented use and I find that I never
grow bored with the looks. I switch between using the dark and light theme with
a slight preference for the dark version.

To configure iTerm2 for solarized I do the following:

* Create two Profiles for Solarized dark & light by going into `Settings->Profiles` and clicking the `+` sign.
* Download the Solarized iTerm2 profiles from their [GitHub Repository](https://github.com/altercation/solarized/tree/master/iterm2-colors-solarized).  *Note!* that I download the files through the web browser and *don't* do a clone
* For each Profile click the `Colors` tab and then `Load Presets` and import the download Profiles.
* I set the default profile to be dark.

There are many great fonts for programming but the one I currently like is
[Source Code Pro][sourcecodepro] from Adobe. It's an open-source font and free to
use. Now I use some VIM/TMUX plug-ins that require special characters to be
present. Luckily Source Code Pro has been pathched to include these. So I
download/install the fonts [from here]
(https://github.com/Lokaltog/powerline-fonts/tree/master/SourceCodePro). Once
installed I configure iterm2 to use Source Code Pro (for Powerline) and 12 or
13pt size.

At this point we have a good looking terminal running. Time to install the day
to day tools I use.

## Gnome Terminal Solarized [Linux Only]

This is not how I did it last time but it seems to work in a Gnome Terminal run
the following commands.  It will create a new Profile called Solarized (and set
it as the new default).

```shell
   git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git
   cd gnome-terminal-colors-solarized
   ./solarize
```

Then simply start a new terminal and it will show up all dark and nice. Your
old "default" profile is still intact. If you run the './solarize' command
again it will switch between light and dark. I put the script in my local "bin"
area for safekeeping.

## Homebrew [Mac only]

[Homebrew][homebrew] is a Mac package manager for all "missing" packages that
Apple didn't install. There are other package managers, like
[MacPorts](http://www.macports.org/), but I prefer [Homebrew][homebrew] since
it feels cleaner and more standard linux to use.

To install simply run the following command and follow the prompts. The tool
will install Apple Command Line Utilities from the App Store.

```shell
   ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

*Note!* Once completed the tool asks you to run `brew doctor` *before*
installing any packages.

Once we have homebrew installed we can install/update som needed tools.

## Latest VIM

I like to use the latest version of VIM. Unfortunatley CentOS 6 is stuck with
an old version and needs to be compiled from source. I hope to document these
steps later.

Mac install:

```shell
   brew install vim
   brew install macvim --devel
   brew linkapps
```

*Note1!*  `macvim --devel` is currently needed since VIM 7.4 has not been
declared stable for MacVim as of this writing (not sure what issue is).gq}

*Note2!* `brew linkapps` will link MacVim into your Applications folder

CentOS install:

   TBD.

## TMUX

[Tmux][tmux] is a terminal multiplexer like [GNU Screen](https://www.gnu.org/software/screen/). It creates a persistent terminal
sessions (think Remote Desktop but for a text terminalis) and allows you to
create split and tabbed shells within one sessions. It works wonders together
with VIM for code development/debug.

I use tmux all the time (but mostly on a remote linix host) as a way to handle
all terminal and vim sessions I have running as well as dividing my work area
into sections. If you do development on a mac it also integrates with
[iTerm2][iterm2]. You can read morea about how by [following this
link](https://code.google.com/p/iterm2/wiki/TmuxIntegration).

Mac install:

```shell
   brew install tmux
```

CentOS install:

```shell
   sudo yum install tmux
```

## ZSH

I recently switched from bash to [zsh][zsh]. [Zsh][zsh] is a better shell for day to day
coding with better looks and smart tab completions (when configured). I hope to
dive into how I configure zsh later. I like to update to latest zsh on mac like
this.

Mac install/update:

```shell
   brew install zsh
```

CentOS install:

```shell
   sudo yum install zsh
```

## [Optional] Mosh

[Mosh][mosh] is a mobile/roaming shell that can be though of as a replacement
for SSH. The cool thing about it is that it's persistent even if you close the
lid on your laptop and/or switch networks. Once it can reconnect to it's
sessions (anyway it can) it will resume it. It's very convinent for laptops!
Downside is that it requires a [mosh][mosh] server to be running on the machine
you connect to. Mosh is easy to install on CentOS (`sudo yum install mosh`) but
also requires opening some ports in the firewall on the local machine. This
should not be an an issue since it's already behine a VPN of some sort.

Mac install:

```shell
   brew install mobile-shell
```

CentOS install:

```shell
   sudo yum install mosh
```

*Note!* I had to open specific ports when I installed mosh on CentOS to make
remote connections work. I didn't take notes but if I remember correctly mosh
told me the command to sudo run

At this point you have a fairly good set of tools to code within. Next let's
spend some time getting all the tools configured.

## Install [vimeda]

I have forked the excellent VIM distrubution [spf13] into a EDA specific
distrobution. Apart for being really well configured what I liked about spf13
is that it's dirt simple to install. On mac/linux simply run (and follow the
prompts):

```shell
    sh <(curl http://bit.ly/vimeda -L)>
```

This will download everything you need to have a great VIM session!

## Install [Oh-My-Zsh]

[Oh-My-Zsh] is another great distrobution to configure [zsh] into something
great. It also comes with a great installer so:

```shell
    curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
```

## Get/Link my misc dotfiles

Finally I need my own misc dotfiles to make life complete.

```shell
    git clone https://github.com/rekendahl/dotfiles.git .dotfiles
    ln -s ./ditfiles/.zshrc
    ln -s ./dotfiles/.tmux.conf
    ln -s ./dotfiles/.alias
    ln -s ./dotfiles/.gvimrc
    ln -s ./dotfiles/.bashrc
```

The shell setup files all use a .local_setup that needs to be recreated for each new site.

*DONE!*

[alfred]: http://www.alfredapp.com/
[iterm2]: http://www.iterm2.com/
[solarized]: http://ethanschoonover.com/solarized/
[sourcecodepro]: http://store1.adobe.com/cfusion/store/html/index.cfm?event=displayFontPackage&code=1960
[homebrew]: http://brew.sh/
[mosh]: http://mosh.mit.edu/
[tmux]: http://tmux.sourceforge.net/
[zsh]: http://www.zsh.org
[vim]: http://www.vim.org

[vim-spf13]: http://vim.spf13.com
[vimeda]: https://github.com/rekendahl/spf13-vimeda
[Oh-My-Zsh]: https://github.com/robbyrussell/oh-my-zsh

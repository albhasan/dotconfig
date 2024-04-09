# My dotfiles

This directory contains the dotfiles for my system.



## Requirements

Ensure you have the following installed on your system

### Git
```
$ apt install git
```

### Stow
```
$ apt install stow
```



## Instalation

First, check out the dotfiles repo in you $HOME directory using git:
```
$ git clone git@github.com/albhasan/dotconfig.git
```

Then, change to the cloned directory and use GNU stow to create symlinks:
```
$ stow -t /home/alber .
```



## References

- "Stow has forever changed the way I manage my dotfiles" by "Dreams of 
Autonomy" in i[youtube](https://youtu.be/y6XCebnB9gs?si=A-jaTzAPCM_Ta_e2)



# Ubuntu 22

sudo apt-get -y install \
    alsa-utils \
    build-essential \
    cowsay \
    exuberant-ctags \
    figlet \
    flatpak \
    fortune \
    git \
    keepassxc \
    libfuse-dev \
    lolcat \
    #neovim \
    tmux \
    tree \
    stow \
    wl-clipboard \
    xclip \
    x11-xkb-utils

mkdir -p ~/Documents/github
mkdir -p ~/Documents/software/appimage
cd ~/Documents/github/

git clone https://github.com/albhasan/dotconfig   ~/Documents/github/dotconfig
git clone https://github.com/k-takata/minpac.git  ~/Documents/github/minpac
git clone https://github.com/tmux-plugins/tpm.git ~/Documents/github/tpm

# Create symbolic links to config files.
mv ~/.bashrc ~/.bashrc_bk
stow -t /home/alber ~/Documents/github/dotconfig

# Install VIM's package manager.
mkdir -p ~/.vim/pack/minpac/opt
ln -s ~/Documents/github/minpac ~/.vim/pack/minpac/opt
# :call minpac#upate()

# Install TMUX package manager.
mkdir -p ~/.tmux/plugins
ln -s ~/Documents/github/tpm ~/.tmux/plugins
# Ctrl A + I
# Ctrl A + U

# Get latest NeoVim.
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage ~/Documents/software/appimage
ln -s ~/Documents/software/appimage/nvim.appimage ~/bin/nvim
# :Lazy
# U


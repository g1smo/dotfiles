#!/bin/sh

DIR=`pwd`
echo "DIR: $DIR"
ln -s $DIR/.zshrc ~/.zshrc

ln -s $DIR/.config/gtk-3.0 ~/.config/gtk-3.0

mkdir ~/.config/i3
ln -s $DIR/.config/i3/config ~/.config/i3/config

mkdir ~/.config/sway
ln -s $DIR/.config/sway/config ~/.config/sway/config

mkdir ~/.config/termite
ln -s $DIR/.config/termite/config ~/.config/termite/config

ln -s $DIR/.config/compton.conf ~/.config/compton.conf

ln -s $DIR/.config/redshift ~/.config/redshift

ln -s $DIR/.gtkrc-2.0 ~/.gtkrc-2.0

ln -s $DIR/.i3blocks.conf ~/.i3blocks.conf

mkdir ~/.local/rofi
ln -s $DIR/.local/rofi/config ~/.local/rofi/config

ln -s $DIR/.spacemacs ~/.spacemacs

ln -s $DIR/.vimrc ~/.vimrc

ln -s $DIR/.Xresources ~/.Xresources

ln -s $DIR/.zlogin ~/.zlogin

ln -s $DIR/.gitconfig ~/.gitconfig

ln -s $DIR/.profile ~/.profile
ln -s $DIR/.zprofile ~/.zprofile

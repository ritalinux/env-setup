#!/bin/bash
pkgs=(fuse curl git tmux)
pkgsApt=(libfuse2)
pkgsAur=(fuse2)

if [ -x "$(command -v pacman)" ];
then
    sudo pacman -Sy "${pkgs[@]}"
    sudo pacman -Sy "${pkgsAur[@]}"
elif [ -x "$(command -v apt)" ];
then
    sudo apt install -y "${pkgs[@]}"
    sudo apt install -y "${pkgsApt[@]}"
fi

rm -rf ~/.tmux/
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

curl -LO https://github.com/neovim/neovim/releases/download/v0.9.5/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/bin/nvim

rm -rf ~/nvim

rm -rf ~/.config/nvim
rm -rf ~/.config/tmux

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim

mkdir ~/.config/nvim

cp -v -r ./nvim/* ~/.config/nvim
cp -v -r ./tmux/tmux.conf ~/.tmux.conf


#!/bin/bash
pkgs=(fuse curl git tmux zsh)
pkgsApt=(libfuse2)
pkgsAur=(fuse2)

if [ -x "$(command -v pacman)" ];
then
    sudo pacman --noconfirm -Sy "${pkgs[@]}"
    sudo pacman --noconfirm -Sy "${pkgsAur[@]}"
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
cp -v -r ./bin/* ~/.local/bin

chmod u+x ~/.local/bin/tmux-sessionizer.sh
chmod u+x ~/.local/bin/tmux-nvim-file-to-panel.sh

curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" > /dev/null

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions > /dev/null

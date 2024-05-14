sudo apt-get install -y fuse libfuse2 curl git tmux

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

#!/usr/bin/env bash
# Install zsh and ohmyzsh
sudo rm -f /etc/zsh/zshenv
sudo mkdir -p /etc/zsh/
sudo cp ./configs/etc/zsh/zshenv /etc/zsh/
rm -rf $HOME/user/.oh-my-zsh/
rm -f $HOME/.zshrc* $HOME/.zcompdump* $HOME/.zsh_history* .lesshst
source /etc/zsh/zshenv
export ZDOTDIR=$HOME/.config/zsh
export ZSH=$HOME/.config/zsh/oh-my-zsh
rm -rf $HOME/.config/zsh
curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh > ohmyzsh-install.sh
chmod +x ohmyzsh-install.sh
./ohmyzsh-install.sh --unattended
rm -f ohmyzsh-install.sh
sudo chsh -s /usr/bin/zsh
rm -r $HOME/.zshrc*
cp -r ./configs/.config/zsh/ $HOME/.config/

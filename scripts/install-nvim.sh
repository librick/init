# Ensure that curl is installed and up to date
sudo apt-get update && sudo apt-get install -y curl
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
# Create directory with config settings
rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim
cp -r ./configs/.config/nvim $HOME/.config/
# Create directory for vim-plug plugins
rm -rf $HOME/.config/nvim/plugged
mkdir -p $HOME/.config/nvim/plugged
# Install vim-plug plugins via :PlugInstall command
nvim --headless +PlugInstall +qall


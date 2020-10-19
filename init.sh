EMAIL="wn2155@columbia.edu"

echo "Creating an SSH key for you..."
ssh-keygen -t rsa -b 4096 -C $EMAIL

echo "Please add this public key to Github (code pasted) \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."
pbcopy < ~/.ssh/id_rsa.pub

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "Installing im-select"
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone git://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone git://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting


echo "Copying dotfiles from Github"
cd ~
mkdir Code
cd Code
git clone https://github.com/wodeni/dotfiles.git
cd dotfiles
sh link.sh

echo "Iterm2 theme"
cd ~/Downloads
curl -O https://raw.githubusercontent.com/MartinSeeler/iterm2-material-design/master/material-design-colors.itermcolors

EMAIL="wn2155@columbia.edu"
CODE="~/Code"

# Install Mac Developer Tools
echo "Installing Xcode Developer Tools"
xcode-select --install

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


echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.oh-my-zsh/plugins/zsh-syntax-highlighting


echo "Copying dotfiles from Github"
mkdir ~/Code
git clone https://github.com/wodeni/dotfiles.git $Code/dotfiles
sh ./dotfiles/link.sh

echo "Link .zshrc"
ln -s $Code/dotfiles/zshrc ~/.zshrc

echo "Link .vimrc"
ln -s $Code/dotfiles/vimrc ~/.vimrc

echo "Link gitconfig"
ln -s $Code/dotfiles/gitconfig ~/.gitconfig

echo "Link Brewfile"
ln -s $Code/dotfiles/Brewfile ~/Brewfile

# Install all our dependencies with bundle (See Brewfile)
echo "Installing Homebrew dependencies"
brew bundle

# System tools

echo "Installing starship"
curl -sS https://starship.rs/install.sh | sh

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash


echo "Installing im-select"
curl -Ls https://raw.githubusercontent.com/daipeihust/im-select/master/install_mac.sh | sh

# Logins
echo "Login to GitHub"
gh auth login 
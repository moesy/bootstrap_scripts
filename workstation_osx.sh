cd ~/
xcode-select --install

# Install homebrew
echo “Installing Homebrew”
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install brew-cask



# Install utilities
echo “Installing OS Utilities”
brew install wget
brew install zsh zsh-completions
brew install tmux
brew install reattach-to-user-namespace

# Install the `teamocil` Ruby gem
gem install teamocil
mkdir ~/.teamocil

# Install iTerm
wget https://iterm2.com/downloads/stable/iTerm2-2_1_4.zip
tar -zxvf iTerm2-2_1_4.zip
rm -rf iTerm2-2_1_4.zip
mv iTerm.app /Applications

# Inastall OH-MY-ZSH
export ZSH="$HOME/.dotfiles/oh-my-zsh"; sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp wild-cherry.zsh-theme ~/.dotfiles/oh-my-zsh/themes/wild-cherry.zsh-theme
cp .zshrc ~/.zshrc

# Install atom.io
wget https://atom.io/download/mac -O atom.zip
tar -zxvf atom.zip
rm -rf atom.zip
mv Atom.app /Applications
apm install sync-settings


# Install Browsers
eco “Installing Browsers”
brew cask install google-chrome
brew install tor

# Install Slack
cho “Installing SLACK”
wget https://slack.com/ssb/download-osx -O slack.zip
tar -zxvf slack.zip
mv Slack.app /Applications
rm -rf slack.zip

# setup python
echo “Installing Python”
brew install python
pip install virtualenv
sudo pip install paramiko PyYAML Jinja2 httplib2 six

# Setup Vagrant
echo “Installing VirtualBox & Vagrant”
brew cask install virtualbox
brew cask install vagrant
brew cask install vagrant-manager
vagrant plugin install vagrant-hostsupdater


echo “Create sandbox directory if it does not exist”
mkdir ~/sandbox

echo “Installing Ansible”
git clone git://github.com/ansible/ansible.git --recursive
cd ./ansible | sudo make install | cd ~

echo "
# Todo
# - Install Nylus N1
# - Provide atom credentials
# - Install Atom Beta
# - Install MS Office
# - Install Tableau
# - Install Spotify
# - Migrate SSH Keys from a secure source"

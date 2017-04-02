sudo apt-get update -y
sudo apt-get install git
sudo apt install build-essential -y

sudo apt-get install emacs -y

echo "Configure shell and terminal utilities"
sudo apt-get install zsh -y
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sudo sh
sudo chsh -s $(which zsh) ubuntu
sudo chown ubuntu.ubuntu ~/.zshrc
curl -L https://iterm2.com/misc/install_shell_integration_and_utilities.sh | bash

echo "Installing Python 2.7"
sudo apt-get install -y python-pip python-dev
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
pip install flake8

echo "Installing Golang 1.8"
mkdir -p ~/go
sudo add-apt-repository ppa:longsleep/golang-backports -y
sudo apt-get update
sudo apt-get install golang-go -y
export GOPATH=/home/ubuntu/playground/go
export PATH=$PATH:$(go env GOPATH)/bin

echo "Heroku Toolbelt"
sudo add-apt-repository "deb https://cli-assets.heroku.com/branches/stable/apt ./"
curl -L https://cli-assets.heroku.com/apt/release.key | sudo apt-key add -
sudo apt-get update
sudo apt-get install heroku

echo "Google Cloud Platform utilities"
curl https://sdk.cloud.google.com | bash

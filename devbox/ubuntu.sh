sudo apt-get update -y

sudo apt-get install git

sudo apt install build-essential -y

sudo apt-get install emacs -y

echo "Installing zsh & oh-my-zsh"
sudo apt-get install zsh -y
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sudo sh
sudo chsh -s /bin/zsh

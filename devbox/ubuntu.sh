sudo apt-get update -y

sudo apt-get install git
sudo apt install build-essential checkinstall -y

sudo apt-get install zsh -y

# TODO: skip if already installed
sudo sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

sudo apt-get install emacs -y

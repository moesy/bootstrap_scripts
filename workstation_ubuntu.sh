mkdir -p ~/provision
cd ~/provision

sudo apt-get install dkms # Automatically reinstall drivers on kernel updates
sudo apt-get -f install
sudo apt-get install -y ruby-full -y

# Install Google Chrome
sudo apt-get install  -y libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

echo "Installing TOR"
sudo add-apt-repository -y "deb http://deb.torproject.org/torproject.org xenial main"
gpg --keyserver keys.gnupg.net --recv 886DDD89
gpg --export A3C4F0F979CAA22CDBA8F512EE8CBC9E886DDD89 | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install -y deb.torproject.org-keyring
sudo apt-get install -y tor

# echo "Installing TOR Browser"
# cd ~/Desktop
# wget https://www.torproject.org/dist/torbrowser/6.5a2/tor-browser-linux64-6.5a2_en-US.tar.xz | tar xvJf
# cd  ~/provision

# Atom.io
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update -y
sudo apt-get install -y atom

# Atom packages
apm install sync-settings

# Utilities
sudo apt-get install -y xclip

# Pip
sudo apt-get install -y python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv

# Install Vagrant & VirtualBox
sudo apt-get install -y virtualbox
sudo apt-get install -y vagrant
sudo apt-get install -y virtualbox-dkms

# Install Ansible
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Install Gnome Online Account
sudo apt install -y gnome-online-accounts

echo "Installing TMUX"
sudo apt-get install -y tmux

echo "Installing Teamocil"
sudo gem install -y teamocil
mkdir -p ~/.teamocil

echo "Installing FileZilla"
sudo apt-get install -y filezilla

echo "Installing Emacs"
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get update
sudo apt-get install -y emacs-snapshot

echo "Installing zsh"
sudo apt-get install -y zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh
sudo chsh -s "$(command -v zsh)" "${USER}"

sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev
sudo apt-get update

echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

apt-get install filezilla
sudo pip install ipython
sudo apt-get install mysql-workbench


echo "Installing awscli"
sudo pip install awscli

echo "Installing TensorFlow"
export TF_BINARY_URL=https://storage.googleapis.com/tensorflow/linux/gpu/tensorflow-0.11.0rc0-cp27-none-linux_x86_64.whl
sudo pip install --upgrade $TF_BINARY_URL

echo "Installing Terraform"
rm -rf ~/opt/terraform
sudo mkdir -p /opt/terraform/


echo '' >> .zshrc
echo '# Custom Binaries' >> ~/.zshrc
echo 'export PATH=$PATH:/opt/terraform' >> ~/.zshrc
cd /opt/terraform/
sudo wget https://releases.hashicorp.com/terraform/0.7.5/terraform_0.7.5_linux_amd64.zip
sudo unzip terraform_0.7.5_linux_amd64.zip
sudo rm -rf terraform_0.7.5_linux_amd64.zip


echo "Copying dot _files"
ln dot_files/init.el ~/.emacs.d/init.el

sudo apt-get install python-rope

echo "Don't forget to install Nylas N1, Slack, Gitter"

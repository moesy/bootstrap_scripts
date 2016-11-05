apt-get update
apt-get upgrade
apt-get install -y linux-headers-$(uname -r)


# Install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome*.deb

apt-get install -y emacs

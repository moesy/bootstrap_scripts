mkdir -p ~/provision
cd ~/provision

sudo apt-get install dkms # Automatically reinstall drivers on kernel updates
sudo apt-get -f install
sudo apt-get install -y ruby-full -y

# Atom.io
sudo add-apt-repository -y ppa:webupd8team/atom
sudo apt-get update -y
sudo apt-get install -y atom
apm install sync-settings

# Utilities
sudo apt-get install -y xclip

# Python
sudo apt-get install -y python-pip python-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade virtualenv
pip install flake8
sudo apt-get install -y build-essential libssl-dev libffi-dev python-dev

# Vagrant & VirtualBox
sudo apt-get install -y virtualbox
sudo apt-get install -y vagrant
sudo apt-get install -y virtualbox-dkms

# Ansible
sudo apt-get install -y software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

# Install Gnome Online Account
# sudo apt install -y gnome-online-accounts

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
echo '' >> .zshrc

echo "Installing Spotify"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys BBEBDCB318AD50EC6865090613B00F1FD2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client

echo "Database Ops"
sudo apt-get install mysql-workbench

echo "Installing awscli"
sudo pip install awscli

echo "Installing Bazel "
sudo apt-get install software-properties-common swig
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update
sudo apt-get install oracle-java8-installer
echo "deb http://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list
curl https://storage.googleapis.com/bazel-apt/doc/apt-key.pub.gpg | sudo apt-key add -
sudo apt-get update -y
sudo apt-get install -y bazel - See more at: http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html#sthash.sEIpTe5w.dpuf

echo "Installing Tensorflow"
rm -rf /opt/tensorflow/
git clone https://github.com/tensorflow/tensorflow /opt/tensorflow
cd /opt/trensorflow
git reset --hard 70de76e
./configure -y
bazel build -c opt --config=cuda //tensorflow/tools/pip_package:build_pip_package 
bazel-bin/tensorflow/tools/pip_package/build_pip_package /tmp/tensorflow_pkg - See more at: http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html#sthash.sEIpTe5w.dpuf
sudo pip install --upgrade /tmp/tensorflow_pkg/tensorflow-0.9.0-*.whl - See more at: http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html#sthash.sEIpTe5w.dpuf
sudo pip install --upgrade https://storage.googleapis.com/tensorflow/linux/cpu/protobuf-3.0.0b2.post2-cp27-none-linux_x86_64.whl - See more at: http://www.nvidia.com/object/gpu-accelerated-applications-tensorflow-installation.html#sthash.sEIpTe5w.dpuf


# echo "Installing Terraform"
#rm -rf ~/opt/terraform
#sudo mkdir -p /opt/terraform/
#echo '# Custom Binaries' >> ~/.zshrc
#echo 'export PATH=$PATH:/opt/terraform' >> ~/.zshrc
#cd /opt/terraform/
#sudo wget https://releases.hashicorp.com/terraform/0.7.5/terraform_0.7.5_linux_amd64.zip
#sudo unzip terraform_0.7.5_linux_amd64.zip
#sudo rm -rf terraform_0.7.5_linux_amd64.zip
#sudo apt-get install python-matplotlib

#echo "Copying dot _files"
# ln dot_files/init.el ~/.emacs.d/init.el


echo "Don't forget to install Nylas N1, Slack, Gitter"

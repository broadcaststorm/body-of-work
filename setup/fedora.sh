sudo hostnamectl set-hostname galen
sudo dnf update -y
sudo dnf install -y ruby
sudo dnf install -y git
sudo dnf groupinstall -y Development Tools

sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"

test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code
sudo dnf install -y nodejs
sudo dnf install -y snapd
sudo ln -s /var/lib/snapd/snap /snap
sudo snap install postman
sudo snap install ngrok
sudo dnf install -y https://download1.rpmfusion.org/free/fedora/releases/31/Everything/x86_64/os/Packages/r/rpmfusion-free-release-31-1.noarch.rpm
sudo dnf install -y VirtualBox python3-VirtualBox
sudo dnf install -y vagrant

# Anaconda
curl -o Anaconda3-2019.10-Linux-x86_64.sh https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh
bash Anaconda3-2019.10-Linux-x86_64.sh -b
eval "$(${HOME}/anaconda3/bin/conda shell.bash hook)"
conda init
echo 'eval "$(${HOME}/anaconda3/bin/conda shell.bash hook)"' >> .bash_profile
conda update conda
sudo dnf remove virtualbox-guest-additions
sudo dnf install -y akmod-VirtualBox kernel-devel-5.5.6-201.fc31.x86_64
sudo dnf update VirtualBox
# Docker
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/fedora/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io
# Fedora 31 needs cgroup change
sudo grubby --update-kernel=ALL --args="systemd.unified_cgroup_hierarchy=0"
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
brew install terraform

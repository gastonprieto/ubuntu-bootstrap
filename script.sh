#!/bin/bash

set -e

sudo apt update && sudo apt upgrade -y

export APPS=$HOME/apps
export ZSH_FILE=$HOME/.zshrc

mkdir -p $APPS

sudo apt-get install -y snapd && \
sudo apt-get install -y curl wget git

# Zsh
sudo apt-get install -y zsh autojump && \
chsh -s /usr/bin/zsh && \
mkdir -p $APPS/antigen && \
curl -L git.io/antigen > $APPS/antigen/antigen.zsh && \
wget -q https://gist.githubusercontent.com/gastonprieto/9fdf398cf680b1931f994ae853aa3867/raw/1e83ef6a73b3d3d43e3cc74db77f1f4ea51d775d -O $ZSH_FILE && \
echo "" >> $ZSH_FILE

# Apps
sudo apt-get install -y terminator && \
sudo apt-get install -y filezilla && \
sudo apt-get install -y simplescreenrecorder && \
sudo apt-get install -y tree && \
sudo apt-get install -y redshift redshift-gtk && \

sudo apt-get install -y ttf-mscorefonts-installer && \
sudo fc-cache -f -v && \

# Apps
snap install slack --classic 

# Development
sudo apt-get install -y neovim && \
sudo apt-get install -y meld && \
snap install sublime-text --classic && \
snap install code --classic

echo '#' >> $ZSH_FILE && \
echo '# Neovim' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'alias vim=nvim' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE

# C
sudo apt-get install -y build-essential make valgrind gdb

# GIT
sudo apt-get install -y git && \

wget -qO- https://gist.githubusercontent.com/gastonprieto/2369819/raw/2bae8194a26663da7383e09ff3b38cb18fc6586c/git_aliases.txt | sh && \
git config --global core.editor vim && \
git config --global diff.tool meld && \
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg && \
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null && \
sudo apt update && sudo apt install gh && \
gh auth login
    
#Python
sudo apt-get install -y python2

# Ruby
sudo apt-get install -y libssl-dev libreadline-dev zlib1g-dev && \
git clone https://github.com/rbenv/rbenv.git ~/.rbenv && \
cd ~/.rbenv && \
src/configure && \
make -C src && \
cd $APPS && \
echo '#' >> $ZSH_FILE && \
echo '# Ruby' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $ZSH_FILE && \
echo 'eval "$(rbenv init -)"' >> $ZSH_FILE && \
echo '' >> $$ZSH_FILE && \
source $ZSH_FILE && \
cd $APPS && \
git clone https://github.com/rbenv/ruby-build.git && \
sudo PREFIX=/usr/local ./ruby-build/install.sh && \
export RUBY_VERSION=2.4.2 && \
rbenv install $RUBY_VERSION && \
rbenv global $RUBY_VERSION && \
gem install compass bundler

#GO
snap install go --classic && \
gem install gas && \
gas add personal "Gaston Prieto" "prietogastonoscar@gmail.com" && \
gas add trabajo "Gaston Prieto" "gaston@producteca.com" && \
gas use personal

# NodeJS

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash && \
source $ZSH_FILE && \
nvm install node && \
nvm install 10 && \
nvm install 8 && \
nvm use node 

echo '#' >> $ZSH_FILE
echo '# nvm' >> $ZSH_FILE
echo '#' >> $ZSH_FILE
echo '' >> $ZSH_FILE
echo 'export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm' >> $ZSH_FILE

# Java
sudo apt install -y default-jdk openjdk-8-jdk

# Docker

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release && \
    
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \

echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null && \
  
sudo apt-get update &&  sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin && \

sudo groupadd docker && \
sudo usermod -aG docker $USER && \
newgrp docker && \
docker run hello-world


# Mongo-Client:
snap install robomongo

# Redis-Client
snap install redis-desktop-manager

# Kubectl

sudo apt-get update && \
sudo apt-get install -y apt-transport-https ca-certificates curl && \
cd $APPS && \
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

echo '#' >> $ZSH_FILE && \
echo '# kubectl' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'alias k=kubectl' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE

# Krew
(
  set -x; cd "$(mktemp -d)" &&
  OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
  ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
  KREW="krew-${OS}_${ARCH}" &&
  curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
  tar zxvf "${KREW}.tar.gz" &&
  ./"${KREW}" install krew
)

echo '#' >> $ZSH_FILE && \
echo '# Kubectl Krew' >> $ZSH_FILE && \
echo '#' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE && \
echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> $ZSH_FILE && \
echo '' >> $ZSH_FILE

kubectl krew install ctx ns allctx && \
kubectl krew install deprecations && \
kubectl krew install doctor && \
kubectl krew install grep && \

kubectl krew index add kvaps https://github.com/kvaps/krew-index && \
kubectl krew install kvaps/node-shell && \

kubectl krew install score && \
kubectl krew install snap && \

# AWS-CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install && \

aws configure

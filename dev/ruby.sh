#!/bin/bash

# Ruby

echo "Installing ruby..."

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

echo "Installed ruby"
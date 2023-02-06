#!/bin/bash

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

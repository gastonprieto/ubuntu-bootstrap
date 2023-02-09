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
echo "" > $ZSH_FILE
echo "autoload -U add-zsh-hook" >> $ZSH_FILE
echo "load-nvmrc() {" >> $ZSH_FILE
echo "  local nvmrc_path="$(nvm_find_nvmrc)"" >> $ZSH_FILE
echo "" >> $ZSH_FILE
echo "  if [ -n "$nvmrc_path" ]; then" >> $ZSH_FILE
echo "    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")" >> $ZSH_FILE
echo "" >> $ZSH_FILE
echo "    if [ "$nvmrc_node_version" = "N/A" ]; then" >> $ZSH_FILE
echo "      nvm install" >> $ZSH_FILE
echo "    elif [ "$nvmrc_node_version" != "$(nvm version)" ]; then" >> $ZSH_FILE
echo "      nvm use" >> $ZSH_FILE
echo "    fi" >> $ZSH_FILE
echo "  elif [ -n "$(PWD=$OLDPWD nvm_find_nvmrc)" ] && [ "$(nvm version)" != "$(nvm version default)" ]; then" >> $ZSH_FILE
echo "    echo "Reverting to nvm default version"" >> $ZSH_FILE
echo "    nvm use default" >> $ZSH_FILE
echo "  fi" >> $ZSH_FILE
echo "}" >> $ZSH_FILE
echo "add-zsh-hook chpwd load-nvmrc" >> $ZSH_FILE
echo "load-nvmrc" >> $ZSH_FILE
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
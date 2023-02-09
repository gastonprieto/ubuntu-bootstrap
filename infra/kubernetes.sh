#!/bin/bash

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
echo 'compdef __start_kubectl k' >> $ZSH_FILE && \ 
echo '' >> $ZSH_FILE

# Krew

cd "$(mktemp -d)" && \
OS="$(uname | tr '[:upper:]' '[:lower:]')" && \
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && \
KREW="krew-${OS}_${ARCH}" && \
curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && \
tar zxvf "${KREW}.tar.gz" && \
./"${KREW}" install krew

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
kubectl krew install snap

# Helm
HELM_DOWNLOAD_FILE=helm-v2.16.12-linux-amd64.tar.gz
HELM_DIRECTORY=helm-installation

cd $APPS && \
curl -O https://get.helm.sh/$HELM_DOWNLOAD_FILE && \
tar -zxvf $HELM_DOWNLOAD_FILE --directory=$HELM_DIRECTORY && \
ln -s $APPS/$HELM_DIRECTORY/linux-amd64/helm helm && \
rm -r $HELM_DOWNLOAD_FILE linux-amd64/

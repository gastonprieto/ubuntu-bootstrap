# AWS CLI

echo "Installing aws cli..."

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

aws configure

echo "Installed aws cli"
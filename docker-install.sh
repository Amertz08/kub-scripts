#!/usr/bin/env bash

# TODO: fingerprint check does not work
KEY="Key fingerprint = 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"

apt-get update
apt-get install -y \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
CHECK=$(apt-key fingerprint 0EBFCD88 | grep "Key fingerprint")
if [[ $CHECK == $KEY ]]; then
    echo "Valid fingerprint"
else
    echo "Invalid fingerprint"
fi

add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

apt-get update && apt-get install -y docker-ce
docker run hello-world # TODO: autocheck this work

wget https://gist.githubusercontent.com/Amertz08/6e7939162f6e36696704f48691ff098a/raw/8c8a44db091e11fb38863c0878dbb9b028280950/.docker-aliases
mv .docker-aliases ~/.docker-aliases
echo ". .docker-aliases" >> ~/.bashrc

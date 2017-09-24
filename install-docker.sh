#!/usr/bin/env bash

KEY="9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88"

apt-get update
apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
apt-key fingerprint 0EBFCD88 | grep KEY

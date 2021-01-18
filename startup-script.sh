#! /bin/bash

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose
sudo apt install git-all

sudo groupadd docker #might not be needed
sudo usermod -aG docker ${USER}  #might not be needed
##su -s ${USER}  -- i dont have password, so I just did sudo docker commands and works instead



cd /usr/bin

git clone https://github.com/PwC-Next/acuit-grafana-influxdb.git
## TODO needs username and password.  or maybe use gcp source repo.
cd acuit-grafana-influxdb
sudo docker run docker/compose:1.24.0 version

sudo docker run --rm \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v "$PWD:$PWD" \
    -w="$PWD" \
    docker/compose:1.24.0 up &
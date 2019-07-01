#!/bin/bash

echo $USER

if [ $(which docker 2>/dev/null) ]; then
  echo "docker present"
else
	sudo apt-get update -y
  sudo apt-get install docker.io -y 
fi

sudo usermod -a -G docker $USER

echo "Docker has been installed and its version is : "

sudo docker --version

sudo service docker start

sudo docker pull rhk12/nsfcareer:latest

sudo docker run -it -p 80:3000 rhk12/nsfcareer:latest

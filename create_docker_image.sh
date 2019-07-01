#!/bin/bash
#
INSTANCE="ubuntu"
#

echo "SCRIPT START TIME"
date

echo " -------------------------------------------------------------------"
echo " ----------                Instance Type                      ------"
echo " -------------------------------------------------------------------"
echo $INSTANCE
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
if [ "$INSTANCE" == "ami" ]; then
        UNAMEX="ec2-user"
elif [ "$INSTANCE" == "ubuntu" ]; then
        UNAMEX="ubuntu"
        HOME="/home/ubuntu"
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
echo " -------------------------------------------------------------------"
echo " ----------                   User Name                       ------"
echo " -------------------------------------------------------------------"
echo $UNAMEX
echo " -------------------------------------------------------------------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX

sudo apt-get update
sudo apt-get install docker.io -y
systemctl start docker
systemctl enable docker
# clone specific branch
#git clone -b minor-fixes https://github.com/PSUCompBio/aws-config.git
# clone master branch
git clone https://github.com/PSUCompBio/db-frontend-docker.git
cd db-frontend-docker/docker_scripts
docker build -t db-frontend .
cd /home/$UNAMEX
sudo chown -R ubuntu *

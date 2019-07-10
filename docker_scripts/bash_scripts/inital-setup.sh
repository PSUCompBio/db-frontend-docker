#!/bin/bash
#
# Set instance type
#INSTANCE="ami"
INSTANCE="ubuntu"
WEBSITENAME="web"
#
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
echo "Now in /home/$UNAMEX"
if [ "$INSTANCE" == "ami" ]; then
        sudo yum update -y
        sudo yum install -y git
        sudo yum install -y mesa-libGL
        sudo yum install -y mesa-libGL-devel
        sudo yum install -y mesa-libGLES
  sudo yum install -y mesa-libGLES-devel
  sudo yum install -y xorg-x11-server-Xvfb
  sudo yum groupinstall -y  "Development Tools"
elif [ "$INSTANCE" == "ubuntu" ]; then
        apt-get update -y
        apt-get install -y libgl1 libxt6 cmake-curses-gui xvfb nodejs npm freeglut3-dev libblas-dev liblapack-dev python3-pip autotools-dev automake libpcre3-dev bison byacc libfreetype6-dev pkg-config libfontconfig1-dev mdm
        apt-get install -y libxt6
        npm i -g npx
				apt-get install mesa-utils -y
				apt-get install flex -y
				apt-get install python-mako
				apt-get install z3 -y
else
        echo "Instance Type does not exist in config_bash script - please update it."
fi
echo "alias l='ls -ltr' " >> /home/$UNAMEX/.bash_profile
echo "alias h='history' " >> /home/$UNAMEX/.bash_profile
echo "alias python='python3' " >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
sleep 5
/usr/bin/ncpus
NCPUS_VAR=$(ncpus)
echo "ncpus = $NCPUS_VAR"
echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"

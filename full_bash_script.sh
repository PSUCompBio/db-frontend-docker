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

apt-get update -y
apt-get install -y libgl1 libxt6 cmake-curses-gui xvfb nodejs npm freeglut3-dev libblas-dev liblapack-dev python3-pip autotools-dev automake libpcre3-dev bison byacc libfreetype6-dev pkg-config libfontconfig1-dev mdm
apt-get install -y libxt6
npm i -g npx
apt-get install mesa-utils -y
apt-get install libtool -y
apt-get install flex -y
apt-get install python-mako -y
apt-get install z3 -y
apt-get install libdrm2 libdrm-intel1 libdrm-radeon1 libdrm-nouveau2 -y
apt-get install libxml2-dev libxml2 -y
apt-get install ocaml -y
apt-get install libomxil-bellagio-dev -y
apt-get install meson -y
apt-get install libpciaccess-dev -y

echo " -------------------------------------------------------------------"
echo " ----------       Finished Installing Essential Dev Tools     ------"
echo " -------------------------------------------------------------------"

cd /home/$UNAMEX
git clone https://github.com/swig/swig.git
cd swig
./autogen.sh
./configure
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------              Finished Installing Swig             ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
git clone https://github.com/Kitware/VTK
VTK_ROOT=/home/$UNAMEX/VTK
cd $VTK_ROOT
mkdir build
cd build
cmake ../ -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
make -j8
cd /home/$UNAMEX
echo "export LD_LIBRARY_PATH=$VTK_ROOT/build/bin:$VTK_ROOT/build/lib" >> /home/$UNAMEX/.bash_profile
echo "export VTK_ROOT=/home/$UNAMEX/VTK" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo $VTK_ROOT
echo " -------------------------------------------------------------------"
echo " ----------               Completed VTK Install                ------"
echo " -------------------------------------------------------------------"
source /home/$UNAMEX/.bash_profile
cd /home/$UNAMEX
echo $VTK_ROOT
git clone https://github.com/PSUCompBio/ProjectedTexture-VTK
cd ProjectedTexture-VTK
mkdir build
cd build
cmake .. -DVTK_DIR=$VTK_ROOT/build
make -j8
echo " -------------------------------------------------------------------"
echo " ----------       Completed ProjectedTexture Install          ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/db-frontend-docker
cp db-frontend-docker/docker_scripts/bash_scripts/bashrc /home/${UNAMEX}/.bashrc
echo " -------------------------------------------------------------------"
echo " ----------            Completed Assigning Permissions         ------"
echo " -------------------------------------------------------------------"
echo "Initiation script complete! See /var/log/cloud-init-output.log for install log." >> InstallComplete
cd /home/$UNAMEX
chown -R $UNAMEX .bash_profile
chown -R $UNAMEX *

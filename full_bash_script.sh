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
wget https://dri.freedesktop.org/libdrm/libdrm-2.4.99.tar.bz2
bunzip2 libdrm-2.4.99.tar.bz2
tar -xvf libdrm-2.4.99.tar
cd libdrm-2.4.99
mkdir build
cd build
../configure
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete libdrm 2.4.99 Install          ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
git clone https://github.com/llvm/llvm-project.git
cd llvm-project/llvm
mkdir build
cd build
cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr/local/llvm -DLLVM_BUILD_LLVM_DYLIB=ON -DLLVM_ENABLE_RTTI=ON -DLLVM_INSTALL_UTILS=ON -DLLVM_TARGETS_TO_BUILD:STRING=X86
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete LLVM Install                ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
git clone https://gitlab.freedesktop.org/mesa/mesa.git
cd mesa
mkdir build
cd build
../autogen.sh
../configure  --prefix=/usr/local/mesa --enable-opengl --disable-gles1 --disable-gles2 --disable-va --disable-xvmc --disable-vdpau --enable-shared-glapi --disable-texture-float --enable-gallium-llvm --enable-llvm-shared-libs  --with-gallium-drivers=swrast,swr  --disable-dri --with-dri-drivers= --disable-egl --with-egl-platforms= --disable-gbm --disable-glx --disable-osmesa --enable-gallium-osmesa --with-llvm-prefix=/usr/local/llvm --disable-llvm-shared-libs
make -j8
make install
echo " -------------------------------------------------------------------"
echo " ----------           Complete MESA Install                ------"
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
echo "export LD_LIBRARY_PATH=$VTK_ROOT/build/bin:$VTK_ROOT/build/lib:$LD_LIBRARY_PATH" >> /home/$UNAMEX/.bash_profile
echo "export VTK_ROOT=/home/$UNAMEX/VTK" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo $VTK_ROOT
echo " -------------------------------------------------------------------"
echo " ----------               Complete VTK Install                ------"
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
echo " ----------       Complete MergePolyData Install              ------"
echo " -------------------------------------------------------------------"
cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/db-frontend-docker
cp db-frontend-docker/docker_scripts/bash_scripts/bashrc /home/${UNAMEX}/.bashrc
echo " -------------------------------------------------------------------"
echo " ----------            Complete Assigning Permissions         ------"
echo " -------------------------------------------------------------------"
echo "Initiation script complete! See /var/log/cloud-init-output.log for install log." >> InstallComplete
cd /home/$UNAMEX
chown -R $UNAMEX *

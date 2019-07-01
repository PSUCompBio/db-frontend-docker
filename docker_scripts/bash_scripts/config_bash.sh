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
  sudo yum install
-y mesa-libGLES-devel
  sudo yum install -y xorg-x11-server-Xvfb
  sudo yum groupinstall -y  "Development Tools"
elif [ "$INSTANCE" == "ubuntu" ]; then
        sudo apt-get update -y
        sudo apt-get install -y libgl1 libxt6 build-essential cmake-curses-gui xvfb nodejs npm freeglut3-dev libblas-dev liblapack-dev openmpi-bin openmpi-common libopenmpi-dev python3-pip autotools-dev automake libpcre3-dev bison byacc libfreetype6-dev pkg-config libfontconfig1-dev mdm
        sudo apt-get install -y libxt6
        sudo npm i -g npx
        sudo pip3 install numpy matplotlib
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

cd /home/$UNAMEX
git clone https://github.com/swig/swig.git
cd swig
./autogen.sh
./configure
make -j8
sudo make install
echo " -------------------------------------------------------------------"
echo " ----------              Finished Installing Swig             ------"
echo " -------------------------------------------------------------------"
echo "------------SWIG END TIME---------------------"
date
echo "-----------------------------------"



cd /home/$UNAMEX
git clone https://github.com/tpaviot/oce.git
echo "-------------OCE CLONE FINISH TIME--------------------"
date
echo "-----------------------------------"



cd oce
mkdir build
cd build


echo "------------python oce make start---------------------"
date
echo "-----------------------------------"


cmake ..

make -j8
sudo make install

echo "-------------python oce make end--------------------"
date
echo "-----------------------------------"


echo "PATH=$PATH:/usr/local/bin" >> /home/$UNAMEX/.bash_profile
echo "export PATH" >> /home/$UNAMEX/.bash_profile
echo "export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Finished Installing OCE             ------"
echo " -------------------------------------------------------------------"
echo "-----------------OCE END TIME----------------"
date
echo "-----------------------------------"



cd /home/$UNAMEX
sleep 20
git clone https://github.com/PSUCompBio/pythonocc-core.git
if [ $? -eq 0 ]; then
  echo OK
else
  echo FAIL
        git clone git://github.com/PSUCompBio/pythonocc-core
fi


echo "-------------OCC CLONE FINISH TIME--------------------"
date
echo "-----------------------------------"


cd pythonocc-core
echo "-------------python occ build start--------------------"
date
echo "-----------------------------------"


mkdir build
cd build


echo "-------python occ cmake start-------------------------"
date
echo "-----------------------------------"


cmake .. -DPYTHONOCC_INSTALL_DIRECTORY:PATH=/usr/lib/python3.6/dist-packages/OCC
make -j8


echo "-------------python occ make install start--------------------"
date
echo "-----------------------------------"


sudo make install
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing Python OCC Core          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"


cd /home/$UNAMEX
# specify anaconda or miniconda
#CONDAVAR="miniconda"
#wget https://repo.continuum.io/miniconda/Miniconda-latest-Linux-x86_64.sh -O ~/$CONDAVAR.sh
# chmod +x Miniconda-latest-Linux-x86_64.sh
#./Miniconda-latest-Linux-x86_64.sh -b
# wget https://repo.continuum.io/archive/Anaconda2-4.1.1-Linux-x86_64.sh -O ~/$CONDAVAR.sh
#bash ~/$CONDAVAR.sh -b -p /home/$UNAMEX/$CONDAVAR
#echo "PATH=$PATH:/home/$UNAMEX/$CONDAVAR/bin" >> /home/$UNAMEX/.bash_profile
#echo "export PATH" >> /home/$UNAMEX/.bash_profile
#/home/$UNAMEX/$CONDAVAR/bin/conda install -y -c conda-forge -c dlr-sc -c pythonocc -c oce pythonocc-core==0.17 python=2.7
#echo " -------------------------------------------------------------------"
#echo " ----------      Finished Installing Anaconda and OCC         ------"
#echo " -------------------------------------------------------------------"
#apt install python3-pip

if [ "$INSTANCE" == "ami" ]; then
#       conda install anaconda vtk
#       /home/$UNAMEX/$CONDAVAR/bin/pip install vtk
        sudo pip3 install vtk
elif [ "$INSTANCE" == "ubuntu" ]; then
        #conda install anaconda vtk
        sudo pip3 install vtk
fi
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing VTK for python             ----"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"


cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/rbf-brain
git clone https://github.com/mathLab/PyGeM
cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install
sudo python3 setup.py install
#/home/$UNAMEX/$CONDAVAR/bin/pip install --upgrade pip
#/home/$UNAMEX/$CONDAVAR/bin/pip install runipy
#pip3 install runipy
cd /home/$UNAMEX
echo " -------------------------------------------------------------------"
echo " ----------         Finished Installing PyGem                 ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"



cp /home/$UNAMEX/rbf-brain/RBFfinal.ipynb /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/RBFfinal.py /home/$UNAMEX/PyGeM/tutorials/
cp /home/$UNAMEX/rbf-brain/initialmesh.vtk /home/$UNAMEX/PyGeM/tests/test_datasets/
cp /home/$UNAMEX/rbf-brain/parameters_rbf_custom.prm /home/$UNAMEX/PyGeM/tests/test_datasets/
echo " -------------------------------------------------------------------"
echo " ----------               Complete RBF Setup                  ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"


git clone https://github.com/PSUCompBio/vtk-image-write
cd vtk-image-write
sudo xvfb-run --server-args="-screen 0 1024x768x24" python3 write-image.py
echo " -------------------------------------------------------------------"
echo " ----------             Complete Image Write Test              ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"



cd /home/$UNAMEX
git clone https://github.com/Kitware/VTK
export VTK_ROOT=/home/$UNAMEX/VTK
cd $VTK_ROOT
mkdir build
cd build
cmake ../ -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE=Release
make -j8
cd /home/$UNAMEX
echo "export LD_LIBRARY_PATH=$VTK_ROOT/build/bin:$VTK_ROOT/build/lib:$LD_LIBRARY_PATH" >> /home/$UNAMEX/.bash_profile
source /home/$UNAMEX/.bash_profile
echo " -------------------------------------------------------------------"
echo " ----------               Complete VTK Install                ------"
echo " -------------------------------------------------------------------"
echo "---------------------------------"
date
echo "-----------------------------------"


cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/FemTech
cd FemTech
mkdir build
cd build
cmake .. -DEXAMPLES=ON -DEXAMPLE12=ON -DEXAMPLE7=ON -DEXAMPLE9=ON
make -j8
echo " -------------------------------------------------------------------"
echo " ----------           Complete FemTech Install                ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"



cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/MergePolyData
cd MergePolyData
mkdir build
cd build
cmake .. -DVTK_DIR=$VTK_ROOT/build
make -j8
echo " -------------------------------------------------------------------"
echo " ----------       Complete MergePolyData Install              ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"





cd /home/$UNAMEX
chown -R $UNAMEX *
echo " -------------------------------------------------------------------"
echo " ----------            Complete Assigning Permissions         ------"
echo " -------------------------------------------------------------------"
echo "Initiation script complete! See /var/log/cloud-init-output.log for install log." >> InstallComplete
chown -R $UNAMEX InstallComplete

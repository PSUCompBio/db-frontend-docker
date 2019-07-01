
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
make install

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

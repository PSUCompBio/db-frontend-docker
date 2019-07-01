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


make install
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing Python OCC Core          ------"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"

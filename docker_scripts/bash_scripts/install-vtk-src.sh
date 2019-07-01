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

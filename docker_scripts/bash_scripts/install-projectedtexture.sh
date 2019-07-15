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

echo "---------------------------------"
date
echo "-----------------------------------"

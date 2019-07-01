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

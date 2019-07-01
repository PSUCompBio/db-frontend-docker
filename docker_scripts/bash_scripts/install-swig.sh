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
echo "------------SWIG END TIME---------------------"
date
echo "-----------------------------------"

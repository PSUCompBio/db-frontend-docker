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
        pip3 install vtk
elif [ "$INSTANCE" == "ubuntu" ]; then
        #conda install anaconda vtk
        pip3 install vtk
fi
echo " -------------------------------------------------------------------"
echo " ----------      Finished Installing VTK for python             ----"
echo " -------------------------------------------------------------------"

echo "---------------------------------"
date
echo "-----------------------------------"

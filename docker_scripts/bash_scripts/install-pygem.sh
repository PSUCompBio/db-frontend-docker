cd /home/$UNAMEX
git clone https://github.com/PSUCompBio/rbf-brain
git clone https://github.com/mathLab/PyGeM
cp /home/$UNAMEX/rbf-brain/__init__.py /home/$UNAMEX/PyGeM/pygem
cd /home/$UNAMEX/PyGeM
#source /home/$UNAMEX/.bashrc
#/home/$UNAMEX/$CONDAVAR/bin/python2 setup.py install
python3 setup.py install
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

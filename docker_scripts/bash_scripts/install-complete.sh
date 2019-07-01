cd /home/$UNAMEX
chown -R $UNAMEX *
echo " -------------------------------------------------------------------"
echo " ----------            Complete Assigning Permissions         ------"
echo " -------------------------------------------------------------------"
echo "Initiation script complete! See /var/log/cloud-init-output.log for install log." >> InstallComplete
chown -R $UNAMEX InstallComplete

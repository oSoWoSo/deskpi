#!/bin/bash
# uninstall deskpi script 
. /lib/lsb/init-functions

daemonname="deskpid"
deskpidaemon=/etc/sv/$daemonname
safeshutdaemon=/etc/sv/$daemonname-safeshut

echo "Uninstalling DeskPi PWM Fan Control and Safeshut Service."
sleep 1
echo "Disable DeskPi PWM Fan Control and Safeshut Service."
echo "Remove dtoverlay configure from /boot/efi/config.txt file"
sudo sed -i '/dtoverlay=dwc2,dr_mode=host/d' /boot/efi/config.txt
echo "Stop and disable DeskPi services"
sudo sv disable $daemonname.service 2&>/dev/null  
sudo sv stop $daemonname.service  2&>/dev/null
sudo sv disable $daemonname-safeshut.service 2&>/dev/null
sudo sv stop $daemonname-safeshut.service 2&>/dev/null
echo "Remove DeskPi PWM Fan Control and Safeshut Service."
sudo rm -f  $deskpidaemon  2&>/dev/null 
sudo rm -f  $safeshutdaemon 2&>/dev/null 
sudo rm -f /usr/bin/fanStop 2&>/dev/null
sudo rm -f /usr/bin/pwmFanControl 2&>/dev/null 
sudo rm -f /usr/bin/deskpi-config 2&>/dev/null 
sudo rm -f /usr/bin/Deskpi-uninstall 2&>/dev/null 
log_success_msg "Uninstall DeskPi Driver Successfully." 

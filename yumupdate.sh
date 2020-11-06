#!/bin/bash

PKGS_TO_UPDATE=$(yum check-update --quiet | wc -l)

if [[ $PKGS_TO_UPDATE -gt 0 ]]; then
  

	echo "####################################################################"
        echo "###               Update Is Necessary                            ###"
        echo "###                                                              ###"
        echo "###    System updates will be applied in 3 minutes               ###"
        echo "###                                                              ###"
        echo "####################################################################"


	#sleep 120
	sleep 30
 
	sudo yum clean all
	sudo yum clean metadata
	
	echo "####################################################################"
	echo "###               Beginning Updates                              ###"
	echo "###                                                              ###"
	echo "### Please do not turn your system off until update is completed ###"
	echo "###                                                              ###"
	echo "####################################################################"

	sleep 30 

	RUNNING_KERNEL=$"(kernel-$(rpm -q kernel | tail -1 ))"

	sudo yum -y update  

	echo "####################################################################"
        echo "###               Update Completed                               ###"
        echo "###                                                              ###"
        echo "###      checking to see if there was a kernel update            ###"
        echo "### Your System will be restarted if there was a kernel Update   ###"
        echo "####################################################################"
	
	sleep 30

	#RUNNING_KERNEL=$"(kernel-$(uname -r))"
	#RUNNING_KERNEL=$"(kernel-$(rpm -q kernel ))"
	
        LASTEST_KERNEL=$(rpm -q kernel | tail -1)
	
	if [ $LASTEST_KERNEL != $RUNNING_KERNEL ]
 	then 
    		echo "system going down for reboot in 1 minute!"
		sleep 60
		sudo reboot
 	else 
    		echo "No Reboot Necessary, Enjoy Your Updated System!"
	fi
else
  	echo "No update Necessary, Enjoy Your Updated System"
fi

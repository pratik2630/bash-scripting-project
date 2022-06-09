#!/bin/bash
echo "Checking yum repolists"
sudo yum repolist

echo "========================================"
echo "installing httpd web server"
sudo yum install httpd -y

echo "========================================"
echo "Start and enable httpd service"
sudo systemctl start httpd
sudo systemctl enable httpd

echo "Httpd started and enabled sucessfully"
echo "========================================"

echo "Check status if it's showing running"
echo "press q to proceed"
sudo systemctl status httpd

echo "========================================"

echo "Copy test webpage"
sudo cp ./index.html /var/www/html
echo "test wabpage copied to document root folder sucessfully"
echo "========================================"

#(optional : uncommect this if you are running this script on vm and want to test webpage from base os)
#echo "Stop SElinux and firewalld to check webpage"
#sudo systemctl stop firewalld
#setenforce 0

# to get ip of system 
IP=$(hostname -I | cut -f1 -d' ')
echo "IP of your system is: "$IP

echo "========================================" 

echo "Check webpage through firefox"
firefox http://localhost/index.html  &

echo "webpage will open in firefox soon"


echo "Script completed , Thanks you!!"
echo "Give a star on github to show some support :) "
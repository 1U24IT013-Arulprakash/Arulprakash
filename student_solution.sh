#!/bin/bash

# SELinux Access Denial Practical
# Student Name:
# Register Number:

echo "===== SELinux Status ====="
getenforce
sestatus

echo "===== Creating Web Directory ====="
mkdir -p /var/www/selinux_test

echo "===== Creating HTML File ====="
echo "<html><body><h1>Hello SELinux</h1></body></html>" | sudo tee /var/www/html/index.html > /dev/null

echo "===== Setting Linux Permissions ====="
sudo chmod 644 /var/www/html/index.html
sudo chmod 755 /var/www/html

echo "===== Checking Initial Context ====="
ls -lZ /var/www/html/index.html


echo "===== Assigning Wrong SELinux Context ====="
sudo chcon -t user_home_t /var/www/html/index.html

echo "===== Checking Wrong Context ====="
ls -lZ /var/www/html/index.html

echo "===== Checking AVC Denials ====="
sudo chcon -t user_home_t /myweb/index.html

echo "===== Correcting SELinux Context ====="
sudo restorecon -v /myweb/index.html


echo "===== Checking Correct Context ====="
ls -lZ /var/www/html/index.html
echo "===== Practical Completed ====="

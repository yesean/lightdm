#!/bin/sh

echo -e "\e[36mBuilding lightdm-eh8"
echo -e "\e[0m"

npm install
rm -r dist/
sudo rm -r /usr/share/lightdm-webkit/themes/eh8/*
npm run-script build
pushd dist && tar zcvf ../lightdm-eh8.tar.gz ./* && popd
sudo mkdir -p /usr/share/lightdm-webkit/themes/eh8/
sudo mv lightdm-eh8.tar.gz /usr/share/lightdm-webkit/themes/eh8/ 
cd /usr/share/lightdm-webkit/themes/eh8/
sudo tar xvf lightdm-eh8.tar.gz
echo Done.

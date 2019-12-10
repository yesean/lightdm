#!/bin/sh

echo -e "\e[36mBuilding lightdm-eh8"
echo -e "\e[0m"

sudo rm -rf /usr/share/lightdm-webkit/themes/eh8/*
cp ~/Pictures/Wallpapers/background.png src/assets/images/
sudo cp src/assets/images/background.png /usr/share/backgrounds
sudo rm -r dist/
npm run-script build
pushd dist && tar zcvf ../lightdm-eh8.tar.gz ./* && popd
sudo mkdir -p /usr/share/lightdm-webkit/themes/eh8/
sudo mv lightdm-eh8.tar.gz /usr/share/lightdm-webkit/themes/eh8/ 
cd /usr/share/lightdm-webkit/themes/eh8/
sudo tar xvf lightdm-eh8.tar.gz
echo Done.

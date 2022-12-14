#!/bin/bash

echo -e "\e[36mBuilding lightdm-eh8"
echo -e "\e[0m"

themes_dir=/usr/share/web-greeter/themes/eh8/

echo "Removing old copy of LightDM theme..."
sudo rm -rf "$themes_dir"/*
echo "Done"

echo "Running Vue setup..."
sudo rm -r dist/
npm run-script build
echo "Done"

echo "Building directory..."
pushd dist && tar zcvf ../lightdm-eh8.tar.gz ./* && popd
sudo mkdir -p "$themes_dir"
sudo mv lightdm-eh8.tar.gz "$themes_dir"
echo "Done"

echo "Entering directory and running final decompression..."
cd "$themes_dir"
sudo tar xvf lightdm-eh8.tar.gz
echo "Done"

echo "All done!"

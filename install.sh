#!/bin/bash

echo -e "\e[36mBuilding lightdm-sean"
echo -e "\e[0m"

themes_dir=/usr/share/web-greeter/themes/sean

echo "Removing old copy of LightDM theme..."
sudo rm -rf "$themes_dir"/*
echo "Done"

echo "Running Vue setup..."
sudo rm -r dist/
npm run-script build
echo "Done"

echo "Building directory..."
pushd dist && tar zcvf ../lightdm-sean.tar.gz ./* && popd
sudo mkdir -p "$themes_dir"
sudo mv lightdm-sean.tar.gz "$themes_dir"
echo "Done"

echo "Entering directory and running final decompression..."
cd "$themes_dir"
sudo tar xvf lightdm-sean.tar.gz
echo "Done"

echo "All done!"

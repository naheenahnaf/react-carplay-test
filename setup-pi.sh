#!/bin/bash

#Set path to copy appimage and autolaunch location
path="/home/$USER/Desktop/Carplay.AppImage"

#create udev rule thats specific to carlinkit device
echo "Creating udev rules"

FILE=/etc/udev/rules.d/52-nodecarplay.rules
echo "SUBSYSTEM==\"usb\", ATTR{idVendor}==\"1314\", ATTR{idProduct}==\"152*\", MODE=\"0660\", GROUP=\"plugdev\"" | sudo tee $FILE

if [[ $? -eq 0 ]]; then
	echo -e Permissions created'\n'
    else
	echo -e Unable to create permissions'\n'
fi

echo "Downloading AppImage"

if getconf LONG_BIT | grep -q '64'; then
	echo "64 Bit Detected"
 	curl -L https://github.com/rhysmorgan134/react-carplay/releases/download/v3.0.2/ReactCarplay-3.0.2-arm64.AppImage --output /home/$USER/Desktop/Carplay.AppImage
else
	echo "32 Bit Detected"
 	curl -L https://github.com/rhysmorgan134/react-carplay/releases/download/v3.0.1/ReactCarplay-3.0.1-armv7l.AppImage --output /home/$USER/Desktop/Carplay.AppImage

echo "Download Done"

echo "Creating executable"
sudo chmod +x /home/$USER/Desktop/Carplay.AppImage

echo "Creating Autostart File"

sudo bash -c "echo '[Desktop Entry]
Name=File Manager
Exec=/home/$USER/Desktop/Carplay.AppImage
Type=Application' > /etc/xdg/autostart/carplay.desktop"

echo "All Done"


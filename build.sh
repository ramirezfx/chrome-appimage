#!/bin/bash
DIST=kinetic
WORKDIR=google-chrome-stable
# Cleanup
rm -Rf $WORKDIR
rm chrome.yml
rm pkg2appimage-1807-x86_64.AppImage
rm -Rf out
rm google-chrome-stable_current_amd64.deb
rm google-chrome-latest.Appimage

# Build AppImage:
cp chrome.yml.template chrome.yml
sed -i "s/DIST/$DIST/g" "chrome.yml"
# wget https://mega.nz/linux/MEGAsync/xUbuntu_20.04/amd64/megasync_4.5.3-2.1_amd64.deb
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome-stable_current_amd64.deb
wget https://github.com/AppImage/pkg2appimage/releases/download/continuous/pkg2appimage-1807-x86_64.AppImage
chmod 700 pkg2appimage-1807-x86_64.AppImage
./pkg2appimage-1807-x86_64.AppImage chrome.yml
cd out
CHROMENAME=$(ls Google*)
mv $CHROMENAME google-chrome-latest.Appimage
mv google-chrome-latest.Appimage ..
cd ..
#Cleanup
rm -Rf out
rm -Rf $WORKDIR
rm chrome.yml
rm pkg2appimage-1807-x86_64.AppImage
rm google-chrome-stable_current_amd64.deb

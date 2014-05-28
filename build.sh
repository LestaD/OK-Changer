#!/bin/bash
clear
echo ''
echo '[=- Chrome Extension Building -=]'
version=$1
zipname="okchanger_$version-chrome.zip"
dir=$DIRSTACK
if [[ -z $version ]]
then
echo "Error: hasn't set version"
echo "Example:"
echo "        ./build.sh 1.0.0.1"
exit 1
fi


echo "Version: $version"
echo "Directory: $dir"

#remove old code
rm -fr build/chrome

#create folder & copy source
mkdir -p build/chrome
cp -r ./source/* ./build/chrome

echo 'Source copy...'

# copy manifest
cp -f "./build/chrome-manifest.json" "./build/chrome/manifest.json"


# replace manifest version
sed -i "s/0.0.0.0/$version/" build/chrome/manifest.json


# remove exiting archive
rm -f "./release/$zipname"

# archive
zip -r "./release/$zipname" "./build/chrome/"

echo "File: $dir/release/$zipname"
echo '[=- OK Changer build successful -=]'


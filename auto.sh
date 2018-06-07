#!/bin/bash

echo "!!!!autotool!!!!"
cd .repo
if [ -d "local_manifests" ]
then
echo "folder exist"
else
mkdir local_manifests
fi
cd local_manifests
if [ -e local_manifest.xml ]
then
echo "local_manifest.xml exist"
else
fgrep -e darwin -e intel -e device ../manifest.xml > temp.txt
cut -d ' ' -f 5 temp.txt > temp2.txt
fi
rm temp.txt
sed '1i<?xml version="1.0" encoding="UTF-8"?>' temp2.txt > temp3.txt && sed '2i<manifest>' temp3.txt > local_manifest.xml
rm temp2.txt temp3.txt

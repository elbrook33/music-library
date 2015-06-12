#!/bin/bash

Folder=~/.cache/music-library-index

for Path in $Folder/*
do
Image=`find "$Path" -name ".cover-image.png"`;

if [ "$Image" ];
then gvfs-set-attribute -t string "$Path" metadata::custom-icon "file://$Image";
fi;

done

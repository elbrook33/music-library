#!/bin/bash

Source=~/.cache/music-library-metadata
Folder=~/.cache/music-library-index

######################################################################
## Read all metadata files and organize them into folders and files ##
######################################################################

for File in $Source/*
do

if ! test -s $File; then continue; fi; # Ignore empty files

filename=\
`grep "filename=" $File | sed "s/^.*=//"i`;

title=`grep "title=" $File | sed "s/^.*=//" | sed "s/^ *//" | sed "s/ *$//" | sed "s/\//—/g"`;

if ! [ "$title" ];
then title=`echo $filename | sed "s/.*\///g"`;
fi;

track=`grep "track=" $File | sed "s/^.*=//" | sed "s/^ *//" | sed "s/ *$//" | sed "s/\/.*//"`;

album=`grep "album=" $File | sed "s/^.*=//" | sed "s/^ *//" | sed "s/ *$//" | sed "s/\//—/g"`;

album_artist=`grep "album_artist=" $File | sed "s/^.*=//" | sed "s/^ *//" | sed "s/ *$//" | sed "s/\//—/g"`;

if ! [ "$album_artist" ];
then album_artist=`grep "artist=" $File | sed "s/^.*=//" | sed "s/^ *//" | sed "s/ *$//" | sed "s/\//—/g"`;
fi;

if ! test -d "$Folder/$album_artist – $album";
then mkdir -p "$Folder/$album_artist – $album";
fi;

if [ "$track" ];
then Name="$track $title";
else Name="$title";
fi;

Root="$Folder/$album_artist – $album";
Player=~/.local/bin/music-player.rb;

Command="
[Desktop Entry]
Name=$Name
Exec=$Player \"$filename\" \"$Root/$Name\"
Icon=$Root/.cover-image.png
Type=Application
"

echo "$Command" > "$Root/$Name.desktop"
chmod +x "$Root/$Name.desktop"

done

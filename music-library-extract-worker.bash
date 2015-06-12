#!/bin/bash

Folder=~/.cache/music-library-metadata
if ! test -d $Folder; then mkdir -p $Folder; fi

Path=$1
Name=`echo $Path | sed "s/[ \/]/_/g"`.txt

if ! test -s $Folder/$Name;
then ffprobe -show_format -loglevel quiet "$Path" > $Folder/$Name;
fi

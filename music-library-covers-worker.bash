#!/bin/bash

Folder=~/.cache/music-library-index
Title=$1

if test -s "$Folder/$Title/.cover-image.png"; then exit; fi

Artist=`echo $Title | sed "s/ – .*$//"`
 Album=`echo $Title | sed "s/^.* – //"`

glyrc cover --artist "$Artist" --album "$Album" --write "$Folder/$Title/.cover-image.:format:"
convert "$Folder/$Title/.cover-image."* "$Folder/$Title/.cover-image.png"

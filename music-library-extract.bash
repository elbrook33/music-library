#!/bin/bash

Folder=~/Music
File=~/.cache/music-library-files.txt

find $Folder -name "*.mp3" > $File
find $Folder -name "*.m4a" >> $File

cat $File | parallel -j 10 --bar ./music-library-extract-worker.bash

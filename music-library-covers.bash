#!/bin/bash

Folder=~/.cache/music-library-index
ls $Folder | parallel -j 40 ./music-library-covers-worker.bash

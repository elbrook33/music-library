#!/bin/bash

echo "Finding all music files and extracting metadata..."
./music-library-extract.bash

echo "Organizing library..."
./music-library-organize.bash

echo "Downloading album covers..."
./music-library-covers.bash

echo "Applying cover images..."
./music-library-set-icons.bash


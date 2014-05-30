#!/bin/sh

# builds all needed files

curr_dir=`pwd`

dir=`dirname $0`
FILE_PATH=`cd  $dir;pwd`

echo "building atommapper"
ATOMMAPPERPATH=$FILE_PATH/atommapper
javac -d $ATOMMAPPERPATH/bin -cp $ATOMMAPPERPATH/src/mapper/ \
-sourcepath $ATOMMAPPERPATH/src $ATOMMAPPERPATH/src/Mapper2000.java

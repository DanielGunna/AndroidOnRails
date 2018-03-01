#!/bin/sh

CURRENT_DIRECTORY=$PWD
cd $ANDROID_HOME/tools/
./android create project \
    --gradle \
    --gradle-version 0.11.+ \
    --activity $1 \
    --package $2 \
    --target $3 \
    --path $CURRENT_DIRECTORY/$4
cd $CURRENT_DIRECTORY
exit 0

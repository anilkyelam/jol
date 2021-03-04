#!/bin/bash

#
# Builds jol library and/or install them locally
#

usage="\n
-c, --clean \t issue a clean build\n
-i, --install \t install to local mvn cache\n
-h, --help \t this usage information message\n"

# Defaults
ACTION="package"

# Parse command line arguments
for i in "$@"
do
case $i in
    -c | --clean)  
    CLEAN="clean"
    ;;
    
    -i | --install)  
    ACTION="install"
    ;;

    -h | --help)
    echo -e $usage
    exit
    ;;

    *)                  # unknown option
    echo "Unkown Option: $i"
    echo -e $usage
    exit
    ;;
esac
done


dir=$(dirname "$0")
dir=$(realpath "$dir")

# Build jol
pushd "$dir"
mvn -DskipTests $CLEAN $ACTION 
popd


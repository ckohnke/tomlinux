#!/bin/bash

# usage
usage()
{
    echo "    usage: install.sh [[TOM file to extract and install]]"
    exit
}


# get command line arguement (zip or msi file)
if [ "$1" != "" ]; then
  fn=$1
  echo 'extracting file:' $fn
else
  usage
fi

zip=0
msi=0
if [[ $fn == *".msi" ]]; then
  msi=1
  echo "msi file detected! Unsupported."
  usage
fi
if [[ $fn == *".zip" ]]; then
  zip=1
  echo "zip archive detected! Extracting."
fi


# Check dependencies
#echo installing the must-have pre-requisites
#while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
#    zip unzip
#EOF
#)

# extract zip or msi to a temp directory

# Grab the jars

# Move jars to a directory (default: /usr/share/tom)

# delete temp directory

# Create a command in the PATH to launch (default: /usr/bin/tom)
# java -jar pathtojars/TOM.jar

# Cleanup


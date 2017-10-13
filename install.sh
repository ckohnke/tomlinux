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
  echo "msi file detected! Please use the .zip installer."
  usage
fi
if [[ $fn == *".zip" ]]; then
  zip=1
  echo "zip archive detected!"
fi

if [ $msi == 0 ] && [ $zip == 0 ]; then
  echo "ERROR: Unable to determine input filetype."
  usage  
fi

# Check dependencies
# echo installing the must-have pre-requisites
#while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
#    zip unzip
#EOF
#)

# extract zip or msi to a temp directory
echo "ERROR: Unzipping the archive."
unzip $fn -d -q temp

# Grab the jars
# Move jars to a directory (default: /usr/share/TOM)
tomdir='/usr/share/TOM/'
echo -n "Enter the install location of the TOM jar files [/usr/share/TOM]: "
read newdir
if [[ $newdir != '' ]]; then
  tomdir=$newdir
fi

echo $tomdir

exedir='/usr/bin/'
echo -n "Enter the executable path [/usr/bin/]: "
read newdir
if [[ $newdir != '' ]]; then
  exedir=$newdir
fi

echo $exedir

echo "Moving jar files and creating executable."

mkdir -p $tomdir
if [ $zip == 1 ]; then
  find . -name '*.jar' | xargs -i cp -p '{}' $tomdir
fi

# java -jar pathtojars/TOM.jar
touch $exedir/tom_pkmn
cat > $exedir/tom_pkmn << EOL
#!/bin/bash
java -jar ${tomdir}/TOM.jar
EOL
chmod +x $exedir/tom_pkmn

# delete temp directory
echo "Cleaning up temp file."
rm -rf temp

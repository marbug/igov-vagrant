#!/bin/bash

vNodeDir="/vagrant/install/node"
vTempDir="/tmp/igov"

set -e

echo "Checking presence of" $vNodeDir "..."
if [ ! -d $vNodeDir ]; then
  echo $vNodeDir "is absent"
  exit 1
fi

echo "Going to" $vNodeDir "..."
cd $vNodeDir

vArchiveFile=`ls -1 node*.tar.gz | tail -1`
echo "Node file name:" $vArchiveFile

# TODO: error if no file

echo "Prepareing" $vTempDir "..."
rm -fR $vTempDir
mkdir -p $vTempDir

echo "Copying" $vArchiveFile "to" $vTempDir "..."
cp $vArchiveFile $vTempDir

echo "Going to" $vTempDir
cd $vTempDir

echo "Extracting" $vArchiveFile "..."
tar xfz $vArchiveFile

vArchiveDir=`ls -1 | grep -v $vArchiveFile`
echo "Node dir name:" $vArchiveDir

# TODO: error if no dir

echo "Going to" $vArchiveDir
cd $vArchiveDir

echo "Archive content:"
ls -l

echo "Copying bin dir ..."
sudo cp -r ./bin/* /bin/

echo "Copying lib dir ..."
sudo cp -r ./lib/* /lib/

echo "Checking version of node ..."
node -v

# TODO: enhance

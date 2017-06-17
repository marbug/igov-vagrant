#!/bin/bash

echo "Running " $0 "..."

set -e

vRootDir=`dirname $0`
echo "Working dir: " $vRootDir

cd $vRootDir

./scripts/install-node.sh

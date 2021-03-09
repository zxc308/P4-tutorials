#! /bin/bash

# To reduce disk space used by the virtual machine, delete many build
# files created during execution of root-bootstrap.sh and
# user-bootstrap.sh scripts.

# This script is _not_ automatically run during creation of the VM, so
# that if anything goes wrong during the build, all of the resulting
# files are left behind for examination.

DF1_BEFORE=`df -h .`
DF2_BEFORE=`df -BM .`

cd protobuf
make clean
cd ..

cd grpc
make clean
cd ..

cd behavioral-model
make clean
cd ..

cd p4c
/bin/rm -fr build
cd ..

/bin/rm usr-local-*.txt pip3-list-2b-*.txt

sudo apt autoremove
sudo apt clean

echo "Disk usage before running this script:"
echo "$DF1_BEFORE"
echo "$DF2_BEFORE"

echo ""
echo "Disk usage after running this script:"
df -h .
df -BM .

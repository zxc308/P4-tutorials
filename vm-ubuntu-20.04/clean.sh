#! /bin/bash

# To reduce disk space used by the virtual machine, delete many build
# files created during execution of root-bootstrap.sh and
# user-bootstrap.sh scripts.

# This script is _not_ automatically run during creation of the VM, so
# that if anything goes wrong during the build, all of the resulting
# files are left behind for examination.

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

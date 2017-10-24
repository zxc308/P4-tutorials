#!/bin/bash

set -x

# Bmv2
git clone https://github.com/p4lang/behavioral-model
cd behavioral-model
./install_deps.sh
./autogen.sh
./configure
make
sudo make install
cd ..

# Protobuf
git clone https://github.com/google/protobuf.git
cd protobuf
git checkout v3.0.2
./autogen.sh
./configure
make
sudo make install
sudo ldconfig
cd ..

# P4C
git clone --recursive https://github.com/p4lang/p4c
cd p4c
mkdir build
cd build
cmake ..
make -j4
sudo make install
cd ..
cd ..

# Tutorials
pip install crcmod
sudo runuser -l p4 -c "git clone https://github.com/p4lang/tutorials tutorials"

# Emacs
sudo cp p4_16-mode.el /usr/share/emacs/site-lisp/
sudo runuser -l p4 -c "echo \"(add-to-list 'auto-mode-alist '(\"\\.p4\\'\" . p4_16-mode))\" 
>> /home/p4/.emacs"

# Vim
sudo su p4
mkdir -p /home/p4/.vim/ftdetect
mkdir -p /home/p4/.vim/syntax
echo 'au BufRead,BufNewFile \*.p4      set filetype=p4' >> /home/p4/.vim/ftdetect/p4.vim
cp p4.vim /home/p4/.vim/syntax/
exit

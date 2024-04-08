# Introduction

This directory is still here only for historical reference.  The
scripts here can be used to create a VM image based on Ubuntu 16.04
Linux, but free support and updates for that version of Ubuntu Linux
ended in April 2021.  The VM created by these scripts also rely upon
and install Python2 versions of several Python libraries, which the
latest version of the tutorials repository no longer uses.

See the  `vm-ubuntu-20.04` [directory](../vm-ubuntu-20.04) for similar scripts that can be
used to create a VM image based on Ubuntu 20.04 Linux, and uses only
Python3.

## Table of contents
- [vm](../vm)
  - [Vagrantfile](../vm/Vagrantfile)
  - [P4.vim](../vm/p4.vim)
  - [P4-logo.png](../vm/p4-logo.png)
  - [P4_16-model.el](../vm/P4_16-model.el)
  - [root-bootstrap.sh](../vm/root-bootstrap.sh)
  - [user-bootstrap.sh](../vm/user-bootstrap.sh)

### Vagrantfile

This Ruby script utilizes Vagrant to configure a VirtualBox virtual machine named "p4-tutorial" with an Ubuntu 16.04 box. The machine is set to have a GUI, 2048 MB of memory, and 2 CPUs. Additionally, it provisions several files (p4-logo.png, p4_16-mode.el, p4.vim) to specific destinations within the virtual machine and executes two shell scripts (root-bootstrap.sh and user-bootstrap.sh) for system setup.

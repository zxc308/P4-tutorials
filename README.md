# P4 Tutorial

## Introduction

Welcome to the SIGCOMM 2019 P4 Tutorial! We've prepared a few exercises
to help you refine your P4 programming skills. These exercises are
organized into two sections:

1. Introduction and Language Basics
* [Basic Forwarding](./exercises/basic)

2. Stateful Packet Processing
* [Firewall](./exercises/firewall)
* [Link Monitoring](./exercises/link_monitor)

## Presentation

A P4 cheat sheet as well as introductory P4 language slides are available
in PDF format in the same directory as this README file.
        
## Virtual Machine Installation

We will use a virtual machine to run the exercises listed above. We ask
that you please try to install the VM *before* arriving at the tutorial.
We do not want to spend too much time setting up everyone's environment
because we prefer to spend the time helping you to learn P4 :)

### System Requirements

> The current configuration of the VM is 2 GB of RAM and 2 CPUs. These are
> the recommended minimum system requirements to complete the exercises.
> When imported, the VM takes approximately 8 GB of disk space. For the best
> experience, we recommend running the VM on a host system that has at least
> twice as many resources.

To install the VM, you have two options (1) directly download the VM image
and import it into your virtualization software, or (2) build the VM
yourself.

### Option 1 - Download the VM Image

#### Download the required software

* Install [VirtualBox](https://virtualbox.org)

#### Download the Image

* If you are outside China download the image from [here](http://stanford.edu/~sibanez/docs/)
* If you are inside China dowload the image from [here](http://58.213.119.23:8899/)

#### Import the image into VirtualBox

* See [here](https://docs.oracle.com/cd/E26217_01/E26796/html/qs-import-vm.html) for
instructions on how to import the image.

### Option 2 - Build the VM Yourself

#### Download the required software

* Install [VirtualBox](https://virtualbox.org)
* Install [Vagrant](https://vagrantup.com)

#### Build the VM

* Clone this repository onto your laptop and run `vagrant up`:
```
$ git clone -b sigcomm19 --single-branch https://github.com/p4lang/tutorials
$ cd tutorials/vm
$ vagrant up
```
* Log in with username `p4` and password `p4` and issue the command `sudo shutdown -r now`
* When the machine reboots, you should have a graphical desktop machine with the required
software pre-installed.

*Note*: Before running the `vagrant up` command, make sure you have enabled virtualization in your environment; otherwise you may get a "VT-x is disabled in the BIOS for both all CPU modes" error. Check [this](https://stackoverflow.com/questions/33304393/vt-x-is-disabled-in-the-bios-for-both-all-cpu-modes-verr-vmx-msr-all-vmx-disabl) for enabling it in virtualbox and/or BIOS for different system configurations.

You will need the script to execute to completion before you can see the `p4` login on your virtual machine's GUI. In some cases, the `vagrant up` command brings up only the default `vagrant` login with the password `vagrant`. Dependencies may or may not have been installed for you to proceed with running P4 programs. Please refer the [existing issues](https://github.com/p4lang/tutorials/issues) to help fix your problem or create a new one if your specific problem isn't addressed there.

### Option 3 - Procrastinate (NOT RECOMMENDED)

If you do arrive at the tutorial and have not yet installed the VM,
the instructors will have some USB sticks with a copy of the image.
Please ask an instructor for one of these USB sticks so you can copy
the image onto your laptop. Please return the USB to the instructor
after you have copied the image. We do not have enough for everyone.


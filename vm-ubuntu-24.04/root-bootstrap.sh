#!/bin/bash

# Print commands and exit on errors
set -xe

# Other editors some people might like to use, but let them install
# this software themselves if they prefer them:
# VSCode

apt-get update

KERNEL=$(uname -r)
DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade
apt-get install -y --no-install-recommends --fix-missing\
  git \
  linux-headers-$KERNEL \
  ubuntu-desktop-minimal \
  vim

# These are probably installed by install-p4dev-v8.sh script, probably
# because they are a dependency of something else that script does
# explicitly install.

#  libboost-filesystem-dev \
#  libboost-program-options-dev \
#  libboost-test-dev \
#  libevent-dev \
#  libffi-dev \
#  libjudy-dev \
#  python3-dev \
#  python3-setuptools \

# Are these needed to be installed?  Try it without installing them.

#  ca-certificates \
#  emacs \
#  iproute2 \
#  libpcap-dev \
#  libpython3-dev \
#  tcpdump \
#  wget \
#  xterm \
#  xcscope-el \

# Add user account named 'p4'
useradd -m -d /home/p4 -s /bin/bash p4
echo "p4:p4" | chpasswd
echo "p4 ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/99_p4
chmod 440 /etc/sudoers.d/99_p4
usermod -aG vboxsf p4

# Note that a system installed starting similar to Ubuntu Server, and
# than the package ubuntu-desktop-minimal is installed, might end up
# with two different system services running on it, which can
# significantly increase the boot time, e.g. by 2 minutes.

# + https://askubuntu.com/questions/1217252/boot-process-hangs-at-systemd-networkd-wait-online/1501504#1501504

sudo systemctl disable systemd-networkd.service

# Do this last!
sudo reboot

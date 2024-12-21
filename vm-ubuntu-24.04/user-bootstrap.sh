#!/bin/bash

# Remember the current directory when the script was started:
INSTALL_DIR="${PWD}"

THIS_SCRIPT_FILE_MAYBE_RELATIVE="$0"
THIS_SCRIPT_DIR_MAYBE_RELATIVE="${THIS_SCRIPT_FILE_MAYBE_RELATIVE%/*}"
THIS_SCRIPT_DIR_ABSOLUTE=`readlink -f "${THIS_SCRIPT_DIR_MAYBE_RELATIVE}"`

# Print script commands and exit on errors.
set -xe

# --- Emacs --- #
sudo cp ${THIS_SCRIPT_DIR_ABSOLUTE}/p4_16-mode.el /usr/share/emacs/site-lisp/
mkdir -p $HOME/.emacs.d/
echo "(autoload 'p4_16-mode' \"p4_16-mode.el\" \"P4 Syntax.\" t)" > init.el
echo "(add-to-list 'auto-mode-alist '(\"\\.p4\\'\" . p4_16-mode))" | tee -a init.el
mv init.el $HOME/.emacs.d/
ln -s /usr/share/emacs/site-lisp/p4_16-mode.el $HOME/.emacs.d/p4_16-mode.el

# --- Vim --- #
cd ~
mkdir -p .vim
cd .vim
mkdir -p ftdetect
mkdir -p syntax
echo "au BufRead,BufNewFile *.p4      set filetype=p4" >> ftdetect/p4.vim
echo "set bg=dark" >> ~/.vimrc
cp ${THIS_SCRIPT_DIR_ABSOLUTE}/p4.vim syntax/p4.vim

# Remove unused directories, if they exist.
for dirname in Documents Music Pictures Public Templates Videos
do
    if [ -d $HOME/$dirname ]
    then
	rmdir $HOME/$dirname
    fi
done

# Update settings via the following corresponding gsettings commands.

# This command has the same effect as doing this in Settings app
# in Ubuntu 24.04:
# Privacy & Security -> Screen Lock -> Blank Screen Delay -> Never
gsettings set org.gnome.desktop.session idle-delay 0

# Privacy & Security -> Screen Lock -> Automatic Screen Lock -> disabled
gsettings set org.gnome.desktop.screensaver lock-enabled false

# Ubuntu Desktop -> Dock -> Icon Size -> 24
gsettings set org.gnome.shell.extensions.dash-to-dock dash-max-icon-size 24

# Update the list of icons pinned in the Dash:
gsettings set org.gnome.shell favorite-apps "['org.gnome.Terminal.desktop', 'firefox_firefox.desktop', 'org.gnome.Nautilus.desktop', 'org.gnome.Settings.desktop', 'update-manager.desktop', 'yelp.desktop']"

# System -> Users -> user account "p4" -> Automatic Login -> enabled
# Changing this does not change the output of the command:
# gsettings list-recursively
# It must modify something on the system elsewhere.
# I learned that it causes a line like the following in file
# /etc/gdm3/custom.conf to have the value after the = change from False to True:
#AutomaticLoginEnable=False
# This line is in a section labeled [daemon].
# It also causes this line to be created, or its value modified,
# to the user account name:
#AutomaticLogin=p4

# TODO: The best way to change this from a Bash script would be to
# find a well-tested utility program that modifies or adds settings to
# files with that format, which is like a Windows INI format file.

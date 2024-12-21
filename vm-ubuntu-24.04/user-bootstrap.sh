#!/bin/bash

# Print script commands and exit on errors.
set -xe

# --- Emacs --- #
sudo cp p4_16-mode.el /usr/share/emacs/site-lisp/
sudo mkdir $HOME/.emacs.d/
echo "(autoload 'p4_16-mode' \"p4_16-mode.el\" \"P4 Syntax.\" t)" > init.el
echo "(add-to-list 'auto-mode-alist '(\"\\.p4\\'\" . p4_16-mode))" | tee -a init.el
sudo mv init.el $HOME/.emacs.d/
sudo ln -s /usr/share/emacs/site-lisp/p4_16-mode.el $HOME/.emacs.d/p4_16-mode.el
sudo chown -R $USER:$USER $HOME/.emacs.d/

# --- Vim --- #
cd ~
mkdir .vim
cd .vim
mkdir ftdetect
mkdir syntax
echo "au BufRead,BufNewFile *.p4      set filetype=p4" >> ftdetect/p4.vim
echo "set bg=dark" >> ~/.vimrc
sudo mv ~/.vimrc $HOME/.vimrc
cp ~/p4.vim syntax/p4.vim
cd ~
sudo mv .vim $HOME/.vim
sudo chown -R $USER:$USER $HOME/.vim
sudo chown $USER:$USER $HOME/.vimrc

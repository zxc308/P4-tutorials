Start creating a brand new VM by running `vagrant up` in this
directory (install vagrant on your system if needed).  It can take one
to several hours, depending upon the speed of your computer and
Internet connection.

Steps taken to prepare a VM _after_ running `vagrant up` on the host
OS.  Some of these could probably be automated with programs, and
changes to the `vagrant up` scripts that can do so are welcome.  I did
them manually to create a VM image simply to avoid the experimentation
and time required to automate them, since I do not expect to create a
new VM very often (a couple of times per year?).

+ Log in as user p4 (password p4)
+ Answer "Yes" in the pop window asking if you want to upgrade the
  system, if asked.  This will download the latest Linux Linux kernel
  version released for Ubuntu 20.04, and other updated packages.
+ Reboot the system.
+ Use `sudo apt purge <list of packages>` to remove older version of
  Linux kernel, if the upgrade installed a newer one.
+ `sudo apt clean`

+ Log in as user p4 (password p4)
+ Start menu -> Preferences -> LXQt settings -> Monitor settings
  + Change resolution from initial 800x600 to 1024x768.  Apply the changes.
  + Close monitor settings window
  + Note: For some reason I do not know, these settings seem to be
    undone, even if I use the "Save" button.  They are temporarily in
    effect if I shut down the system and log back in, but then in a few
    seconds it switches back to 800x600.  Strange.
+ Start menu -> Preferences -> LXQt settings -> Desktop
  + In "Wallpaper mode" popup menu, choose "Center on the screen".
  + Click Apply button
  + Close "Desktop preferences" window
+ Several of the icons on the desktop have an exclamation mark on
  them.  If you try double-clicking those icons, it pops up a window
  saying "This file 'Sublime Text' seems to be a desktop entry.  What
  do you want to do with it?" with buttons for "Open", "Execute", and
  "Cancel".  Clicking "Open" causes the file to be opened using the
  Atom editor.  Clicking "Execute" executes the associated command.
  If you do a mouse middle click on one of these desktop icons, a
  popup menu appears where the second-to-bottom choice is "Trust this
  executable".  Selecting that causes the exclamation mark to go away,
  and future double-clicks of the icon execute the program without
  first popping up a window to choose between Open/Execute/Cancel.  I
  did that for each of these desktop icons:
  + Sublime Text
  + Terminal
  + Wireshark
+ cd tutorials
  + `git checkout add-2021-mar-vm-based-on-ubuntu-20.04`
  + The above command changes to a branch that includes changes for
    using Python3, and hopefully removes all traces of using Python2.
    This is relatively new as of March 2021, and there may be bugs
    remaining to be found.
+ Log off

+ Log in as user vagrant (password vagrant)
+ Change monitor settings and wallpaper mode as described above for
  user p4.
+ Open a terminal.
  + Run the command `./clean.sh`, which removes about 6 to 7 GBytes of
    files created while building the projects.
+ Log off

# Rubian_installer_alpha
Alpha test of Rubin Core for Debian Linux


This is not a full working replacement of the Bash shell.

Rubian is a project to create a Ruby Debian Linux Distro, hence Rubian (ruby Debian)

To Test this work,  make sure you add a new folder (dir) to your Desktop with the name test-pi

once the Installer script is downloaded,  run the script and follow the instructions

This Project was designed for a Raspberry pi, with the options of Raspbian stand alone, Retropie stand alone, and
a duelboot pi with both raspbian and retro pie.

for Non RPI computers running a version of Debian linux( ubuntu, mint, etc)  select the first option when prompted in 
the installer.

if you wish to delete(uninstall) rubian, rather than deleting the folder,  run the Rubin Installer script again, and it will detect that it has installed the gem and will ask if you wish to uninstall, deleting the gem files, and ready the test-pi folder for a new install and round of testing.

Rubian will be installed in the users created test-pi folder on the desktop, with Rubian Core and its required gem files.
you can view the source code of Rubian in this folder.  Feel free to add and modify the commands as needed in the Rubian gem to get a better proper testing.

To run Rubian,  open the test-pi folder in the terminal and type the following command
ruby Rubian_core.rb

for debugging, or if you want to help with this project, please contact me at crazyrabbitking89@gmail.com

Rubian was Created by Troy B. Mallory.

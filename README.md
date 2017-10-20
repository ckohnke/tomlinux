# tomlinux
A very basic install script for TOM on Linux. It first extracts the Java jar files from TOM_latest_MAC.zip, installs them in the user's perferred location, and creates the command 'tom_pkmn' in $PATH (location specified by user) that launches TOM. 

This TOM install script for Linux is unofficial and is no way associated with the good people who spend their time making TOM. The only official version of TOM are for Windows and Mac OS. This software comes with no warranty, explicit or implcit, and is provided "as is" with the expectation that the end user will "use it at their own risk."

# Requirements
- Java 8 (Java 9 supposedly has issues with TOM, your mileage may vary).
- unzip

# Usage
    
    install.sh path/to/Tom_latest_MAC.zip
    tom_pkmn
    
# Sudo
If the installation location of the Java jar files or the executable is owned by root, install.sh must be run using sudo.

# Browser Fix
TOM may refuse to open a html viewer (firefox, chrome, etc.) on Linux. If you have this error, TOM will throw an error about being unable to open Pairings, Player Roster, etc. To fix it, we need to create the following symlink:

    sudo ln -s /usr/bin/xdg-open /usr/bin/netscape

xdg-open is used to open the default browser, and netscape is what TOM tries to use. If your distro uses a different command for opening the default browser, then the xdg-open command will need to be changed.

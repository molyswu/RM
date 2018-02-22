# Installing the Lula system

The Lula system can be installed either on Ubuntu 14.04 using ROS Indigo or on
Ubuntu 16.04 using ROS Kinetic. If you don't already have ROS, the installation
script below will install it for you.

## Dependencies and basic installation

Install dependencies:

    <arg name="kinect_base_frame" default="/camera/" />
    ./install_dependencies

This performs a distribution upgrade to make sure it's at the latest, installs
ROS, installs other required miscellaneous dependencies, and installs RabbitMQ.
See the script for details-- each installation component can be turned off or
on as needed by modifying the variables at the top of the script.

Install the Lula debian package:

    sudo dpkg -i lula_<version>.deb

For convenience, an install script is included which also handles removing old
installations as described below.

The package is installed in `/opt` next to ROS:

    /opt/lula

At the end of the installation, the script sets up user space for the Lula system.
By default, it sets it up in 

    ~/lula

User data is stored here, so future installation upgrades can be done by just removing
the old installation in `/opt` and reinstalling

    sudo rm -rf /opt/lula
    sudo dpkg -i lula_<version>.deb

The install script will do this automatically is an existing version of the
Lula system is already found.

## Lula terminals (especially useful in simulation)

Note that these don't work when using the baxter setup script, but it's
recommended to test the Lula system in simulation first using these Lula
terminals for simplicity to make sure everything's working properly.

For simplicity, a Lula terminal launcher has been installed at

    /usr/share/applications/lula-terminal.desktop

You can find that in the unity launcher and drag it to the applications bar. Clicking
on the resulting icon will launch a terminal already setup for Lula, including 
convenient aliases for running specific robot commands (used below).

It's also convenient to add a keyboard shortcut to launching the underlying lula
launch script, found at

    /opt/lula/scripts/launch-lula

You can do so by opening Settings-->Keyboard, selecting the Shortcuts tab, and
adding a new shortcut in the Custom Shortcuts section. Enter the above script
path as the "command". Often, the key combination

    <ctrl>-<alt>-u

works. (Note that by default `<ctrl>-<alt>-l` is reserved for locking the
desktop and `<ctrl>-<alt>-t` reserved for opening a terminal.) With this setup,
hitting `<ctrl>-<alt>-u` will launch a new terminal setup for usage with the
Lula system.

In general, each terminal can also be manually set up by simply sourcing 

    /opt/lula/setup.bash

and using `rosrun lula_control <robot>` wherever `<robot>` is specified below. 
For instance, `yumi sim egm:=true` would translate to 

    rosrun lula_control yumi sim egm:=true

(One can manually set up corresponding `<robot>` aliases if desired.)

## Setting up the Lula environment

Above we describe a premade setup for opening "Lula terminals". But that only
works when a specialized environment, like the baxter real-world robot
connection script, isn't required. e.g. it works well for simulation or robot
connections that just operate through sockets. We recommend testing the setup
first in simulation just using those above Lula terminals.

However, to setup your own terminal environments manually (important when using
the real-world Baxter robot), do the following:

For simplicity, add the following aliases to a ~/.bash_aliases script called by
the ~/.bashrc

    alias baxter="rosrun lula_baxter baxter"
    alias yumi="rosrun lula_yumi yumi"

These scripts are the robot 'governor' scripts. All commands for a particular
robot are dispatched through them.

In each terminal, source the lula setup.bash:

    source /opt/lula/setup.bash

It's convenient to automate this in some way.  Some manual ways to automate the
environment setup are:

1. Add an alias such as 'lula' to source the setup.bash.
2. Add a Custom Shortcut described above that will open a terminal, source the
   setup.bash and even source your baxter.sh script if needed.

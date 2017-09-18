# OSHChip Vagrant
`vagrant up` and go! Follow the instructions at the end, you should be able to
simply `vagrant ssh` in and build, flash and debug the project.

# Intro
`vagrant` utilized `Virtual Box` to provide a consistent developement environment,
preloaded with all the tools required to build flash and debug `OSHChip`

# Requirements
Ensure you have installed
* vagrant
* Virtual Box
* Oracle Virtual Box Extensions

```
git clone https://github.com/morganrallen/oshchip-vagrant.git
cd oshchip-vagrant/
vagrant up
vagrant ssh
cd /vagrant/devel/OSHChip_Blinky_Demo/
make
make flash
```

# Boot error

# Debug

You can either use `vagrant ssh` twice and get two terminals or use `screen`.
I prefer `screen` and will demonstrate that here.

```
screen
make startdebug
[CTRL-a c] # create new buffer
make gdb
```

# Notes
* vagrant cannot handle usernames with a " " in Windows. (yeah, really)



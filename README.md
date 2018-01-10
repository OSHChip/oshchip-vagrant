# OSHChip Vagrant
`vagrant up` and go! Follow the instructions at the end, you should be able to
simply `vagrant ssh` in and build, flash and debug the project.

# Intro
`vagrant` utilized `Virtual Box` to provide a consistent developement environment,
preloaded with all the tools required to build flash and debug `OSHChip`

# Requirements
Ensure you have installed
* [Vagrant][vagrant]
* [Virtual Box][virtualbox]
* [Oracle Virtual Box Extensions][ovbe]

```
git clone https://github.com/morganrallen/oshchip-vagrant.git
cd oshchip-vagrant/
vagrant up
vagrant ssh
cd /vagrant/devel/OSHChip_Blinky_Demo/
make
make flash
```

# Debug

You can either use `vagrant ssh` twice and get two terminals or use `screen`.
I prefer `screen` and will demonstrate that here.

```
screen
make startdebug
[CTRL-a c] # create new buffer
make gdb
```

# Windows Notes
* vagrant cannot handle usernames with a " " (space) in Windows. (yeah, really)
* if `vagrant up` hangs update to `Windows Management System 3.0`

[vagrant]: https://www.vagrantup.com/ "Vagrant"
[virtualbox]: https://www.virtualbox.org/ "Virtual Box"
[ovbe]: http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html "Oracle Virtual Box Extensions"

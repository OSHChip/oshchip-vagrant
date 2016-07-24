# OSHChip Vagrant
`vagrant up` and go! Follow the instructions at the end, you should be able to 
simply `vagrant ssh` in and build, flash and debug the project.

```
vagrant up
vagrant ssh
cd /vagrant/devel/OSHChip_Blinky_Demo/
make
make flash
```

# Debug
You can either use `vagrant ssh` twice and get two terminals or use `screen`

```
screen
[CTRL-a c] # create new buffer
make startdebug
[CTRL-a n] # switch to next buffer
make gdb
```

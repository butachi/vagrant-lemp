# Vagrant LEMP

This script will automate the setup of a PHP development box

## Includes
- Ubuntu 22.04.5 (LTS)
- Nginx latest
- PHP 8.2
- MySQL latest
- Composer

## Requirements

- MacOS (Windows and Linux might work but aren't covered here)
- [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- [Vagrant](http://www.vagrantup.com/)

## Install

You clone this repository into a folder called `vagrant-lemp` in your directory. 

```bash
git clone https://github.com/butachi/vagrant-lemp.git vagrant-lemp
cd vagrant-lemp
```

Open the following file:

> setup.sh

- Update the MySQL root password.


🚀 When everything seems fine you launch it.

```bash
vagrant up
```

You will have to wait a few seconds or minutes for the script to complete. When everything is done you have a complete LEMP setup to play with.


## Vagrant cheat sheet

```bash
vagrant up      # Boot -> install if not already provisioned.
vagrant ssh     # Login as user "vagrant".
vagrant reload  # Reboot.
vagrant halt    # Power off.
vagrant destroy # Delete.
```
Description
===========

A cookbook with a single recipe (zf2_vagrant_aio::default) which will install apache2, PHP5, and MySQL.  It also configures apache to host the ZF2 app at the root http://hostname/, and creates the specified DB

Requirements
============

This expects that a standard Vagrant configuration is being used, and that the root of the ZF2 app is mounted at /vagrant.

It also expects that the ZF2 app is using Doctrine 2 for ORM, and that /vagrant/vendor/bin/doctrine-module exists.

Lastly, it expects that the ZF2 app already has all of it's dependencies installed in /vendor.  You can ensure this by running `php composer.phar install` on the host.

Attributes
==========

Usage
=====


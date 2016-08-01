libpstat: OS-agnostic process stat
==================================

libpstat is a small library for getting information on running processes in an OS-agnostic way.
The source is structured to make it easy to add support for additional operating systems.
Currently, Linux is the only supported OS.


Documentation
-------------

TODO



Building
--------

To build:

make clean
make

Installing
----------

To install to default locations:

make clean
make
sudo make install

# this relinker run may also be required
# and is unlikely to hurt

sudo ldconfig 

see the Install file for more and advanced options.

Testing
-------

TODO






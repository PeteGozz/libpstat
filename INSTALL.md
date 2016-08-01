Installing libpstat
===================

Please see the README file for an introduction to libpstat
and simple build and install methods.

If the README defaults do not do what you need you may find these more useful.
Finally read the Makefile to track the installed paths,
the build time includes and other CC flags and instructions.


$ make clean
$ make
$ sudo make install
$ sudo ldconfig -v | grep libpstat
	  



Building
--------

To build:
$ make clean
$ make OS=$OS_NAME
  
Substitute $OS_NAME for "LINUX" (default is set in Makefile).

Installing
----------

To install to top level directories:
i.e. libpstat to /lib

and headers to /usr/include/pstat:

Human Sanity Check.
OPTIONALLY uninstall previous builds
Assumimg you have a previous build.

    $ sudo make uninstall

Then

    $ sudo make install PREFIX=/ INCLUDE_PREFIX=/usr


** Advanced: Library Paths **
-----------------------------

If you want to install libpstat's headers to a custom location,
you can do so by setting the
`INCLUDE_DIR` variable
     instead of the
`INCLUDE_PREFIX` variable.

For example, passing
`INCLUDE_DIR=/custom/location/`
would install the headers directly to `/custom/location`,

whereas

`INCLUDE_PREFIX=/custom/location`
would install the headers to `/custom/location/include/pstat`.

Reading the Makefile may add some clarity to this.

Finally run the system linker so that the libraries symlinks  are kept up to date
and usable by other applications.


Linking the .so Shared Libraries
--------------------------------

This is normally 
$sudo /sbin/ldconfig 

confirm and check with something like:

$sudo /sbin/ldconfig -v | grep libpstat      

You may have to add a search path to /etc/ld.so.conf
(or its include.d paths) 
Check /etc/ld.so.conf.d/libc.conf
(or thereabouts.)

e.g.

# libc default configuration
/usr/local/lib

ADD _your_ local requirements preferably in a separate file.


Documentation
--------------

STILL TO-DO

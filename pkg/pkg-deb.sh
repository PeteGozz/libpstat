#!/bin/bash

FSKIT_DIR=../
BUILD=./build
SCRIPTS=./pkg-scripts

build_package() {
   
   local dir=$1
   local build_target=$2
   local install_target=$3
   local package_script=$4
   local install_prefix=$5

   local install_dir=$BUILD/$target
   rm -rf $install_dir
   mkdir $install_dir

   if [ -n $build_target ]; then
      make -C $dir $build_target
   fi

   if [ -n $install_target ]; then
      mkdir -p $install_dir/$install_prefix
      make -C $dir $install_target PREFIX=$(realpath $install_dir/$install_prefix)
   fi
   
   if [ -n $package_script ]; then
      $SCRIPTS/$package_script $install_dir
   fi
}

rm -rf $BUILD

# build libpstat 
build_package ../ libpstat libpstat-install pkg-libpstat-deb.sh /usr/local

# build libpstat-dev
build_package ../ "" libpstat-dev-install pkg-libpstat-dev-deb.sh /usr/local

# build libpstat-util
build_package ../ pstat pstat-install pkg-libpstat-util-deb.sh /usr/local

rm -rf $BUILD

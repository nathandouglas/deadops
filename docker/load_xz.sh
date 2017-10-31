#!/bin/bash

# Interate through archive directory
# decompress files, and load archive file
# with `docker load`
#
# Args:
#  $1 -- Abs path to archive directory of docker images

ARCH_DIR=$1/*

for iarch in $ARCH_DIR
do
    xz -dck $iarch | docker load
done

#!/usr/bin/env bash
#
# Utility to save all docker images to one tar file.
#
# Args:
# $1 -- name of output file
docker save $(docker images -q) > "$1".tar

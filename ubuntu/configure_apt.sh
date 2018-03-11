#!/usr/bin/env bash
#
# Example of how to parse short/long options with 'getopt'
# https://gist.github.com/cosimo/3760587
#

OPTS=`getopt -o s: --long --source: -n 'parse-options' -- "$@"`

if [ $? != 0 ] ; then echo "Failed parsing options." >&2 ; exit 1 ; fi

# echo "$OPTS"
# eval set -- "$OPTS"

VERBOSE=false
HELP=false
DRY_RUN=false
SOURCE_DIR=$(pwd)

while true; do
  case "$1" in
    -v | --verbose ) VERBOSE=true; shift ;;
    -h | --help )    HELP=true; shift ;;
    -n | --dry-run ) DRY_RUN=true; shift ;;
    -s | --source ) SOURCE_DIR="$2"; shift; shift ;;
    -- ) shift; break ;;
    * ) break ;;
  esac
done

mv /etc/apt/sources.list /etc/apt/sources.list.bak

touch /etc/apt/sources.list

echo "deb file:$SOURCE_DIR /" >> /etc/apt/sources.list

apt-get update

# echo VERBOSE=$VERBOSE
# echo HELP=$HELP
# echo DRY_RUN=$DRY_RUN
# echo SOURCE_DIR=$SOURCE_DIR

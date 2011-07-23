#!/usr/bin/env bash

if [ "$1" == "" ]; then
  echo
  echo "wherefrom v1.0/20110723 by Oliver Prygotzki [http://oliver.prygotzki.de/]"
  echo "https://github.com/NoNoNo/shellscripts-wherefrom"
  echo
  echo "Reads or sets the MacOS X Spotlight metadata 'kMDItemWhereFroms' of a file"
  echo
  echo "Syntax: wherefrom \$FILE [\$WHEREFROM]"
  echo "Requires: 'xattr' utility by Apple"
  exit
fi

which xattr > /dev/null
if [ "$?" -ne "0" ]; then
  echo "Fatal: xattr missing in path"
  exit
fi

if [ "$2" == "" ]; then
  xattr -p com.apple.metadata:kMDItemWhereFroms "$1"
else
  xattr -w com.apple.metadata:kMDItemWhereFroms "$2" "$1"
fi

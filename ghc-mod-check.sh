#!/bin/sh
TARGET=`realpath $1`
ROOT=`ghc-mod root`
cd $ROOT
ghc-mod check $TARGET | sed -e "s#^#$ROOT/#" | sed -e 's#\([^:]*:[^:]*:[^:]*:\)#\1\n#' | sed -e "s#\x0#\n#g"

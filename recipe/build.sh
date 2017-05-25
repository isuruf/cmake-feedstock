#!/bin/bash

export CC=gcc
export CXX=g++
export MACOSX_DEPLOYMENT_TARGET=10.10

if [[ "$(uname)" == 'Darwin' ]];
then
    export LIBRARY_SEARCH_VAR=DYLD_FALLBACK_LIBRARY_PATH
else
    export LIBRARY_SEARCH_VAR=LD_LIBRARY_PATH
fi


./bootstrap \
             --prefix="${PREFIX}" \
             --system-libs \
             --no-qt-gui \
             -- \
             -DCMAKE_BUILD_TYPE:STRING=Release \
             -DCMAKE_FIND_ROOT_PATH="${PREFIX}" \

make
eval ${LIBRARY_SEARCH_VAR}="${PREFIX}/lib" make install

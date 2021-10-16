#!/bin/bash

cd m4-1.4.19/

./configure --disable-dependency-tracking --prefix="$PAKKET_PKG_PATH"
make
make install
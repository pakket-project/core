cd xz-5.2.5

./configure --prefix=$PAKKET_PKG_PATH --disable-debug --disable-dependency-tracking --disable-silent-rules
make check
make install
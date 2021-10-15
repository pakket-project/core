cd cmake-3.21.3

./bootstrap --prefix="$PAKKET_PKG_PATH" --no-system-libs --datadir=/share/cmake --docdir=/share/doc/cmake --mandir=/share/man --sphinx-html --sphinx-man --system-zlib --system-bzip2 --system-curl -- -DCMAKE_INSTALL_PREFIX="$PAKKET_PKG_PATH" -DCMAKE_INSTALL_LIBDIR="lib" -DCMAKE_BUILD_TYPE="Release" -DCMAKE_FIND_FRAMEWORK="LAST" -DCMAKE_VERBOSE_MAKEFILE=ON -Wno-dev -DBUILD_TESTING=OFF
make
make install

cd zstd-1.5.0/build/cmake

cmake -S . -B builddir
cmake --build builddir
cmake --install builddir --prefix "$PAKKET_PKG_PATH"
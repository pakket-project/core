cd ninja-1.10.2

# Build binary
cmake -DCMAKE_INSTALL_PREFIX="$PAKKET_PKG_PATH" -Bbuild-cmake
cmake --build build-cmake

# Install binary
cd build-cmake
make install
cd ..

# Completions
mkdir -p "$PAKKET_PKG_PATH/share/zsh/site-functions"
install -m 644 "misc/zsh-completion" "$PAKKET_PKG_PATH/share/zsh/site-functions/_ninja"

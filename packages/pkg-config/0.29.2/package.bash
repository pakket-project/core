cd pkg-config-0.29.2 || exit

./configure --disable-debug --prefix="$(pwd)"/prefix --disable-host-tool --with-internal-glib
make
make install

cd prefix

# Move to /bin folder
mkdir "$PAKKET_PKG_PATH/bin"
install "bin/pkg-config" "$PAKKET_PKG_PATH/bin"

# share
mv "share" "$PAKKET_PKG_PATH"

cd htop-3.0.5

./autogen.sh

./configure --prefix="$(pwd)"/prefix
make
make install

cd prefix

# Move to /bin folder
mkdir "$PAKKET_PKG_PATH/bin"
install "bin/htop" "$PAKKET_PKG_PATH/bin"

# share
mv "share" "$PAKKET_PKG_PATH"

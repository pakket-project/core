cd openssl-1.1.1l

unset OPENSSL_LOCAL_CONFIG_DIR

./Configure --prefix="$PAKKET_PKG_PATH" no-ssl3 no-ssl3-method no-zlib "darwin64-$(uname -m)-cc" enable-ec_nistp_64_gcc_128
make
make install MANSUFFIX=ssl
make test

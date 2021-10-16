cd wget-1.21.2 || exit

#TODO add openssl flags
./configure --prefix=$PAKKET_PKG_PATH --with-ssl=openssl --with-libssl-prefix=/usr/local --disable-pcre --disable-pcre2 --without-libpsl --without-included-regex
make install
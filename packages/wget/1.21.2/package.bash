cd wget-1.21.2 || exit

./configure --prefix=$PAKKET_PKG_PATH --sysconfdir=/usr/local/etc --with-ssl=openssl --with-libssl-prefix=/usr/local --disable-pcre --disable-pcre2 --without-libpsl --without-included-regex
make install

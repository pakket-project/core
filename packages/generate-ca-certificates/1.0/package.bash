cd generate-ca-certificates-1.0

go build

mkdir "$PAKKET_PKG_PATH/bin"
mv generate-ca-certificates "$PAKKET_PKG_PATH/bin"

/usr/bin/curl 'https://curl.se/ca/cacert.pem' --output 'cacert.pem'

mkdir -p "$PAKKET_PKG_PATH/etc/generate-ca-certificates"
mv cacert.pem "$PAKKET_PKG_PATH/etc/generate-ca-certificates"
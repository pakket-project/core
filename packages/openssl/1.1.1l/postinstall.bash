mkdir -p "$PAKKET_PREFIX"/ssl/certs
ln -sf "$PAKKET_PREFIX"/etc/generate-ca-certificates/cert.pem "$PAKKET_PREFIX"/ssl/cert.pem

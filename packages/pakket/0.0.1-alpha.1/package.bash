cd pakket-0.0.1-alpha.1

# Build binary
go build -o "$(pwd)/pakket" -trimpath -v -ldflags="-s -w" .

# Move to /bin folder
mkdir -p "$PAKKET_PKG_PATH/bin"
install -m 0755 "pakket" "$PAKKET_PKG_PATH/bin/pakket"

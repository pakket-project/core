cd builder-0.0.2

# Build binary
go build -o "$(pwd)/pakket-builder" -trimpath -v -ldflags="-s -w" .

# Move to /bin folder
mkdir -p "$PAKKET_PKG_PATH/bin"
install -m 0755 "pakket-builder" "$PAKKET_PKG_PATH/bin/pakket-builder"

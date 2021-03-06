cd zoxide-0.7.5 || exit

# Build binary
cargo build --release

# Move to /bin folder
mkdir "$PAKKET_PKG_PATH/bin"
install "target/release/zoxide" "$PAKKET_PKG_PATH/bin/zoxide"

# manual
mkdir -p "$PAKKET_PKG_PATH/share/man/man1"
install -m 644 man/zoxide* "$PAKKET_PKG_PATH/share/man/man1"


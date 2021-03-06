cd bat-0.18.0 || exit

# Build binary
cargo build --manifest-path "Cargo.toml" --release

# Move to /bin folder
mkdir "$PAKKET_PKG_PATH/bin"
install "target/release/bat" "$PAKKET_PKG_PATH/bin/bat"

# manual
mkdir -p "$PAKKET_PKG_PATH/share/man/man1"
install "assets/manual/bat.1.in" "$PAKKET_PKG_PATH/share/man/man1/bat.1"

# completions
mkdir -p "$PAKKET_PKG_PATH/share/fish/vendor_completions.d"
mkdir -p "$PAKKET_PKG_PATH/share/zsh/site-functions"
install "assets/completions/bat.fish.in" "$PAKKET_PKG_PATH/share/fish/vendor_completions.d/bat.fish"
install "assets/completions/bat.zsh.in" "$PAKKET_PKG_PATH/share/zsh/site-functions/_bat"

cd croc-9.3.0 || exit

go build -trimpath -v -ldflags="-s -w"

mkdir "$PAKKET_PKG_PATH/bin"
mv croc "$PAKKET_PKG_PATH/bin"
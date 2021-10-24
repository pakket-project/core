cd openssl-1.1.1l

unset OPENSSL_LOCAL_CONFIG_DIR

# patch sets the ca dir to be /usr/local/ssl instead of ./demoCA

cat >> ca_dir.patch << 'EOF'
--- apps/CA.pl.in	2019-09-10 15:13:07.000000000 +0200
+++ apps/CA.pl.in	2019-10-06 09:34:23.960864556 +0200
@@ -33,7 +33,7 @@
 my $PKCS12 = "$openssl pkcs12";
 
 # default openssl.cnf file has setup as per the following
-my $CATOP = "./demoCA";
+my $CATOP = "/usr/local/ssl";
 my $CAKEY = "cakey.pem";
 my $CAREQ = "careq.pem";
 my $CACERT = "cacert.pem";
--- apps/openssl.cnf	2019-09-10 15:13:07.000000000 +0200
+++ apps/openssl.cnf	2019-10-06 09:34:23.960864556 +0200
@@ -42,7 +42,7 @@
 ####################################################################
 [ CA_default ]
 
-dir		= ./demoCA		# Where everything is kept
+dir		= /usr/local/ssl		# Where everything is kept
 certs		= $dir/certs		# Where the issued certs are kept
 crl_dir	= $dir/crl			# Where the issued crl are kept
 database	= $dir/index.txt	# database index file.
@@ -325,7 +325,7 @@
 [ tsa_config1 ]
 
 # These are used by the TSA reply generation only.
-dir		= ./demoCA		# TSA root directory
+dir		= /usr/local/ssl		# TSA root directory
 serial		= $dir/tsaserial	# The current serial number (mandatory)
 crypto_device	= builtin			# OpenSSL engine to use for signing
 signer_cert	= $dir/tsacert.pem 	# The TSA signing certificate
EOF

#apply patch
patch -p0 -i 'ca_dir.patch'

#build & install
perl ./Configure --prefix="$PAKKET_PKG_PATH" --openssldir="/usr/local/ssl" no-ssl3 no-ssl3-method no-zlib "darwin64-$(uname -m)-cc" enable-ec_nistp_64_gcc_128
make
make install MANSUFFIX=ssl

#revert patch & test
patch -p0 -R -i 'ca_dir.patch'
make test

#reapply patch & regenerate CA.pl
patch -p0 -i 'ca_dir.patch'
make apps/CA.pl

#copy /usr/local/ssl to build dir
sudo mv /usr/local/ssl $PAKKET_PKG_PATH/ssl
#!/bin/bash

cd gdbm-1.21/

# Fix build failure on macOS. Merged upstream as
# https://git.gnu.org.ua/gdbm.git/commit/?id=32517af75ac8c32b3ff4870e14ff28418696c554
#
# Patch taken from:
# https://puszcza.gnu.org.ua/bugs/?521

patch -p0 src/gdbmshell.c << EOF
--- a/src/gdbmshell.c
+++ b/src/gdbmshell.c
@@ -1084,7 +1084,11 @@ print_snapshot (char const *snapname, FILE *fp)
       fprintf (fp, "%s: ", snapname);
       fprintf (fp, "%03o %s ", st.st_mode & 0777,
 	       decode_mode (st.st_mode, buf));
-      fprintf (fp, "%ld.%09ld", st.st_mtim.tv_sec, st.st_mtim.tv_nsec);
+      #ifdef HAVE_STRUCT_STAT_ST_MTIM
+          fprintf (fp, "%ld.%09ld", st.st_mtim.tv_sec, st.st_mtim.tv_nsec);
+      #else
+          fprintf (fp, "%ld.%09ld", st.st_mtimespec.tv_sec, st.st_mtimespec.tv_nsec);
+      #endif
       if (S_ISREG (st.st_mode))
 	{
 	  GDBM_FILE dbf;
EOF

#build package


./configure --disable-dependency-tracking --disable-silent-rules --enable-libgdbm-compat --without-readline --prefix="$PAKKET_PKG_PATH"

make install

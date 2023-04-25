#!/usr/bin/env bash

set -euo pipefail

trap exit SIGINT
mkdir loadable_extensions_1
mkdir loadable_extensions_2

FILES="build/relsize/eh/**/*.duckdb_extension"
for f in $FILES
do
	ext=`basename $f .duckdb_extension`
	echo $ext
	emcc $f -sSIDE_MODULE=1 -o loadable_extensions_1/$ext.duckdb_extension.wasm
	emcc $f -sSIDE_MODULE=2 -o loadable_extensions_2/$ext.duckdb_extension.wasm
	# calculate SHA256 hash of extension binary
	# openssl dgst -binary -sha256 $f > $f.hash
	# encrypt hash with extension signing private key to create signature
	# openssl pkeyutl -sign -in $f.hash -inkey private.pem -pkeyopt digest:sha256 -out $f.sign
	# append signature to extension binary
	# cat $f.sign >> $f
	# compress extension binary
	# gzip < $f > "$f.gz"
	# upload compressed extension binary to S3
	# aws s3 cp $f.gz s3://duckdb-extensions/$2/$1/$ext.duckdb_extension.gz --acl public-read
done

ls -la loadable_extensions_*

ls -la *
wasm2wat --enable-all duckdb-$1.wasm -o duckdb_wat.wat
ls -la duckdb_wasm-$1.wasm
sed -i "/export*Executor/c\" ${BUILD_DIR}/duckdb_wat.wat
wat2wasm --enable-all duckdb_wat.wat -o duckdb-$1.wasm
rm duckdb_wat.wat
ls -la duckdb_wasm-$1.wasm

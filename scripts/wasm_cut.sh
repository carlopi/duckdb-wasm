ls -la *
wasm2wat --enable-all duckdb_wasm.wasm -o duckdb_wat.wat
ls -la duckdb_wasm.wasm
sed -i "/export*Executor/c\" ${BUILD_DIR}/duckdb_wat.wat
wat2wasm --enable-all duckdb_wat.wat -o duckdb_wasm.wasm
rm duckdb_wat.wat
ls -la duckdb_wasm.wasm

ls -la *
wasm2wat --enable-all duckdb-$1.wasm -o duckdb_wat.wat
ls -la duckdb-$1.wasm
ls -la duckdb_wat.wat
#sed -i "/export*Executor/c\" duckdb_wat.wat
grep -v -E 'export.*Executor' duckdb_wat.wat > duckdb_wat_filtered.wat
ls -la duckdb_wat_filtered.wat
wat2wasm --enable-all duckdb_wat_filtered.wat -o duckdb-$1.wasm
ls -la duckdb_wat_filtered.wat
rm duckdb_wat.wat
ls -la duckdb-$1.wasm

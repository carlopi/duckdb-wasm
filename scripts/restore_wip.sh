cd submodules/duckdb
git apply ../../duckdb.patch
cd extension
git clone https://github.com/carlopi/quackMcWasm
mkdir duckdblabs
head -n 14 CMakeLists.txt > duckdblabs/CMakeLists.txt
cd duckdblabs
git clone https://github.com/duckdblabs/sqlite_scanner
git clone https://github.com/duckdblabs/postgres_scanner
git clone https://github.com/duckdblabs/substrait

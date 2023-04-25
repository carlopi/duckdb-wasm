#!/usr/bin/env bash

set -euo pipefail

trap exit SIGINT

PROJECT_ROOT="$(cd $(dirname "$BASH_SOURCE[0]") && cd .. && pwd)" &> /dev/null
cd submodules/duckdb
git apply ../../duckdb.patch
cd extension
git clone https://github.com/carlopi/quackMcWasm
mkdir duckdblabs
head -n 14 CMakeLists.txt > duckdblabs/CMakeLists.txt
cd duckdblabs
git clone https://github.com/duckdblabs/sqlite_scanner
# git clone https://github.com/duckdblabs/postgres_scanner
git clone https://github.com/duckdblabs/substrait

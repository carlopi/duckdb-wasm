duckdb_extension_load(icu DONT_LINK)
duckdb_extension_load(inet DONT_LINK)
duckdb_extension_load(tpch DONT_LINK)
duckdb_extension_load(json DONT_LINK)
duckdb_extension_load(fts DONT_LINK)
duckdb_extension_load(parquet DONT_LINK)
duckdb_extension_load(excel DONT_LINK)
duckdb_extension_load(autocomplete DONT_LINK)

duckdb_extension_load(sqlsmith DONT_LINK)
duckdb_extension_load(tpcds DONT_LINK)
duckdb_extension_load(visualizer DONT_LINK)

duckdb_extension_load(httpfs DONT_LINK)

# Static linking on windows does not properly work due to symbol collision
duckdb_extension_load(sqlite_scanner
	DONT_LINK
        GIT_URL https://github.com/duckdblabs/sqlite_scanner
        GIT_TAG 9c38a30be2237456cdcd423d527b96c944158c77
        )

################# SUBSTRAIT
duckdb_extension_load(substrait
        DONT_LINK
        GIT_URL https://github.com/duckdblabs/substrait
        GIT_TAG 0cd88fa8b240babe5316924e32fb68aaba408780
        )

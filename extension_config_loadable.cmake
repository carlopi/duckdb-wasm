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

#duckdb_extension_load(aws
#        DONT_LINK
#        GIT_URL https://github.com/duckdblabs/duckdb_aws
#        GIT_TAG b769c8aab638bdbdc46c77fcb3c70412dd715d45
#        )

################## AZURE
#duckdb_extension_load(azure
#        DONT_LINK
#        GIT_URL https://github.com/duckdblabs/duckdb_azure
#        GIT_TAG 1fe568d3eb3c8842118e395ba8031e2a8566daed
#        )
# DUE TO file missing

################# ICEBERG
# Windows tests for iceberg currently not working
#duckdb_extension_load(iceberg
#        DONT_LINK
#        GIT_URL https://github.com/duckdblabs/duckdb_iceberg
#        GIT_TAG 6481aa4dd0ab9d724a8df28a1db66800561dd5f9
#        APPLY_PATCHES
#        )
# DUE TO AVRO.cpp missing

################# POSTGRES_SCANNER
# Note: tests for postgres_scanner are currently not run. All of them need a postgres server running. One test
#       uses a remote rds server but that's not something we want to run here.
#duckdb_extension_load(postgres_scanner
#        DONT_LINK
#        GIT_URL https://github.com/duckdblabs/postgres_scanner
#        GIT_TAG 828578442d18fb3acb53b08f4f54a0683217a2c8
#	APPLY_PATCHES
#        )
# DUE TO OPENSSL

################# SPATIAL
#duckdb_extension_load(spatial
#        DONT_LINK
#       GIT_URL https://github.com/duckdblabs/duckdb_spatial.git
#        GIT_TAG dc66594776fbe2f0a8a3af30af7f9f8626e6e215
#        APPLY_PATCHES
#        )
#
################# SQLITE_SCANNER
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

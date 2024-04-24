import * as duckdb from '../src/';

export function testSpatialQueries(db: () => duckdb.DuckDBBindings): void {
    let conn: duckdb.DuckDBConnection;
    beforeEach(() => {
        conn = db().connect();
    });

    afterEach(() => {
        conn.close();
        db().flushFiles();
        db().dropFiles();
    });

    describe('Spatial homepage demo', () => {
        it('Load spatial', async () => {
            await conn.send("INSTALL spatial;");
            await conn.send("LOAD spatial;");
            await conn.send(
                "CREATE TABLE stations AS FROM 's3://duckdb-blobs/stations.parquet';"
            );
            const result = await conn.send(
                "SELECT s1.name_long AS station1, s2.name_long AS station2, ST_Distance(ST_Point(s1.geo_lng, s1.geo_lat), ST_Point(s2.geo_lng, s2.geo_lat)) * 111139 AS distance FROM stations s1, stations s2 WHERE s1.type LIKE '%Intercity%' AND s2.type LIKE '%Intercity%' AND s1.id < s2.id ORDER BY distance ASC LIMIT 3;"
            );

            expect(result.numRows).toEqual(3);
            expect(result.numCols).toEqual(3);
        });
    });
    describe('Spatial read NYC taxi data', () => {
        it('Load spatial', async () => {
            await conn.send("INSTALL spatial;");
            await conn.send("LOAD spatial;");
            const result = await conn.send(
"CREATE TABLE nyc AS SELECT borough, st_union_agg(geom) AS full_geom, st_area(full_geom) AS area, st_centroid(full_geom) AS centroid, count(*) AS count FROM st_read('https://raw.githubusercontent.com/duckdb/duckdb_spatial/main/test/data/nyc_taxi/taxi_zones/taxi_zones.shp') GROUP BY borough; SELECT borough, area, centroid::VARCHAR, count FROM nyc;"
            );

            expect(result.numRows).toEqual(6);
            expect(result.numCols).toEqual(4);
        });
    });
}

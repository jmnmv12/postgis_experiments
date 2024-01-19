CREATE TABLE last_location (
    id SERIAL PRIMARY KEY,
    lat NUMERIC,
    lng NUMERIC,
    geom GEOMETRY(Point, 3395),
    -- PostGIS Point field with SRID 3395
    created_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    modified_on TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO
    last_location (lat, lng, geom)
SELECT
    lat,
    lng,
    ST_TRANSFORM(ST_Point(lng, lat, 4326), 3395) AS geom
FROM
    (
        SELECT
            (RANDOM() * (49.384358 - 24.396308) + 24.396308) AS lat,
            -- Range of latitudes in the continental US
            (RANDOM() * (-66.93457 + 125.001636) - 125.001636) AS lng -- Range of longitudes in the continental US
        FROM
            generate_series(1, 500)
    ) AS random_locations;
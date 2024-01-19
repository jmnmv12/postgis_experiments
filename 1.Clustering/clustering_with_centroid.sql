select
    cluster_loc.cluster_id,
    ST_Y (
        ST_TRANSFORM(
            ST_Centroid(ST_COLLECT(cluster_loc.geom)),
            4326
        )
    ) as lat,
    ST_X (
        ST_TRANSFORM(
            ST_Centroid(ST_COLLECT(cluster_loc.geom)),
            4326
        )
    ) as lng,
    ST_Centroid(ST_COLLECT(cluster_loc.geom)) as centroid,
    count(cluster_loc.cluster_id) num_points
from
    (
        select
            ST_CLUSTERDBSCAN(
                geom,
                eps := 100000,
                minpoints := 2
            ) over (
                order by
                    id
            ) as cluster_id,
            geom
        from
            last_location ll
        order by
            cluster_id
    ) cluster_loc
group by
    cluster_loc.cluster_id;
-- Query
-- Cluster with a 100000 meters radius
-- and a minimum of 2 locations to form a cluster
select
    ST_CLUSTERDBSCAN(geom, eps := 100000, minpoints := 2) over (
        order by
            id
    ) as cluster_id,
    geom
from
    last_location ll
order by
    cluster_id
limit
    10;
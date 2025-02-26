WITH trip_dur_perc AS (
    SELECT
        pickup_zone,
        dropoff_zone,
        year,
        month,
        PERCENTILE_CONT(
            TIMESTAMP_DIFF(pickup_datetime, dropoff_datetime, SECOND),
            0.90
        ) OVER (PARTITION BY year, month, pickup_zone, dropoff_zone) AS p90
    FROM {{ ref('dim_fhv_trips') }}
)

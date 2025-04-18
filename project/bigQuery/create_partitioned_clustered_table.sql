CREATE OR REPLACE TABLE `project-zoomcamp-457121.public_life_data_seattle_dataset.transformed_data`
PARTITION BY date
CLUSTER BY Temperature AS
SELECT
    DATE(`Start Time`) AS date,
    Temperature,
    AVG(CAST(Temperature AS FLOAT64)) AS avg_temperature
FROM
    `project-zoomcamp-457121.public_life_data_seattle_dataset.public_life_data_seattle`
GROUP BY
    date, Temperature;
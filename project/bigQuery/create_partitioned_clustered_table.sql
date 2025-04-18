CREATE OR REPLACE TABLE `project-zoomcamp-457121.public_life_data_seattle_dataset.people_staying_summary`
PARTITION BY date
CLUSTER BY Temperature AS
SELECT
    DATE(`Start Time`) AS date,
    Temperature,
    COUNT(*) AS total_people,
    AVG(CAST(Temperature AS FLOAT64)) AS avg_temperature,
    COUNTIF(Gender = "Male") AS total_male,
    COUNTIF(Gender = "Female") AS total_female

FROM
    `project-zoomcamp-457121.public_life_data_seattle_dataset.public_life_data_seattle`
GROUP BY
    date, Temperature;
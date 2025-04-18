CREATE OR REPLACE TABLE `project-zoomcamp-457121.your_dataset.public_life_data_partitioned`
PARTITION BY DATE(start_time)  -- Particiona por data de início (start_time)
AS
SELECT
    start_time,
    end_time,
    surveyor_count,
    conditions,
    temperature,
    group_size,
    race_ethnicity,
    gender,
    age,
    commercial_activity,
    eating_drinking,
    smoking,
    cultural_activity,
    active_recreation,
    waiting_for_transportation,
    disruptive_behavior,
    aggressive_disruptive_behavior,
    intoxicated_disruptive_behavior,
    notes
FROM
    `project-zoomcamp-457121.your_dataset.source_data`;  -- Tabela de origem

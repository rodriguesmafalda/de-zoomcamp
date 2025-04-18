# BIGQUERY - Partitioning & Clustering

To enhance query performance and reduce costs, the main dataset is:

- Partitioning por ingestion_date (artificial)
Se quiseres mesmo usar partitioning, podes adicionar uma coluna ingestion_date com a data atual:


- Clustering por artists e track_genre
Como filtrar por artista e género faz sentido em análises musicais, o clustering pode ajudar mais a médio prazo (em datasets maiores).


## Creating the Partitioned Table



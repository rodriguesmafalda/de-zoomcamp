# Workflow Orchestration

### Pre-Requisites

- Install Docker, docker-compose
- A GCP Service Account with the required permissions


### Setup Kestra

We'll set up Kestra using Docker Compose containing one container for the Kestra server and another for the Postgres database:

```bash
cd kestra/
docker compose up -d
```


### Setup Google Cloud Platform (GCP)

Before we start loading data to GCP, we need to set up the Google Cloud Platform. 

First, adjust the following flow [`gcp_kv.yaml`](flows/gcp_kv.yaml) to include your service account, GCP project ID, BigQuery dataset and GCS bucket name (_along with their location_) as KV Store values:
- GCP_CREDS
- GCP_PROJECT_ID
- GCP_LOCATION
- GCP_DATASET
- GCP_BUCKET_NAME.


> [!WARNING]  
> The `GCP_CREDS` service account contains sensitive information. Ensure you keep it secure and do not commit it to Git. Keep it as secure as your passwords.


### GCP Workflow: Load Spotify tracks Data to GCP Bucket


The flow code: [`gcp_public_life_data_load.yaml`](flows/gcp_public_life_data_load.yaml).


![flow_topology.png](flow_topology.png)





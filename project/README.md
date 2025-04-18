# 🏙️ Data Engineering Project: Public Life Data Pipeline

## 📍 Overview

This project demonstrates a complete data pipeline that processes public life data from Seattle. It includes:

- **Ingestion** of raw data from an open API
- **Transformation** using Python and BigQuery
- **Data orchestration** with Kestra
- **Infrastructure provisioning** with Terraform
- **Visualization** through an interactive dashboard

The goal is to showcase end-to-end automation of a real-world dataset for data analysis and urban planning insights.

---

## 📊 Dataset: [Public Life Data (People Staying)](https://data.seattle.gov/Transportation/Public-Life-Data-People-Staying/csd5-77em)

Provided by the Seattle Department of Transportation (SDOT), this dataset captures observations of individuals **staying still** in public spaces, including:

- Timestamps of observation  
- Demographic data (age, gender, mobility status)  
- Group size  
- Postures and activities (e.g., sitting, eating, socializing)  
- Weather conditions  

This data is collected following the [Gehl Institute’s Public Life Data Protocol](https://gehlinstitute.org/tool/public-life-data-protocol/).

---

## 🎯 Objective

To build a reproducible and automated data pipeline that includes:

1. **Extracting data** from the Seattle open data API.
2. **Transforming it** with Python and BigQuery SQL.
3. **Storing** it in optimized BigQuery tables (partitioned and clustered).
4. **Visualizing** it through an interactive dashboard.

---

## ⚙️ Architecture

![pipeline](images/pipeline.png)

---

## 🧰 Tech Stack

| Tool           | Purpose                            |
|----------------|------------------------------------|
| Terraform      | Infrastructure as code             |
| Kestra         | Workflow orchestration             |
| BigQuery       | Data warehousing and transformation|
| Google Cloud Storage | Intermediate file storage  |
| Looker Studio  | Data visualization                 |

---

## 🚀 How to Run the Pipeline

### 1. Prerequisites

- Google Cloud account with BigQuery, GCS, and service account access
- Docker installed (for Kestra and Python scripts)
- [Kestra](https://kestra.io/docs/) running locally (or on server)
- Google Cloud SDK (`gcloud`, `bq`)
- A billing-enabled GCP project

### 2. Setup Terraform

To create the necessary GCP resources (BigQuery dataset and GCS bucket), you can use the provided Terraform configuration.

This setup will:

- Initialize and apply the Terraform configuration  
- Provision the required GCP infrastructure (GCS bucket and BigQuery dataset)

> ⚠️ **Note**: Make sure you have `terraform` and `gcloud` installed and authenticated, and that your GCP project has billing enabled.

```bash
./terraform/setup.sh
This script will:
```

### 3. Setup Google Cloud Platform (GCP) with Kestra

Before we start loading data to GCP, we need to set up the Google Cloud Platform. 

First, adjust the following flow [`gcp_kv.yaml`](kestra/flows/gcp_kv.yaml) to include your service account, GCP project ID, BigQuery dataset and GCS bucket name (_along with their location_) as KV Store values:
- GCP_CREDS
- GCP_PROJECT_ID
- GCP_LOCATION
- GCP_DATASET
- GCP_BUCKET_NAME.

### GCP Workflow: Load Spotify tracks Data to GCP Bucket

The flow code: [`gcp_public_life_data_load.yaml`](kestra/flows/gcp_public_life_data_load.yaml).
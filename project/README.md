# Data Engineering Project: Public Life Data Pipeline

## Overview

This project demonstrates the development of a full data pipeline that processes public life data from Seattle. The pipeline includes data ingestion, transformation, and visualization in a dashboard to uncover insights about how people use public spaces over time.

## Dataset: [Public Life Data (People Staying)](https://data.seattle.gov/Transportation/Public-Life-Data-People-Staying/csd5-77em)

This project uses the [Public Life Data (People Staying)](https://data.seattle.gov/Transportation/Public-Life-Data-People-Staying/csd5-77em) dataset provided by the Seattle Department of Transportation (SDOT). It captures observations of individuals staying still in public spaces — such as those sitting, standing, or lingering — rather than people just passing through.

The dataset includes:

- Total number of people observed  
- Demographic breakdown (age, gender, mobility status)  
- Group sizes  
- Postures and activities (e.g., sitting, standing, socializing)  

These studies aim to support urban design, planning, and equity analysis by documenting how people use public spaces across sidewalks, parks, and plazas in Seattle.

The dataset is part of a broader public life study effort that follows the [Gehl Institute’s Public Life Data Protocol](https://gehlinstitute.org/tool/public-life-data-protocol/). Since 2017, SDOT and partner organizations have conducted these studies across the city.

## Objective

The main goal of this project is to build a reliable and automated data pipeline, which includes:

1. **Data Ingestion**: Load raw CSV data from Google Cloud Storage (GCS) into an external table in BigQuery.
2. **Transformations**: Process and optimize the data using SQL in BigQuery (partitioning, clustering, aggregations).
3. **Visualization**: Build an interactive dashboard with at least two charts to analyze trends and patterns in the data.

## Architecture

![pipeline.png](images/pipeline.png)

## Technologies Used

- **Terraform**: Automates infrastructure provisioning.
- **Kestra**: Orchestrates and manages the execution of the data pipeline.
- **BigQuery**: Stores and queries the data efficiently.
- **Google Cloud Storage (GCS)**: Stores raw CSV data files.
- **Looker Studio**: Visualizes processed data in interactive dashboards.

## How It Works

1. **Data Ingestion**: Data is loaded from a CSV file stored in GCS into an external table in BigQuery using Kestra.
2. **Transformation**: A SQL query is executed in BigQuery to transform the data (partitioned and aggregated by relevant metrics).
3. **Creating Optimized Tables**: The data is materialized into partitioned and clustered tables in BigQuery to improve query performance.
4. **Visualization**: The transformed data is visualized through a dashboard in Metabase or Looker Studio, showing trends and distributions across time and categories.

## How to Run

### Prerequisites

1. Google Cloud Platform account with appropriate permissions for BigQuery and GCS.
2. Kestra configured locally or on a server to orchestrate the pipeline.
3. Access to Metabase or Looker Studio to create the dashboard.
4. Google Cloud SDK (`gcloud` and `bq`) tools installed.

### Steps

1. **Kestra Setup**:
   - Ensure Kestra is configured in your environment.
   - Create configuration variables in Kestra for your `GCP_PROJECT_ID`, `GCP_DATASET`, `GCP_BUCKET_NAME`, etc.

2. **Loading the Data**:
   - Run the Kestra workflow to load the data from GCS into an external table in BigQuery.
   - Ensure the CSV files are uploaded to a GCS bucket accessible from your project.

3. **Data Transformation**:
   - Execute SQL queries in BigQuery to transform and optimize the data (e.g., partitioning and clustering).

4. **Creating the Dashboard**:
   - Create or import the dashboard in Metabase or Looker Studio.
   - Connect the dashboard to your BigQuery dataset and add visualizations based on the transformed data.

5. **Verify the Results**:
   - Open the dashboard and explore the visual insights (e.g., activity by site, demographic breakdowns over time).

## Configuration

- **GCP_PROJECT_ID**: `project-zoomcamp-457121`
- **GCP_DATASET**: `public_life_data_seattle`
- **GCP_BUCKET_NAME**: `your_bucket_name`
- **GCP_LOCATION**: `US`

### Kestra Configuration (Example)

```yaml
- id: gcp_project_id
  type: io.kestra.plugin.core.kv.Set
  key: GCP_PROJECT_ID
  kvType: STRING
  value: project-zoomcamp-457121

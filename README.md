# Capstone-Project

The goal of this project is to create a simple Data Pipeline in Google Cloud Platform that generates random log data by using Faker package in Python, sends it to the Cloud Pub/Sub, transforms in Cloud DatFlow and stores data in BigQuery table. 

1. Pub/Sub is a messaging service that uses a Publisher-Subscriber model allowing us to ingest data in real-time.
2. DataFlow is a service that simplifies creating data pipelines and automatically handles things like scaling up the infrastructure which means we can just concentrate on writing the code for our pipeline.
3. Cloud Storage is the object storage in GCP.
4. BigQuery is a cloud data warehouse. If you are familiar with other SQL style databases then BigQuery should be pretty straightforward.
5. Apache Beam allows us to create a pipeline for streaming or batch processing that integrates with GCP. It is particularly useful for parallel processing and is suited to Extract, Transform, and Load (ETL) type tasks so if we need to move data from one place to another while performing transformations or calculations Beam is a good choice.

# Capstone-Project

The goal of this project is to create a simple Data Pipeline in Google Cloud Platform that generates random log data by using Faker package in Python, sends it to the Cloud Pub/Sub, transforms in Cloud DatFlow and stores data in BigQuery table. 

1. Pub/Sub is a messaging service that uses a Publisher-Subscriber model allowing us to ingest data in real-time.
2. DataFlow is a service that simplifies creating data pipelines and automatically handles things like scaling up the infrastructure which means we can just concentrate on writing the code for our pipeline.
3. Cloud Storage is the object storage in GCP.
4. BigQuery is a cloud data warehouse. If you are familiar with other SQL style databases then BigQuery should be pretty straightforward.
5. Apache Beam allows us to create a pipeline for streaming or batch processing that integrates with GCP. It is particularly useful for parallel processing and is suited to Extract, Transform, and Load (ETL) type tasks so if we need to move data from one place to another while performing transformations or calculations Beam is a good choice.

## Diagram
<img width="722" alt="image" src="https://user-images.githubusercontent.com/51317733/179075466-88f398d1-3933-4a30-9132-29085eb22b4f.png">

## Streaming Pipeline steps:
1. Real-time log data is published to the Pub/Sub topic via Python script.
2. Then we create a Data Flow job which reads data from the topic and applies some transformations on the data.
3. After transforming the data, Beam will then connect to BigQuery and append the data to our table.
4. To carry out analysis we can connect to BigQuery using a variety of tools such as Tableau and Python.

## Batch Pipeline steps:
Batch pipeline is very similar to the streaming one but the difference is that the data is uploaded to the Cloud Storage and Data Flow transforms it.

## How to run the pipeline?

- Upload the code base to the Cloud Storage and run the following commands in the Cloud console:
- 
```
# Copy file from cloud storage
gsutil cp gs://<YOUR-BUCKET>/ * .
sudo pip install apache-beam[gcp] oauth2client==3.0.0 
sudo pip install -U pip
sudo pip install Faker==1.0.2
# Environment variables
BUCKET=<YOUR-BUCKET>
PROJECT=<YOUR-PROJECT>
```

- Run the script which generates random log data and pushes data to the Cloud Pub/Sub topic (you should see logs messages in the terminal):
```
python publish_logs.py
```
<img width="1490" alt="image" src="https://user-images.githubusercontent.com/51317733/179076574-22694d54-8a29-45e1-bd78-8724d8843539.png">

We can see topic metrics here:
<img width="1511" alt="image" src="https://user-images.githubusercontent.com/51317733/179076811-6b6a44cf-2ca8-4f93-9034-9eed096a4877.png">

- Run the Data Flow pipeline by the next command:
```
python main_pipeline_stream.py --runner DataFlow --project $PROJECT --temp_location $BUCKET/tmp --staging_location $BUCKET/staging --streaming
```
<img width="1500" alt="image" src="https://user-images.githubusercontent.com/51317733/179076744-45ad426a-b2c6-49a1-b68d-8739e0e3a4ce.png">

Job graph:
<img width="1510" alt="image" src="https://user-images.githubusercontent.com/51317733/179076865-dba532a6-ec90-4463-8a22-ec14b449888c.png">

- Query the data in BigQuery
```
SELECT * FROM `capstone-project-355520.log_data_dataset.log_data` 
```
<img width="1151" alt="image" src="https://user-images.githubusercontent.com/51317733/179077005-6e6d846d-1a64-4328-963c-bfe43011549c.png">

```

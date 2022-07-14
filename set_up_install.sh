#!/bin/bash

export GOOGLE_APPLICATION_CREDENTIALS="/Users/andrianhevalo/Desktop/capstone-project-355520-23887ef68a30.json"
export PROJECT="capstone-project-355520"
export BUCKET="gs://capstone-project-scripts"


apt-get install python-pip
sudo pip install apache-beam[gcp] oauth2client==3.0.0 
sudo pip install -U pip
sudo pip install Faker==1.0.2
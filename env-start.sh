#!/bin/bash

echo "Kill local-airflow container"
sudo docker kill local-airflow

echo "Delete local-airflow container"
sudo docker rm local-airflow

echo "Build my-airflow image"
sudo docker build -t my-airflow .

echo "Create and start local-airflow container from my-airflow image"
sudo docker run -d -v ${PWD}/dags:/usr/airflow/dags -p 8080:8080 --name local-airflow my-airflow
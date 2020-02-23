#!/bin/bash

echo "Kill local-airflow container"
sudo docker kill local-airflow

echo "Delete local-airflow container"
sudo docker rm local-airflow

echo "Delete my-airflow:latest image"
sudo docker rmi --force my-airflow:latest

echo "Delete python:3.7 image"
sudo docker rmi --force python:2.7
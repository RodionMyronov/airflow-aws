#!/bin/bash
echo "Kill local-airflow conatiner"
sudo docker kill local-airflow
echo "Delete local-airflow conatiner"
sudo docker rm local-airflow
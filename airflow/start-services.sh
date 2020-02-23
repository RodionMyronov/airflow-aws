#!/bin/bash

#/etc/init.d/postgresql start;
airflow webserver -p 8080 & airflow scheduler & airflow flower & airflow worker
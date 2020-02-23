FROM python:2.7

ENV LANG C.UTF-8

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install curl -y
RUN apt-get install nano -y
RUN apt-get install postgresql-11 -y
RUN apt-get install postgresql-contrib-11 -y
RUN apt-get install python-dev -y
RUN apt-get install libsasl2-dev -y
RUN apt-get install gcc -y



USER postgres

RUN /etc/init.d/postgresql start &&\
    psql --command "CREATE USER airflow WITH SUPERUSER PASSWORD 'airflow';" &&\
    createdb -O airflow airflow

USER root

WORKDIR /usr/airflow

ENV AIRFLOW_GPL_UNIDECODE yes
ENV AIRFLOW_HOME /usr/airflow

RUN pip install apache-airflow[postgres,celery,redis,ldap,kerberos]==1.10.9

COPY ./airflow/airflow.cfg ./
COPY ./airflow/start-services.sh ./

RUN /etc/init.d/postgresql start &&\
	airflow initdb &&\
	airflow create_user --username airflow --role Admin --email airflow@mydomain.com --firstname airflow --lastname admin --password airflow

RUN mkdir /usr/airflow/dags

CMD ["bash", "start-services.sh"]
import os
from airflow import configuration as conf
from flask_appbuilder.security.manager import AUTH_LDAP
basedir = os.path.abspath(os.path.dirname(__file__))
SQLALCHEMY_DATABASE_URI = conf.get('core', 'SQL_ALCHEMY_CONN')
CSRF_ENABLED = True
AUTH_TYPE = AUTH_LDAP
AUTH_ROLE_ADMIN = 'Admin'
AUTH_USER_REGISTRATION = True
AUTH_USER_REGISTRATION_ROLE = 'Admin'
AUTH_LDAP_SERVER = 'ldaps://ec2-52-57-8-11.eu-central-1.compute.amazonaws.com:636'
AUTH_LDAP_SEARCH = 'OU=users,OU=cdm-202002,DC=hadoop,DC=local'
AUTH_LDAP_BIND_USER = 'CN=airflow,OU=users,OU=cdm-202002,DC=hadoop,DC=local'
AUTH_LDAP_BIND_PASSWORD = 'lL*^dcOP(:7e7u6'
AUTH_LDAP_UID_FIELD = 'sAMAccountName'
AUTH_LDAP_USE_TLS = False
AUTH_LDAP_ALLOW_SELF_SIGNED = True
AUTH_LDAP_TLS_CACERTFILE = '/usr/airflow/ca_name.pem’
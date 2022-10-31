FROM apache/airflow:2.4.1

RUN pip install --no-cache-dir \
    google-cloud-bigquery==3.3.3

ENV PIP_USER=false

RUN python -m venv ~/.venv_dbt \
    && source ~/.venv_dbt/bin/activate \
    && pip install --no-cache-dir \
        dbt-bigquery==1.2.0 \
    && deactivate

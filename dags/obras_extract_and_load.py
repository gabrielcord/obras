import os
import yaml
import logging
import pandas as pd

from airflow.decorators import dag, task
from airflow.operators.empty import EmptyOperator
from airflow.utils.task_group import TaskGroup
from datetime import datetime
from google.cloud import bigquery

GCP_LOCATION = 'southamerica-east1'
DATASET_NAME = 'tcc_raw'

@dag(start_date=datetime(2022, 1, 1), schedule='@daily', catchup=False)
def obras_extract_and_load():

    @task
    def start(gcp_location, dataset_name):

        client = bigquery.Client(location=gcp_location)
        ds = client.create_dataset(dataset_name, exists_ok=True)

        logging.info(ds)

    start_task = start(gcp_location=GCP_LOCATION, dataset_name=DATASET_NAME)

    @task
    def extract_and_load(gcp_location, dataset_name, scope, year, url):

        client = bigquery.Client(location=gcp_location)

        df = pd.read_csv(url, sep=';')
        table_id = f'{dataset_name}.{scope}_{year}'

        client.delete_table(table_id, not_found_ok=True)

        job = client.load_table_from_dataframe(df, table_id)
        result = job.result()

        logging.info(result)

    with open(os.path.join(os.environ['AIRFLOW_HOME'], 'dags', 'obras_config.yaml'), 'r') as file:
        config = yaml.safe_load(file)

    with TaskGroup(group_id='extract_and_load') as extract_and_load_group:

        for source in config['sources']:

            extract_and_load.override(task_id=f"obras_{source['year']}")(
                gcp_location=GCP_LOCATION, 
                dataset_name=DATASET_NAME,
                scope='obras', 
                year=source['year'], 
                url=source['url']
            )

    end_task = EmptyOperator(task_id='end')        

    start_task >> extract_and_load_group >> end_task

extract_and_load_dag = obras_extract_and_load()

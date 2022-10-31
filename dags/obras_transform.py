import logging
import os
from airflow.decorators import dag, task
from airflow.operators.empty import EmptyOperator
from datetime import datetime
from dbt_dag_parser import DbtDagParser
from google.cloud import bigquery

GCP_LOCATION = 'southamerica-east1'
DATASET_NAME = 'tcc_curated'

DBT_ENV_BIN='~/.venv_dbt/bin'
DBT_PROJECT_DIR = '/opt/dbt/tcc_obras'
DBT_GLOBAL_CLI_FLAGS = "--no-write-json"
DBT_TARGET = 'tcc'

@dag(start_date=datetime(2022, 1, 1), schedule='@daily', catchup=False)
def obras_transform():

    @task
    def start(gcp_location, dataset_name):

        client = bigquery.Client(location=gcp_location)
        ds = client.create_dataset(dataset_name, exists_ok=True)

        logging.info(ds)

    start_task = start(gcp_location=GCP_LOCATION, dataset_name=DATASET_NAME)

    end_task = EmptyOperator(task_id='end')

    dag_parser = DbtDagParser(
        dbt_global_cli_flags=DBT_GLOBAL_CLI_FLAGS,
        dbt_project_dir=DBT_PROJECT_DIR,
        dbt_profiles_dir=DBT_PROJECT_DIR,
        dbt_target=DBT_TARGET,
        dbt_env_bin=DBT_ENV_BIN
    )

    dbt_run_group = dag_parser.get_dbt_run_group()
    dbt_test_group = dag_parser.get_dbt_test_group()

    start_task >> dbt_run_group >> dbt_test_group>> end_task

transform_dag = obras_transform()

from airflow.providers.postgres.operators.postgres import PostgresOperator
from datetime import datetime
from airflow import DAG
from sql.common import *
redshift_conn_id = "redshift_conn_pg_01"
with DAG(
    dag_id="postgres_redshift_dag",
    start_date=datetime(2021, 1, 1),
    schedule_interval=None,
    catchup=False,
    tags=['example_01'],
) as dag:
    setup__task_create_table = PostgresOperator(postgres_conn_id=redshift_conn_id,
                                                task_id='setup__create_table',
                                                sql=create_fruit_tb,
                                                )
    task_insert_data = PostgresOperator(
        postgres_conn_id=redshift_conn_id,
        task_id='task_insert_data',
        sql=insert_data,
    )
    task_get_all_table_data = PostgresOperator(
        postgres_conn_id=redshift_conn_id,
        task_id='task_get_all_table_data', sql=create_more_fruit_from_fruit
    )
    setup__task_create_table >> task_insert_data >> task_get_all_table_data

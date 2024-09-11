#!/home/nap24/bin/python-venv/airflow/bin/python

from cwl_airflow.extensions.cwldag import CWLDAG


dag = CWLDAG(
    workflow="/home/nap24/bin/pipeline-engines/engines/toil/7.0.0/filter_and_count.cwl",
    dag_id="filter_and_count"
)
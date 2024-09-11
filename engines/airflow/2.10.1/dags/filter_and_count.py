from datetime import datetime

from airflow import DAG
from airflow.decorators import task
from airflow.models.param import Param, NOTSET
from airflow.operators.bash import BashOperator

with DAG(
    dag_id="filter_and_count",
    description="Filters out Indels and Counts the SNVs in VCF File",
    params={
        "all_variants": Param(default="", type="string"),
        "filtered_vcf_file_basename": Param(default="", type="string")
    }
) as dag:
  @task.docker(image="biocontainers/vcftools:v0.1.16-1-deb_cv1")
  def filter(params):
    return (
        f"""
        vcftools --vcf {params["all_variants"]} --remove-indels \
            --recode --recode-INFO-all \
            --out {params["filtered_vcf_file_basename"]}
        """
    )

  filter = filter()

  filter

if __name__ == "__main__":
  dag.test(
      run_conf={
          "filtered_vcf_file_basename": "00-All_papu_filtered",
          "all_variants": "/home/nap24/bin/pipeline-engines/00-All_papu2.vcf",
      }
  )

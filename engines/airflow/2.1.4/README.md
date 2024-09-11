# Apache Airflow 2.1.4

## Installation
1. Install miniconda 3.9: https://docs.anaconda.com/miniconda/
2. Make a venv for airflow:
```bash
mkdir -p ~/bin/python-venv/airflow
/usr/local/miniconda3/bin/python -m venv ~/bin/python-venv/airflow
```
3. Install airflow-cwl
```bash
pip install cwl-airflow --constraint "https://raw.githubusercontent.com/Barski-lab/cwl-airflow/master/packaging/constraints/constraints-3.7.txt"
```

### WARNING: NEVER GOT Airflow 2.1.4 with CWL WORKING
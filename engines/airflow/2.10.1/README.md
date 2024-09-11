# Apache Airflow 2.10.1

## Installation
1. Install miniconda 3.11: https://docs.anaconda.com/miniconda/
2. Make a venv for airflow:
```bash
mkdir -p ~/bin/python-venv/airflow2.10
/usr/local/miniconda3/bin/python -m venv ~/bin/python-venv/airflow2.10
```
3. Install airflow
```bash
export AIRFLOW_HOME=~/bin/pipeline-engines/engines/airflow/2.10.1/home
AIRFLOW_VERSION=2.10.1
source ~/bin/python-venv/airflow2.10/bin/activate
PYTHON_VERSION="$(python -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')"
CONSTRAINT_URL="https://raw.githubusercontent.com/apache/airflow/constraints-${AIRFLOW_VERSION}/constraints-${PYTHON_VERSION}.txt"
pip install "apache-airflow==${AIRFLOW_VERSION}" --constraint "${CONSTRAINT_URL}"
pip install virtualenv apache-airflow-providers-docker
```
4. Edit the config to point to the dags folder:
```bash
vim $AIRFLOW_HOME/airflow.cfg
# Change line 7 to:
dags_folder = engines/airflow/2.10.1/dags
```

## Execution Command
1. Run the Server
```bash
source ~/bin/python-venv/airflow2.10/bin/activate
export AIRFLOW_HOME=~/bin/pipeline-engines/engines/airflow/2.10.1/home
airflow standalone
```
2. Open a new tab.
```bash
source ~/bin/python-venv/airflow2.10/bin/activate
export AIRFLOW_HOME=~/bin/pipeline-engines/engines/airflow/2.10.1/home
airflow dags test filter_and_count
```

## Warning: Coundn't Run it
Error:
```
bash: python3: command not found
```
It seems like a [@task.docker decorator](https://airflow.apache.org/docs/apache-airflow-providers-docker/stable/decorators/docker.html) requires python to work.
I need a docker task that runs a bash command instead.
More info about using [dependency sepation](https://airflow.apache.org/docs/apache-airflow/stable/tutorial/taskflow.html#dependency-separation-using-docker-operator) with docker in Airflow.
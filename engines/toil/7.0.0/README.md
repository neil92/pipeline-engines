# Toil 7.0.0

## Installation
1. Install miniconda 3.11: https://docs.anaconda.com/miniconda/
2. Make a venv for toil:
```bash
mkdir -p ~/bin/python-venv/toil7
/usr/local/miniconda3.11/bin/python -m venv ~/bin/python-venv/toil7
```
3. Install toil with WDL and CWL:
```bash
cd ~/bin/python-venv/toil7/bin
source activate
pip install toil[cwl,wdl]==7.0.0
```

## Execution Comand
```bash
(toil7) nap24@nitrogen:~/bin/pipeline-engines/engines/toil/7.0.0$ toil-cwl-runner example.cwl example-job.yaml
deactivate
```
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
For CWL:
```bash
(toil7) nap24@nitrogen:~/bin/pipeline-engines/engines/toil/7.0.0$ toil-cwl-runner filter_and_count.cwl \
    filter_and_count_inputs.yaml
deactivate
```

For WDL:
```bash
toil-wdl-runner ../../cromwell/87/filter_and_count.wdl ../../cromwell/57/filter_and_count_inputs.json
```

## Notes:
Took me awhile to get used to writing CWL, and debugging this was kind of difficult. The debugger didn't give me a line
number. It mostly told me that a section was missing from CWL (which does narrow it down a lot). The commands are
completely made dynamically, and there's nothing reminiscent of python fstrings which makes coding this very tedious.
I'd rather write something similar to bash. It will be a lot faster to write, easier to debug, and maintain.
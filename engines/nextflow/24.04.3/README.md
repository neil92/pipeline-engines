# Nextflow 24.04.3

# Installation
1. Download nextflow-24.04.3-all: https://github.com/nextflow-io/nextflow/releases/tag/v24.04.3
2. Make it executable: `chmod +x nextflow-24.04.3-all`

# Execution Command
```
cd engines/nextflow/24.04.3
/home/nap24/bin/nextflow/nextflow-24.04.3-all -c filter_and_count_inputs.config run filter_and_count.nf
```

# Notes
The language is a lot more complex and more like programming. This allows you to do more within Nextflow (e.g. parsing
out something from the sample name would be hard in cromwell), but it also makes the code a lot more complicated and
harder to follow.
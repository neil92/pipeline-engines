# Nextflow 24.04.3

## Installation
1. Install Open JDK 17
2. Download nextflow-24.04.3-all: https://github.com/nextflow-io/nextflow/releases/tag/v24.04.3
3. Make it executable: `chmod +x nextflow-24.04.3-all`

## Setup Cloud Cloud
1. Create service account that has access to Google Storage bucket. Download json key.
2. Set GOOGLE_APPLICATION_CREDENTIALS env variable as described in: [Google Batch Docs](https://www.nextflow.io/docs/stable/google.html#cloud-batch)
3. Enable [Google Batch API](https://console.cloud.google.com/apis/library/batch.googleapis.com)

## Execution Command
```bash
cd engines/nextflow/24.04.3
/home/nap24/bin/nextflow/nextflow-24.04.3-all -c filter_and_count_inputs.config run filter_and_count.nf
```
gcp:
```
/apps/nextflow_24/nextflow-24.04.3-all -c filter_and_count_gcp.config run filter_and_count.nf
```

## Notes
The language is a lot more complex and more like programming. This allows you to do more within Nextflow (e.g. parsing
out something from the sample name would be hard in cromwell), but it also makes the code a lot more complicated and
harder to follow.


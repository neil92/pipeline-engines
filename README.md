# Pipeline Engines Compared
Building a simple bioinformatics pipeline in differerent pipeline engines to see how easy it use them.

Going to try to compare:
1. [Cromwell](https://cromwell.readthedocs.io/en/latest/)
    * Notes on running cromwell: [version 57](engines/cromwell/57/README.md) and
      [version 87](engines/cromwell/87/README.md)
2. [Nextflow](https://www.nextflow.io/)
    * Notes on running nextflow: [version 24.04.3](engines/nextflow/24.04.3/README.md)
3. [Toil](https://toil.readthedocs.io/en/latest/)
    * Notes on running toil: [version 7.0.0](engines/toil/7.0.0/README.md)
4. [Airflow](https://airflow.apache.org/)
    * Notes on running airflow: [version 2.4.1](engines/airflow/2.1.4/README.md) and [version 2.10.1](engines/airflow/2.10.1/README.md)

Steps of the pipeline:
1. Filter VCF file to remove indels.
   https://vcftools.sourceforge.net/man_latest.html#SITE%20FILTERING%20OPTIONS
2. Count the remaining variants after filtration. Output results.
   https://gatk.broadinstitute.org/hc/en-us/articles/360036896612-CountVariants

VCF Downloaded from:
1. https://www.ncbi.nlm.nih.gov/variation/docs/human_variation_vcf/
2. Then got the head: `head -n 1000 00-All_papu.vcf > 00-All_papu2.vcf`
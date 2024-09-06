#!/usr/bin/env toil-cwl-runner
cwlVersion: v1.2
class: CommandLineTool
baseCommand: [vcftools, --remove-indels, --recode, --recode-INFO-all]
hints:
  DockerRequirement:
    dockerPull: biocontainers/vcftools:v0.1.16-1-deb_cv1
inputs:
  all_variants:
    type: File
    inputBinding:
      prefix: --vcf
  filtered_vcf_file_basename:
    type: string
    inputBinding:
      prefix: --out
outputs:
  filtered_vcf:
    type: File
    outputBinding:
      glob: '*.recode.vcf'
#!/usr/bin/env toil-cwl-runner
cwlVersion: v1.2
class: Workflow
inputs:
  all_variants:
    type: File
  filtered_vcf_file_basename:
    type: string
  count_file:
    type: string
outputs:
  count_output:
    type: File
    outputSource: count_vcf/count_output
steps:
  filter_vcf:
    run:
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
    in:
      all_variants: all_variants
      filtered_vcf_file_basename: filtered_vcf_file_basename
    out: [filtered_vcf]
  
  count_vcf:
    run:
      class: CommandLineTool
      baseCommand: [gatk, CountVariants]
      hints:
        DockerRequirement:
          dockerPull: pegi3s/gatk-4:4.1.4.1
      requirements:
        NetworkAccess:
          networkAccess: true
      inputs:
        count_file:
          type: string
        filtered_vcf:
          type: File
          inputBinding:
            prefix: -V
      stdout: $(inputs.count_file)
      outputs:
        count_output:
          type: stdout
    in:
      filtered_vcf:
        source: filter_vcf/filtered_vcf
      count_file: count_file
    out: [count_output]
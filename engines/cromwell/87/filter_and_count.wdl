version 1.0

task filter {
  input {
    File all_variants
    String filtered_vcf_file_basename
  }
  command {
    vcftools --vcf ${all_variants} --remove-indels \
        --recode --recode-INFO-all \
        --out ${filtered_vcf_file_basename}
  }
  runtime {
    docker: "biocontainers/vcftools:v0.1.16-1-deb_cv1"
  }
  output {
    File filtered_vcf="${filtered_vcf_file_basename}.recode.vcf"
  }
}

task count {
  input {
    File filtered_vcf
    String count_file
  }
  command {
    gatk CountVariants -V ${filtered_vcf} > ${count_file}
  }
  runtime {
    docker: "pegi3s/gatk-4:latest"
  }
  output {
    File output_vcf=filtered_vcf
    File count="${count_file}"
  }
}

workflow filter_and_count {
  input {
    File all_variants
    String filtered_vcf_file_basename
    String count_file
  }
  call filter {
    input: all_variants=all_variants,
      filtered_vcf_file_basename=filtered_vcf_file_basename
  }
  call count {
    input: filtered_vcf=filter.filtered_vcf,
      count_file=count_file
  }
}
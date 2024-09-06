params.all_variants
params.filtered_vcf_file_basename
params.count_file

process filter_vcf {
  input:
  file all_variants
  val filtered_vcf_file_basename

  output:
  path "${filtered_vcf_file_basename}.recode.vcf"

  script:
  """
  vcftools --vcf ${all_variants} --remove-indels \
      --recode --recode-INFO-all \
      --out ${filtered_vcf_file_basename}
  head "${filtered_vcf_file_basename}.recode.vcf"
  """
}

process count_vcf {
  input:
  file filtered_vcf
  val count_file
  
  output:
  path count_file
  
  script:
  """
  gatk CountVariants -V ${filtered_vcf} > "${count_file}"
  """
}

workflow {
  main:
  filtered_vcf = filter_vcf(file(params.all_variants), params.filtered_vcf_file_basename)
  count_file_vcf = count_vcf(filtered_vcf, params.count_file)

  emit:
  count_vcf.out
}
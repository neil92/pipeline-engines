process filter {
  input:
    file all_variants
    val filtered_vcf_file_basename

  output:
    filtered_vcf=file("$filtered_vcf_file_basename.recode.vcf")

  script:
  """
  vcftools --vcf ${all_variants} --remove-indels \
      --recode --recode-INFO-all \
      --out ${filtered_vcf_file_basename}
  """
}

process count {
  input:
    file filtered_vcf
    val count_file
  
  output:
    output_vcf=filtered_vcf
    count=file("${count_file}")
  
  script:
  """
  gatk CountVariants -V ${filtered_vcf} > ${count_file}
  """
}

workflow filter_and_count {
  take:
    path all_variants
    val filtered_vcf_file_basename
    val count_filename

  main:
    filtered_vcf = filter(all_variants, filtered_vcf_file_basename)
    (output_vcf, count_file) = count(filtered_vcf, count_filename)
  
  emit:
    count_file.out
}
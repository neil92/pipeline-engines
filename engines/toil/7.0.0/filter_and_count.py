#!/home/nap24/bin/python-venv/toil7/bin/python

import os
from argparse import ArgumentParser
from toil.common import Toil
from toil.job import Job
from toil.lib.docker import apiDockerCall


def setup_arguments():
  parser = ArgumentParser()
  parser.add_argument("-a", "--all-variants", type=str, dest="all_variants", required=True,
                      help="The file (absolute path) that contains all variants to filter.")
  parser.add_argument("-f", "--filter-file", type=str, dest="filtered_vcf_file_basename", default="filtered",
                      help="The basename (without file extension) of the new file that will be created post-filter.")
  Job.Runner.addToilOptions(parser)
  return parser.parse_args()


def filter(job, all_variants, filtered_vcf_file_basename, memory="1G", cores=1, disk="1G"):
  job_temp_dir = job.tempDir;
  docker_scratch_dir = "/data"
  all_variants_job_temp = job.fileStore.readGlobalFile(all_variants)
  all_variants_docker_temp = f"/data/{os.path.basename(all_variants_job_temp)}"
  filtered_vcf_docker = os.path.join(docker_scratch_dir, filtered_vcf_file_basename)
  filtered_vcf_job = os.path.join(job_temp_dir, filtered_vcf_file_basename)
  filter_command = [
      "vcftools",
      "--vcf", all_variants_docker_temp,
      "--remove-indels", "--recode", "--recode-INFO-all",
      "--out", filtered_vcf_docker
  ]
  output = apiDockerCall(job, image="biocontainers/vcftools:v0.1.16-1-deb_cv1", working_dir=job_temp_dir,
                parameters=filter_command)
  filtered_vcf_file = job.fileStore.writeGlobalFile(f"{filtered_vcf_job}.recode.vcf")
  return filtered_vcf_file


def main():
  options = setup_arguments()
  with Toil(options) as toil:
    all_variants_file = toil.importFile("file://" + options.all_variants)
    output = toil.start(Job.wrapJobFn(filter, all_variants_file, options.filtered_vcf_file_basename))
  print(output)


if __name__ == "__main__":
  main()

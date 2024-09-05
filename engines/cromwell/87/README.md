# Cromwell 87

# Installation
1. Download JDK 11: https://www.oracle.com/java/technologies/javase/jdk11-archive-downloads.html
2. Download cromwell-87.jar: https://github.com/broadinstitute/cromwell/releases/tag/87

# Execution command:
```bash
/home/nap24/bin/jdk/jdk-11.0.23/bin/java -jar /home/nap24/bin/cromwell-bin/cromwell-87.jar \
    run -i engines/cromwell/57/filter_and_count_inputs.json engines/cromwell/87/filter_and_count.wdl
```

Cromwell 87 can run draft-2 WDL. You just have to specify that it is draft-2 at the version number line (i.e. 1st line)
in the filter_and_count.wdl
```
/home/nap24/bin/jdk/jdk-11.0.23/bin/java -jar /home/nap24/bin/cromwell-bin/cromwell-87.jar \
    run -i engines/cromwell/57/filter_and_count_inputs.json engines/cromwell/57/filter_and_count.wdl
```

# Conversion Notes:
The only thing I had to change was the following:
1. Version line on line 1 of the code.
2. Encasing all the inputs in curly braces.
```bash
diff engines/cromwell/57/filter_and_count.wdl engines/cromwell/87/filter_and_count.wdl 
```
Result:
```diff
1c1
< #draft-2
---
> version 1.0
4,6c4,7
<   File all_variants
<   String filtered_vcf_file_basename
< 
---
>   input {
>     File all_variants
>     String filtered_vcf_file_basename
>   }
21,23c22,25
<   File filtered_vcf
<   String count_file
< 
---
>   input {
>     File filtered_vcf
>     String count_file
>   }
37,40c39,43
<   File all_variants
<   String filtered_vcf_file_basename
<   String count_file
< 
---
>   input {
>     File all_variants
>     String filtered_vcf_file_basename
>     String count_file
>   }
```
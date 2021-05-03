#!/bin/bash

module load bioinfo-tools
module load FastQC


	for j in ../1.4.2_RNA_trimming/*.fastq.gz
	do
    		echo "Running $j ..."
    		fastqc -t 1 -o /home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.3_trimmed_QC "$j"
	done

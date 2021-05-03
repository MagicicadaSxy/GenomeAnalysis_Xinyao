#!/bin/bash

module load bioinfo-tools
module load FastQC


	for j in /home/magici/GA/data/sel3/rna_seq_data/trimmed/*.fastq.gz
	do
    		echo "Running $j ..."
    		fastqc -t 1 -o /home/magici/GA/1_preprocessing/1.2_RNA_QC "$j"
	done

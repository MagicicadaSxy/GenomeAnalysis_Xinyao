#!/bin/bash

module load bioinfo-tools
module load FastQC


	for j in /home/magici/GA/data/sel3/rna_seq_data/raw/*.fastq.gz
	do
    		echo "Running $j ..."
    		fastqc -t 1 -o /home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.1_raw_QC "$j"
	done

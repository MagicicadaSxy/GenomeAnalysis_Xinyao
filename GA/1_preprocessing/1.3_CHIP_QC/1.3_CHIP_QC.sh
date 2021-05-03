#!/bin/bash

module load bioinfo-tools
module load FastQC


	for j in /home/magici/GA/data/sel3/chip_seq_data//*.fastq.gz
	do
    		echo "Running $j ..."
    		fastqc -t 1 -o /home/magici/GA/1_preprocessing/1.3_CHIP_QC "$j"
	done

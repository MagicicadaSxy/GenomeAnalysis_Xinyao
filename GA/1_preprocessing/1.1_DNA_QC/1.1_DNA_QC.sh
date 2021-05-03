#!/bin/bash

module load bioinfo-tools
module load FastQC


	for j in /home/magici/GA/data/sel3/wgs_data/*.fastq.gz
	do
    		echo "Running $j ..."
    		fastqc -t 1 -o /home/magici/GA/1_preprocessing/1.1_DNA_QC "$j"
	done

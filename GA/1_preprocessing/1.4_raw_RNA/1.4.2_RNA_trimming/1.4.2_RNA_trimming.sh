#!/bin/bash -l

module load bioinfo-tools
module load trimmomatic


java -jar /sw/apps/bioinfo/trimmomatic/0.36/rackham/trimmomatic-0.36.jar PE -phred33 \
/home/magici/GA/data/sel3/rna_seq_data/raw/sel3_SRR1719266.1.fastq.gz \
/home/magici/GA/data/sel3/rna_seq_data/raw/sel3_SRR1719266.2.fastq.gz \
/home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.2_RNA_trimming/sel3_SRR1719266.trim_1P.fastq.gz \
/home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.2_RNA_trimming/sel3_SRR1719266.trim_1U.fastq.gz \
/home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.2_RNA_trimming/sel3_SRR1719266.trim_2P.fastq.gz \
/home/magici/GA/1_preprocessing/1.4_raw_RNA/1.4.2_RNA_trimming/sel3_SRR1719266.trim_2U.fastq.gz \
ILLUMINACLIP:/sw/bioinfo/trimmomatic/0.36/rackham/adapters/TruSeq3-PE-2.fa:2:30:10 LEADING:3 SLIDINGWINDOW:4:15 MINLEN:36

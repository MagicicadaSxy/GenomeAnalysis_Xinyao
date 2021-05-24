#!/bin/bash


#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 21:00:00
#SBATCH -J filter_sel3
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se


cd /domus/h1/magici/GA/3_annotation/3.4_functional_annotation/

# filter the data of sel3
awk -F'\t' '{if($1~/NW_015504249/) print $0}'  GCF_001595765.1_Mnat.v1_genomic.gff > sel3.gff

# gff file to genome.fasta file
module load BEDTools/2.29.2
bedtools getfasta -fi /domus/h1/magici/GA/sel3_NW_015504249.fna -bed sel3.gff -fo sel3_genome.fasta

# genome.fasta to protein.fasta
module load emboss/6.6.0
transeq sel3_genome.fasta protein.fasta

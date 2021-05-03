#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 21:00:00
#SBATCH -J hard_mask
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se

# Load modules
module load bioinfo-tools
module load RepeatMasker/4.1.0

# not using the library
RepeatMasker -q -species mammal /home/magici/GA/2_assembly/2.1_DNA_assembly/closed_gaps.fasta

#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 1
#SBATCH -t 10:00:00
#SBATCH -J mummerplot_for_soapdenovo
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se

# Load modules
module load bioinfo-tools
module load MUMmer

# comments
nucmer --prefix /home/magici/GA/2_assembly/2.1_DNA_assembly/assessment/mum \
/home/magici/GA/sel3_NW_015504249.fna \
/home/magici/GA/2_assembly/2.1_DNA_assembly/closed_gaps.fasta


mummerplot -x "[0,4000000]" -y "[0,4000000]" --png --layout --filter -p \
/home/magici/GA/2_assembly/2.1_DNA_assembly/assessment/mum \
/home/magici/GA/2_assembly/2.1_DNA_assembly/assessment/mum.delta \
-R /home/magici/GA/sel3_NW_015504249.fna \
-Q /home/magici/GA/2_assembly/2.1_DNA_assembly/closed_gaps.fasta

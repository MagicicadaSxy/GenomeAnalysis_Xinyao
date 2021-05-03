#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 12
#SBATCH -t 24:00:00
#SBATCH -J DNA_assmbly_quality_SOAPdenovo
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se




# Load modules
module load bioinfo-tools
module load soapdenovo

# commands
/sw/apps/bioinfo/SOAPdenovo/2.04-r240/rackham/bin/GapCloser \
-b /home/magici/GA/2_assmbly/2.1_DNA_assmbly/soapdenovo.config \
-a /home/magici/GA/2_assmbly/2.1_DNA_assmbly/result.scafSeq \
-o /home/magici/GA/2_assmbly/2.1_DNA_assmbly/closed_gaps.fasta

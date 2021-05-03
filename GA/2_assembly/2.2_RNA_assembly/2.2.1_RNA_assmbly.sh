#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 12
#SBATCH -t 24:00:00
#SBATCH -J DNA_assmbly_SOAPdenovo
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se


module load bioinfo-tools

/sw/bioinfo/SOAPdenovo/2.04-r240/rackham/bin/SOAPdenovo-63mer all -s soapdenovo.config -K 49 -o /home/magici/GA/2_assmbly/2.1_DNA_assmbly/result


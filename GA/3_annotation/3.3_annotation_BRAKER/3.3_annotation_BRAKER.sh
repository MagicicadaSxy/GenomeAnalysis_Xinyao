#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 20:00:00
#SBATCH -J annotation_BRAKER
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se

# Load modules
module load bioinfo-tools
module load  braker/2.1.5
#module load augustus/3.2.3_Perl5.24.1
module load augustus/20200703-dd2dd8f
module load bamtools/2.5.1
module load blast/2.9.0+
module load GenomeThreader/1.7.0
module load samtools/1.8
module load GeneMark/4.62-es


# cp /sw/bioinfo/augustus/20200703-dd2dd8f/rackham/config/ ./
# chmod -R 777 ./config/

export AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/20200703-dd2dd8f/rackham/bin/
export AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/20200703-dd2dd8f/rackham/scripts
export GENEMARK_PATH=/sw/bioinfo/GeneMark/4.62-es/rackham
export AUGUSTUS_CONFIG_PATH=/home/magici/GA/3_annotation/3.3_annotation_BRAKER/config 


#
braker.pl --species=bat  --genome=/home/magici/GA/sel3_NW_015504249.fna \
 --gff3 --AUGUSTUS_CONFIG_PATH=/home/magici/GA/3_annotation/3.3_annotation_BRAKER/config \
 --AUGUSTUS_BIN_PATH=/sw/bioinfo/augustus/20200703-dd2dd8f/rackham/bin/ \
 --AUGUSTUS_SCRIPTS_PATH=/sw/bioinfo/augustus/20200703-dd2dd8f/rackham/scripts \
 --GENEMARK_PATH=/sw/bioinfo/GeneMark/4.62-es/rackham \
 --cores=2 \
 --bam=/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/013P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/014P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/015P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/016P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/017P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/018P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/204P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/206P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/207P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/208P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/209P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/211P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/212P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/213P_Aligned.sortedByCoord.out.bam,/home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM/214P_Aligned.sortedByCoord.out.bam  

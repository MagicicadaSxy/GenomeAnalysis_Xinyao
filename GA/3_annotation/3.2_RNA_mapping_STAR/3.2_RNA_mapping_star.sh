#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 05:00:00
#SBATCH -J RNA_mapping_STAR
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se

# Load modules
module load bioinfo-tools
module load gcc/6.2.0 
module load star/2.7.2b


# create a genome index
STAR --runThreadN 8 \
--runMode genomeGenerate \
--limitBAMsortRAM 3056146928 \
--genomeChrBinNbits 9 \
--genomeSAindexNbases 12 \
--genomeDir /home/magici/GA/3_annotation/3_2_RNA_mapping_STAR \
--genomeFastaFiles /home/magici/GA/3_annotation/3.1_repeatmasker/hardmask/closed_gaps.fasta.masked \

# read alignment
STAR --runThreadN 2 \
--genomeDir /home/ziqi/Ziqi_Genome_Analysis/result/7_rna_mapping/index \
--readFilesIn /home/ziqi/Ziqi_Genome_Analysis/2_Eckalbar_2016/sel3/rna_seq_data/trimmed/*.fastq.gz \
--outFileNamePrefix /home/ziqi/Ziqi_Genome_Analysis/result/7_rna_mapping/star/Mnat \
--outSAMtype BAM SortedByCoordinate \
--readFilesCommand zcat

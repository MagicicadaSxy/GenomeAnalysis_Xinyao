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
STAR --runThreadN 2 \
--runMode genomeGenerate \
--genomeChrBinNbits 18 \
--genomeSAindexNbases 9 \
--genomeDir /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/index \
--genomeFastaFiles /home/magici/GA/sel3_NW_015504249.fna \

# reads alignment

for num in 013 014 015 016 017 018 204 206 207 208 209 211 212 213 214 241 242
	do
		file1=/home/magici/GA/data/sel3/rna_seq_data/trimmed/sel3_SRR1719"$num".trim_1P.fastq.gz
		file2=/home/magici/GA/data/sel3/rna_seq_data/trimmed/sel3_SRR1719"$num".trim_2P.fastq.gz		
		

		STAR --runThreadN 2 \
                     --genomeDir /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/index \
                     --readFilesIn $file1 $file2 \
                     --outFileNamePrefix /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/"$num"P_ \
                     --outSAMtype BAM SortedByCoordinate \
                     --readFilesCommand zcat



		file3=/home/magici/GA/data/sel3/rna_seq_data/trimmed/sel3_SRR1719"$num".trim_1U.fastq.gz
                file4=/home/magici/GA/data/sel3/rna_seq_data/trimmed/sel3_SRR1719"$num".trim_2U.fastq.gz

		echo 
                STAR --runThreadN 2 \
                     --genomeDir /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/index \
                     --readFilesIn $file3 $file4 \
                     --outFileNamePrefix /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/"$num"U_ \
                     --outSAMtype BAM SortedByCoordinate \
                     --readFilesCommand zcat


	done
	

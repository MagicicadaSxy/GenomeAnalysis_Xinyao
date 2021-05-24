#!/bin/bash -l

#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 1:00:00
#SBATCH -J differential_expression
#SBATCH --mail-type=ALL
#SBATCH --mail-user xinyao.sun.6017@student.uu.se

module load bioinfo-tools
module load samtools/1.12
module load htseq/0.12.4

# select all paired bam file 
cp -R  /home/magici/GA/3_annotation/3.2_RNA_mapping_STAR/BAM /domus/h1/magici/GA/4_dif_exp/
cd /domus/h1/magici/GA/4_dif_exp/BAM
rm -r ./*U_Ali*

# merge
# forlimb_cs15
samtools merge forlimb_cs15.bam 013P_Aligned.sortedByCoord.out.bam 014P_Aligned.sortedByCoord.out.bam 015P_Aligned.sortedByCoord.out.bam

# forlimb_cs16
samtools merge forlimb_cs16.bam 204P_Aligned.sortedByCoord.out.bam 206P_Aligned.sortedByCoord.out.bam 207P_Aligned.sortedByCoord.out.bam

# forlimb_cs17
samtools merge forlimb_cs17.bam 208P_Aligned.sortedByCoord.out.bam 209P_Aligned.sortedByCoord.out.bam 211P_Aligned.sortedByCoord.out.bam

# hindlimb_cs15
samtools merge hindlimb_cs15.bam 016P_Aligned.sortedByCoord.out.bam 017P_Aligned.sortedByCoord.out.bam 018P_Aligned.sortedByCoord.out.bam

# hindlimb_cs16
samtools merge hindlimb_cs16.bam 212P_Aligned.sortedByCoord.out.bam 242P_Aligned.sortedByCoord.out.bam 214P_Aligned.sortedByCoord.out.bam

# hindlimb_cs17
samtools merge hindlimb_cs17.bam 213P_Aligned.sortedByCoord.out.bam 241P_Aligned.sortedByCoord.out.bam 266P_Aligned.sortedByCoord.out.bam

cp -r ./*_cs* ../
cd ..

for file in *.bam
	do
		htseq-count -f bam -s no -t gene -i ID $file /domus/h1/magici/GA/3_annotation/3.4_functional_annotation/sel3.gff > htseq_count_$file.txt
	done

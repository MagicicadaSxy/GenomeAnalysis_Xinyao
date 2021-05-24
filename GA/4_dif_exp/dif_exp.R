setwd("D:\\ubuntu\\rootfs\\root\\GenomeAnalysis_Xinyao\\GA\\4_dif_exp")

library(DESeq2)
library(pheatmap)
library(dplyr)
library(RColorBrewer)
library(ggplot2)

f_cs15 <- read.table("htseq_count_forlimb_cs15.bam.txt")[1:43,]
f_cs16 <- read.table("htseq_count_forlimb_cs16.bam.txt")[1:43,]
f_cs17 <- read.table("htseq_count_forlimb_cs17.bam.txt")[1:43,]
h_cs15 <- read.table("htseq_count_hindlimb_cs15.bam.txt")[1:43,]
h_cs16 <- read.table("htseq_count_hindlimb_cs16.bam.txt")[1:43,]
h_cs17 <- read.table("htseq_count_hindlimb_cs17.bam.txt")[1:43,]

data <- cbind.data.frame(f_cs15$V2,f_cs16$V2,f_cs17$V2,h_cs15$V2,h_cs16$V2,h_cs17$V2)
colnames(data) <- c("f_cs15","f_cs16","f_cs17","h_cs15","h_cs16","h_cs17")
rownames(data) <- f_cs15$V1

type <- factor(c(rep("forlimb", 3), rep("hindlimb", 3)))
time <- factor(c("cs15","cs16","cs17","cs15","cs16","cs17"))
coldata <- data.frame(row.names=colnames(data), type,time)

dds <- DESeqDataSetFromMatrix(countData=data, colData=coldata, design= ~type+time) %>%
  DESeq() %>%
  .[rowSums(counts(.)) >= 10,]
  
res <- results(dds)

resultsNames(dds)

resLFC_H_F <- lfcShrink(dds, coef="type_hindlimb_vs_forlimb", type="apeglm")
resLFC_H_F

resLFC_16_15 <- lfcShrink(dds, coef="time_cs16_vs_cs15", type="apeglm")
resLFC_16_15

resLFC_17_15 <- lfcShrink(dds, coef="time_cs17_vs_cs15", type="apeglm")
resLFC_17_15

plotMA(res)
plotMA(resLFC_H_F)
plotMA(resLFC_16_15)
plotMA(resLFC_17_15)


#plotCounts(dds, gene=which.min(res$padj), intgroup="type")


rld <- rlog(dds, blind=FALSE)
select <- order(rowMeans(counts(dds,normalized=TRUE)),
                decreasing=TRUE)
df <- as.data.frame(colData(dds)[,c("time","type")])
pheatmap(assay(rld)[select,], cluster_rows=FALSE, show_rownames=FALSE,
         cluster_cols=FALSE, annotation_col=df)


sampleDists <- dist(t(assay(rld)))

sampleDistMatrix <- as.matrix(sampleDists)
rownames(sampleDistMatrix) <- paste(rld$type,rld$time,sep="-")
colnames(sampleDistMatrix) <- NULL
colors <- colorRampPalette( rev(brewer.pal(9, "Blues")) )(255)
pheatmap(sampleDistMatrix,
         clustering_distance_rows=sampleDists,
         clustering_distance_cols=sampleDists,
         col=colors)




library(rtracklayer) 

gene_name <- import("D:\\ubuntu\\rootfs\\root\\GenomeAnalysis_Xinyao\\GA\\3_annotation\\3.4_functional_annotation\\sel3.gff") %>%
  as.data.frame() %>%
  filter(.,ID %in% rownames(data)) %>%
  .[,c("ID","Name")]

diff_gene_H_F <- as.data.frame(resLFC_H_F) %>%
  filter(padj<0.05) %>%
  filter(abs(log2FoldChange)>1.5 | abs(log2FoldChange)<2/3)

out_gene_H_F <- filter(gene_name,ID %in% rownames(diff_gene_H_F)) %>%
  .[,"Name"] %>%
  write.table("out_gene_H_F.txt",row.names = F,col.names = F,quote = F,sep="\n")


diff_gene_16_15 <- as.data.frame(resLFC_16_15) %>%
  filter(padj<0.05) %>%
  filter(abs(log2FoldChange)>1.5 | abs(log2FoldChange)<2/3)

out_gene_16_15 <- filter(gene_name,ID %in% rownames(diff_gene_16_15)) %>%
  .[,"Name"] %>%
  write.table("out_gene_16_15.txt",row.names = F,col.names = F,quote = F,sep="\n")


diff_gene_17_15 <- as.data.frame(resLFC_17_15) %>%
  filter(padj<0.05) %>%
  filter(abs(log2FoldChange)>1.5 | abs(log2FoldChange)<2/3)

out_gene_17_15 <- filter(gene_name,ID %in% rownames(diff_gene_17_15)) %>%
  .[,"Name"] %>%
  write.table("out_gene_17_15.txt",row.names = F,col.names = F,quote = F,sep="\n")

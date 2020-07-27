# An R script to run singleR to ID cell types in my single cell data, becasue I think that R is not playing nice with anndata objecty in ipython

#set R location
.libPaths(new='YOUR_R_PATH')

#load libraries
library(scRNAseq)
library(SingleR)
library(scater)
library(scran)
library(RColorBrewer)
library(slingshot)
library(monocle)
library(gam)
library(clusterExperiment)
library(ggplot2)
library(plyr)
library(MAST)
library(purrr)

#load R data
load('YOUR_DATA')


coldata<-data.frame(row.names=colnames(r_adata), as.vector(cluster_df))


test_celltype<-SingleR(test=r_adata, ref=hpca.se, labels = hpca.se$label.main,
	method='cluster',
	clusters=cluster_df$cell_type_subcluster)


save.image(file="YOUR_RESULTS", version = NULL, safe = TRUE)

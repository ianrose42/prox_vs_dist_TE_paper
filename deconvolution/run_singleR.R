# An R script to run singleR to ID cell types in my single cell data, becasue I think that R is not playing nice with anndata objecty in ipython

#set R location
.libPaths(new='/home/ian/anaconda3/envs/SC_Env/lib/R/library')

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
load('/home/ian/fast_files/.r_adata')
#r_adata<-load('/home/ian/fast_files/fast_r_adata')
#cluster_df<-load('/home/ian/fast_files/fast_cluster_df')
#hpca.se<-load('/home/ian/fast_files/fast_hpca.se')

#I think I need to make a ColData, or similar column for r_adata
#also, make sure the labels are correct... ->rownames look lige gene symbols in hpca.se
coldata<-data.frame(row.names=colnames(r_adata), as.vector(cluster_df))
#wait, maybe as.character meant that only the first whatever number of columns wre used...

#try to do the cell type call
#I need to use cluster method...
#test_celltype<-SingleR(test=r_adata, ref=hpca.se, labels = hpca.se$label.main)
#so, this runs but makes an error...
#test_celltype<-SingleR(test=r_adata, ref=hpca.se, labels = hpca.se$label.main,
#	method='cluster',
#	clusters=cluster_df$clusters)

test_celltype<-SingleR(test=r_adata, ref=hpca.se, labels = hpca.se$label.main,
	method='cluster',
	clusters=cluster_df$cell_type_subcluster)

#wait, I only need whatever the number of clusters is!



#this runs!! & produces a result
#save this image so I can load it back into my notebook
save.image(file="/home/ian/fast_files/.my_r_adata_celltype", version = NULL, safe = TRUE)
#save(test_celltype, file='/home/ian/fast_files/fast_test_cell_type')

#load('./.r_adata_celltype')
#names(test_celltype)
.libPaths(new='/home/ian/anaconda3/envs/bseqsc_Env/lib/R/library')
load('/home/ian/fast_files/start_deconvolution_III.rdata')

library(bseqsc)

#load B
#load raw_minimal_set
#load ruv_minimal_set
#raw_minimal_set<-load('/home/ian/fast_files/ruv_minimal_set')
#ruv_minimal_set<-load('/home/ian/fast_files/ruv_minimal_set')
#B<-load('/home/ian/fast_files/B')

raw_fit<-bseqsc_proportions(raw_minimal_set, B, verbose=TRUE, log=FALSE)

ruv_fit<-bseqsc_proportions(ruv_minimal_set, B, verbose=TRUE, log=FALSE)


save.image('/home/ian/fast_files/end_deconvolution_III.rdata')
# save raw_fit
#save(raw_fit, file='./raw_fit')
#save(ruv_fit, file='./ruv_fit')
# save ruv_fit
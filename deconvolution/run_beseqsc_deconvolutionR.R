.libPaths(new='YOUR_R_PATH')
load('YOUR_DATA.rdata')

library(bseqsc)


raw_fit<-bseqsc_proportions(raw_minimal_set, B, verbose=TRUE, log=FALSE)

ruv_fit<-bseqsc_proportions(ruv_minimal_set, B, verbose=TRUE, log=FALSE)


save.image('SAVED_R_DATA.rdata')
# save raw_fit
#save(raw_fit, file='./raw_fit')
#save(ruv_fit, file='./ruv_fit')
# save ruv_fit
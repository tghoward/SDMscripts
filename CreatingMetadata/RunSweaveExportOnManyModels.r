
setwd("C:/_NYNHP/GIS_data/ElementData/RdataFiles/build_eval_Out")

library(ROCR)  #July 2010: order matters, see http://finzi.psych.upenn.edu/Rhelp10/2009-February/189936.html
library(randomForest)

##get a list of what's in the directory
d <- dir(pattern = ".Rdata",full.names=FALSE)

#
##loop through
for (sweavei in 1:length(d)){
		fileName <- d[[sweavei]]
  ## Bring the file into R
  setwd("C:/_NYNHP/GIS_data/ElementData/RdataFiles/build_eval_Out")
  load(fileName)
  setwd("C:/_Howard/Projects/EDM/2009_metadataout")
  
  if(length(group$vals)>1){
  Sweave("MetadataEval", syntax="SweaveSyntaxNoweb", output=paste(abbr, ".tex",sep=""))
  } else {
  print(paste(abbr, " has only one group, no metadata produced", sep=""))
  }
  	#clear all but the items needed for next run
	rm(list=ls()[!ls() %in% c("sweavei","d")])

}
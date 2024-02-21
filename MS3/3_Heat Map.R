
library("gplots")
library("RColorBrewer")

# a function to assign colors based on sample
# http://www.rapidtables.com/web/color/RGB_Color.htm
condition_colors <- unlist(lapply(rownames(Mean_Transpose),function(x){
  if(grepl("OIS",x)) '#7F00FF' #purple
  else if(grepl('Vector',x)) '#CC0000' }))#green

condition_colors

#HeatMap

input <- as.matrix(Mean_Transpose[,-1])

heatmap.2(t(input), trace="none", density="none", col=colorpanel(20,"turquoise","black","red"), labCol=F, labRow=colnames(input), margins = c(3,15),  
          scale="column", dendrogram = "both", cexCol = 1, 
          hclust=function(x) hclust(x,method="ward.D2"))





#PCA Analysis ----

PCA1 <- prcomp(Transpose[,-1])

PCA1

summary(PCA1)

plot(PCA1, type = "l")

biplot(PCA1, scale = 0)

#extract PC Score ----

str(PCA1)
PCA1$x

PCAplot <- cbind(Transpose,PCA1$x[,1:2])


#Making a Plot ----



library(ggplot2)

#ggplot(PCAplot, aes(PC1, PC2, col = "black", fill = "red")) +  geom_point(shape = 21, col = "black")
#PCA Analysis ----

ggplot(PCAplot, aes(PC1, PC2, fill = Sample)) +
 # scale_color_manual(values=colours)
  geom_point(size = 4, shape = 21, col = "black")

Sample <- unlist(lapply(rownames(Transpose),function(x){ 
  if(grepl("RAS_CM",x)) "OIS CM"
  else if(grepl("RAS_F8",x)) 'OIS F8'
  else if(grepl("RAS_F20",x)) 'OIS F20'
  else if(grepl("STOP_CM",x)) 'Vector CM'
  else if(grepl("STOP_F8",x)) 'Vector F8'
  else if(grepl('STOP_F20',x)) 'Vector F20' }))


colours <- c("RAS_CM_1"="Purple","RAS_CM_2"="Purple","RAS_CM_3"="Purple",
              "RAS_F8_1"="Blue","RAS_F8_2"="Blue","RAS_F8_3"="Blue",
              "RAS_F20_1"="Green","RAS_F20_2"="Green","RAS_F20_3"="Green",
              "Vector_CM_1"="Red","Vector_CM_2"="Red","Vector_CM_3"="Red",
              "Vector_F8_1"="Orange","Vector_F8_2"="Orange","Vector_F8_3"="Orange",
              "Vector_F20_1"="Brown","Vector_F20_2"="Brown","Vector_F20_3"="Brown")
              






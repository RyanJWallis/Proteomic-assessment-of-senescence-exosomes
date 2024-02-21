#Data Input ----
library(readxl)
MS_3 <- read_excel("MS3 Analysis.xlsx")

#Section Data ----

OIS_CM <- MS_3[,c(1:3,20)]
OIS_F20 <- MS_3[,c(4:6,20)]
OIS_F8 <- MS_3[,c(7:9,20)]

Vector_CM <- MS_3[,c(10:12,20)]
Vector_F20 <- MS_3[,c(13:15,20)]
Vector_F8 <- MS_3[,c(16:18,20)]

Gene_Name <- MS_3[,19:20]

#Means ----
OIS_CM_Mean <- rowMeans(OIS_CM[,1:3])
OIS_F20_Mean <- rowMeans(OIS_F20[,1:3])                
OIS_F8_Mean <- rowMeans(OIS_F8[,1:3])

Vector_CM_Mean <- rowMeans(Vector_CM[,1:3])
Vector_F20_Mean <- rowMeans(Vector_F20[,1:3])                
Vector_F8_Mean <- rowMeans(Vector_F8[,1:3])

#Summary of Mean ----
Summary_Means <- Gene_Name

Summary_Means$OIS_CM <- OIS_CM_Mean 
Summary_Means$OIS_F20 <- OIS_F20_Mean 
Summary_Means$OIS_F8 <- OIS_F8_Mean 

Summary_Means$Vector_CM <- Vector_CM_Mean 
Summary_Means$Vector_F20 <- Vector_F20_Mean 
Summary_Means$Vector_F8 <- Vector_F8_Mean 

#Add Means to Data Frame ----
OIS_CM$Mean <- OIS_CM_Mean
OIS_F20$Mean <- OIS_F20_Mean
OIS_F8$Mean <- OIS_F8_Mean

Vector_CM$Mean <- Vector_CM_Mean
Vector_F20$Mean <- Vector_F20_Mean
Vector_F8$Mean <- Vector_F8_Mean

#Export to Excel ---- 
write.table(Summary_Means, file="Summary Means MS3.csv", sep = ",")

#Means Transposed for PCA
Mean_Transpose <- read_excel("Summary Means MS3.xlsx") 

#All Data Transposed for PCA
Transpose <- read_excel("Transposed MS3.xlsx") 

#Import Summary Data Without Headingn "Transposed MS3"
Summary_Transpose <- read_excel("Transposed MS3.xlsx")


   
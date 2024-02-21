library("gplots") 
library("RColorBrewer")
library("matrixStats")
library("plyr")
library("dplyr")
library("data.table")
library("stringr")
library("ggplot2")
library("Rtsne")

#Import CSV File 
MS1 <- fread("MS1.csv", stringsAsFactors = F)


MS1_Simplified <- MS1[,c(5,12,13,14,16)]

#Volcano Plot
ggplot(MS1_Simplified, aes(x = `log2 difference`, y = `-Log10 p-value`)) +
  geom_point(aes(color = ifelse((`log2 difference` > 1 | `log2 difference` < -1) & `-Log10 p-value` > 1.3, "purple", "grey")),  show.legend = FALSE) +
  geom_hline(yintercept = 1.3, linetype = "dashed", color = "red") +  
  geom_vline(xintercept = 0, linetype = "solid", color = "black") +  # placing y-axis at x = 0
  geom_vline(xintercept = c(-1, 1), linetype = "dashed", color = "red") +  
  labs(x = "log2 Difference", y = "-Log10 p-value", title = "MS1 - dUC Vector vs OIS EVs") +
  scale_color_manual(values = c("grey", "purple")) +
  theme_minimal() +
  theme(axis.line = element_blank(),  # Remove all axis lines
        axis.line.x = element_line(color = "black", size = 0.5))  # Match thickness of y-axis

# GO Localisation
MS1_Control_Top_50 <-  MS1_Simplified %>%
  top_n(50, ctrl) %>%
  select(`T: Gene names`, ctrl)

MS1_OIS_Top_50 <-  MS1_Simplified %>%
  top_n(50, ras1) %>%
  select(`T: Gene names`, ras1)


#GO analysis of Top50 performed externally
library(readxl)
OIS_Report <- read_excel("OIS_GOreport.xlsx")
Vector_Report <- read_excel("Vector_GOreport.xlsx")

top_3_OIS <- OIS_Report[1:3,]
top_3_Vector <- Vector_Report[1:3,]

# Create a bar chart
ggplot(top_3_OIS, aes(x = `Cellular component`, y = `-Log10(FDR-Corrected P-Value)`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 3 OIS Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability

# Create a bar chart
ggplot(top_3_Vector, aes(x = `Cellular component`, y = `-Log10(FDR-Corrected P-Value)`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 3 Vector Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability



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
MS2 <- fread("MS2.csv", stringsAsFactors = F)

Meta <- MS2[,10:11]

F20 <- MS2[,c(1:3)]
F8 <- MS2[,c(4:6)]
CM <- MS2[,c(7:9)]

F20_means <- rowMeans(F20)
F8_means <- rowMeans(F8)
CM_means <- rowMeans(CM)

MS2 <- cbind(F20_means,F8_means,CM_means,Meta)

library(VennDiagram)

# Convert columns to logical values indicating whether each value is greater than 0
MS2_logical <- MS2[, 1:3] > 0

# Create a list of vectors where each component corresponds to a separate circle in the Venn diagram
list_of_vectors <- lapply(1:ncol(MS2_logical), function(i) which(MS2_logical[, i]))

# Create the Venn diagram
venn_diagram <- venn.diagram(
  x = list_of_vectors,
  category.names = c("F20_means", "F8_means", "CM_means"),
  filename = NULL,
  pattern = "circle",
  fill = c("skyblue", "pink", "lightgreen"),
  alpha = 0.5,
  cat.fontfamily = "sans",
  cat.fontface = "bold",
  cat.fontsize = 14,
  cex = 2,
  fontfamily = "sans",
  fontface = "bold",
  fontface.circle = "bold",
  cat.col = c("black", "black", "black"),
  cat.default.pos = "outer",
  margin = 0.05
)

## Plot the Venn diagram
grid.draw(venn_diagram)

### GO Analysis
library(readxl)
F20_Report <- read_excel("MS2_F20_report.xlsx")
F8_Report <- read_excel("MS2_F8_report.xlsx")
CM_Report <- read_excel("MS2_CM_report.xlsx")

# Create a bar chart
ggplot(F20_Report[2:4,], aes(x = `Cellular component`, y = `-Log10(FDR-Corrected P-Value)`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 3 F20 Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability

# Create a bar chart
ggplot(F8_Report[2:4,], aes(x = `Cellular component`, y = `-Log10(FDR-Corrected P-Value)`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 3 F8 Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability

# Create a bar chart
ggplot(CM_Report[2:4,], aes(x = `Cellular component`, y = `-Log10(FDR-Corrected P-Value)`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 3 CM Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability


#### Making Heatmaps
unique_values <- unique(MS2$Localisation)

# Filter dataframe for entries containing "IC"
IC_df <- MS2[grep("IC", MS2$Localisation), ]

# Filter dataframe for entries containing "M"
M_df <- MS2[grep("M", MS2$Localisation), ]

# Filter dataframe for entries containing "S"
S_df <- MS2[grep("S", MS2$Localisation), ]

#ICHM
# Select the relevant columns from dataframe
heatmap_data <- IC_df[, c("F20_means", "F8_means", "CM_means")]
heatmap_data <- as.matrix(heatmap_data)

# Define breaks
breaks <- seq(0, 40, length.out = 40)

# Create the color palette
my_palette <- colorRampPalette(c("white", "purple"))(length(breaks) - 1)

# Create the heatmap with a border
heatmap.2(heatmap_data,
          Colv = NA,
          Rowv = NA,
          col = my_palette,
          main = "Intracellular",
          breaks = breaks,
          density.info = "none",
          trace = "none",
          symm = FALSE, symkey = FALSE, symbreaks = TRUE,
          labRow = "",
          labCol = "",
          cexCol = 1.2,
          cexRow = 1.2,
          key.title = "Key", key.xlab = "Mean LFQ Intensity (Log2)",
          # Use add.expr to draw a rectangle around the plot
          add.expr = { rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], border = "black") })

# Add the y-axis label manually with adjusted position
mtext("Gene names", side=2, las=3, adj=0.3, padj=11.5, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F20", side=4, las=1, adj=16.5, padj=-10, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F8", side=4, las=1, adj=15, padj=-10, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("CM", side=4, las=1, adj=5, padj=-10, font=1, cex=1.1)

#Membrane HM
# Select the relevant columns from dataframe
heatmap_data <- M_df[, c("F20_means", "F8_means", "CM_means")]
heatmap_data <- as.matrix(heatmap_data)


# Define breaks
breaks <- seq(0, 40, length.out = 40)

# Create the color palette
my_palette <- colorRampPalette(c("white", "purple"))(length(breaks) - 1)

# Create the heatmap with a border
heatmap.2(heatmap_data,
          Colv = NA,
          Rowv = NA,
          col = my_palette,
          main = "Membrane",
          breaks = breaks,
          density.info = "none",
          trace = "none",
          symm = FALSE, symkey = FALSE, symbreaks = TRUE,
          labRow = "",
          labCol = "",
          cexCol = 1.2,
          cexRow = 1.2,
          key.title = "Key", key.xlab = "Mean LFQ Intensity (Log2)",
          # Use add.expr to draw a rectangle around the plot
          add.expr = { rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], border = "black") })

# Add the y-axis label manually with adjusted position
mtext("Gene names", side=2, las=3, adj=0.3, padj=11.5, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F20", side=4, las=1, adj=16.5, padj=-10, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F8", side=4, las=1, adj=15, padj=-10, font=1, cex=1.1)

#Secreted HM
# Select the relevant columns from dataframe
heatmap_data <- S_df[, c("F20_means", "F8_means", "CM_means")]
heatmap_data <- as.matrix(heatmap_data)


# Define breaks
breaks <- seq(0, 40, length.out = 40)

# Create the color palette
my_palette <- colorRampPalette(c("white", "purple"))(length(breaks) - 1)

# Create the heatmap with a border
heatmap.2(heatmap_data,
          Colv = NA,
          Rowv = NA,
          col = my_palette,
          main = "Secreted",
          breaks = breaks,
          density.info = "none",
          trace = "none",
          symm = FALSE, symkey = FALSE, symbreaks = TRUE,
          labRow = "",
          labCol = "",
          cexCol = 1.2,
          cexRow = 1.2,
          key.title = "Key", key.xlab = "Mean LFQ Intensity (Log2)",
          # Use add.expr to draw a rectangle around the plot
          add.expr = { rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], border = "black") })

# Add the y-axis label manually with adjusted position
mtext("Gene names", side=2, las=3, adj=0.3, padj=11.5, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F20", side=4, las=1, adj=16.5, padj=-10, font=1, cex=1.1)

# Add the x-axis label manually with adjusted position
mtext("F8", side=4, las=1, adj=15, padj=-10, font=1, cex=1.1)
# Add the x-axis label manually with adjusted position
mtext("CM", side=4, las=1, adj=5, padj=-10, font=1, cex=1.1)

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

library("gprofiler2")

# Example gene list (replace with your gene list)
gene_list_Control <- MS1_Control_Top_50$`T: Gene names`
gene_list_OIS <- MS1_OIS_Top_50$`T: Gene names`

# Perform GO analysis
go_results_Control <- gost(query = gene_list_Control, 
                   organism = "hsapiens", ordered_query = FALSE, 
                   multi_query = FALSE, significant = TRUE, exclude_iea = FALSE, 
                   measure_underrepresentation = FALSE, evcodes = FALSE, 
                   user_threshold = 0.05, correction_method = "fdr", 
                   domain_scope = "annotated", custom_bg = NULL, 
                   numeric_ns = "", sources = NULL, as_short_link = FALSE, highlight = TRUE)


# Perform GO analysis
go_results_OIS <- gost(query = gene_list_OIS, 
                           organism = "hsapiens", ordered_query = FALSE, 
                           multi_query = FALSE, significant = TRUE, exclude_iea = FALSE, 
                           measure_underrepresentation = FALSE, evcodes = FALSE, 
                           user_threshold = 0.05, correction_method = "fdr", 
                           domain_scope = "annotated", custom_bg = NULL, 
                           numeric_ns = "", sources = NULL, as_short_link = FALSE, highlight = TRUE)


# View the GO analysis results
Control_GO <- go_results_Control$result
Control_GO<- Control_GO %>%
  filter(source == "GO:CC") %>%
  select(p_value,term_name)

OIS_GO <- go_results_OIS$result
OIS_GO<- OIS_GO %>%
  filter(source == "GO:CC") %>%
  select(p_value,term_name)


Top_5_Control <- Control_GO[1:5,]
Top_5_OIS <- OIS_GO[1:5,]


Top_5_Control <- Top_5_Control %>%
  mutate(log10_p_Value = -log10(p_value))

Top_5_OIS <- Top_5_OIS %>%
  mutate(log10_p_Value = -log10(p_value))

# Create a bar chart
ggplot(Top_5_Control, aes(x = `term_name`, y = `log10_p_Value`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 5 OIS Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability


# Create a bar chart
ggplot(Top_5_OIS, aes(x = `term_name`, y = `log10_p_Value`)) +
  geom_bar(stat = "identity", fill = "black", width = 0.5) +  # Create black bars
  labs(x = "Cellular Component", y = "-Log10(FDR-Corrected P-Value)", title = "Top 5 OIS Cellular Components") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for better readability




import pandas as pd
import matplotlib.pyplot as plt
from goatools.base import download_go_basic_obo, download_ncbi_associations
from goatools.associations import read_ncbi_gene2go
from goatools.go_enrichment import GOEnrichmentStudy

# Load data
MS1 = pd.read_csv("MS1.csv")

# Select relevant columns
MS1_Simplified = MS1.iloc[:, [4, 11, 12, 13, 15]] 

# Volcano Plot
plt.scatter(MS1_Simplified['log2 difference'], MS1_Simplified['-Log10 p-value'], color='grey')
plt.scatter(MS1_Simplified.loc[(MS1_Simplified['log2 difference'].abs() > 1) & (MS1_Simplified['-Log10 p-value'] > 1.3), 'log2 difference'], 
            MS1_Simplified.loc[(MS1_Simplified['log2 difference'].abs() > 1) & (MS1_Simplified['-Log10 p-value'] > 1.3), '-Log10 p-value'], 
            color='purple')
plt.axhline(y=1.3, linestyle='--', color='red')
plt.axvline(x=0, linestyle='-', color='black')
plt.axvline(x=-1, linestyle='--', color='red')
plt.axvline(x=1, linestyle='--', color='red')
plt.xlabel('log2 Difference')
plt.ylabel('-Log10 p-value')
plt.title('MS1 - dUC Vector vs OIS EVs')
plt.show()



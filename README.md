# Metaproteome_FRp
## Li and Wang et al., Revealing Proteome-Level Functional Redundancy in the Human Gut Microbiome using Ultra-deep Metaproteomics

## This repository is a series of python codes to:
1) Generate protein-content networks from ultra-deep metaproteomcis data based on the protein-peptide bridge approach.
2) Compute degree distribution, functional distance and functional redundancy of the PCNs.

## Original dataset and example output
1) The original dataset is given in "1_database_search_results/". Decompress any .zip files.
2) Example outputs are given in "2_data_processing/".

## System requirements:
1) Python (version >= 3.6.0) and packages pandas (version >= 0.25.3) and numpy(version >= 1.18.2) were required.
2) The codes have been tested on Python (version = 3.6.0) with packages pandas (version = 0.25.3) and numpy(version = 1.18.2) ran by PyCharm 2021.3.3 on a Windows computer, and on Jupyter Notebook (version = 6.4.8) with Python ( version = 3.9.12) with packages pandas (version = 1.4.2) and numpy (version = 1.21.5) on a macOS Monterey (version = 12.2.1).
3) The time for computing dij is most time consuming, approximately 15-20 min on a macOS Monterey (version = 12.2.1) for each sample, and could take 1-2 hours on a normal Windows computer. Other than that, Calculating PCN, degree distribution and functional redundancy takes few minutes.

## How to run:
1) Download data, example outputs and codes in this repository.
2) Open Ultra_deep_MetaPro_IQ.ipynb using Jupyter Notebook.
3) Follow the steps to run through generating PCN, calculating degree distribution, functional distance and functional redundancy. The output will overwrite example outputs unless saved to new directories.
4) Besides, R codes for computing nestedness (./2_data_processing/1_PCN/Nestedness/) and visualize degree distribution  (./2_data_processing/2_Degree_distribution/) are provided.

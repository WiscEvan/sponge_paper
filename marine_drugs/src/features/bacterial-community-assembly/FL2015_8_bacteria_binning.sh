#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=1
#SBATCH --error=logs/%J.FL2015_8_bacteria_binning.err
#SBATCH --output=logs/%J.FL2015_8_bacteria_binning.out

# Shared Data
binning="$HOME/marine_drugs/marine_drugs/data/interim/binning"
coverages="${binning}/FL2015_8.coverages.tsv"
taxonomy="${binning}/FL2015_8.taxonomy.tsv"
norm_kmers="${binning}/FL2015_8.kmers.bacteria.am_clr.tsv"

embed_methods=("bhsne" "umap")
for embed_method in ${embed_methods[@]};do
    embedded_kmers="${binning}/FL2015_8.kmers.am_clr.${embed_method}.tsv"
    # Bacteria specific
    out="${binning}/FL2015_8.bacteria.binning.${embed_method}.tsv"
    markers="${binning}/FL2015_8.bacteria.markers.tsv"
    /home/evan/miniconda3/envs/autometa/bin/autometa-binning $norm_kmers $coverages $markers $out \
        --embedded-kmers $embedded_kmers \
        --taxonomy $taxonomy \
        --clustering-method hdbscan \
        --domain bacteria
done
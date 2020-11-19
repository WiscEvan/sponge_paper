#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=1
#SBATCH --error=logs/%J.get_taxonomy_FL2015_37.err
#SBATCH --output=logs/%J.get_taxonomy_FL2015_37.out

autometa-taxonomy --ncbi /mnt/autometa_databases/ --assembly /home/evan/marine_drugs/marine_drugs/data/interim/assemblies/FL2015_37.filtered.fna --nucl-orfs /home/evan/marine_drugs/marine_drugs/data/interim/binning/FL2015_37.orfs.fna --prot-orfs /home/evan/marine_drugs/marine_drugs/data/interim/binning/FL2015_37.orfs.faa --blast /home/evan/marine_drugs/marine_drugs/data/interim/binning/FL2015_37.blastp.tsv --lca /home/evan/marine_drugs/marine_drugs/data/interim/binning/FL2015_37.lca.tsv --method majority_vote /home/evan/marine_drugs/marine_drugs/data/interim/binning/FL2015_37.taxonomy.tsv
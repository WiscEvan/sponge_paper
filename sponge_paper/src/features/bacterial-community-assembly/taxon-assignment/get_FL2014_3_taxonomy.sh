#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=1
#SBATCH --error=logs/%J.get_taxonomy_FL2014_3.err
#SBATCH --output=logs/%J.get_taxonomy_FL2014_3.out

autometa-taxonomy --ncbi /mnt/autometa_databases/ --assembly /home/evan/sponge_paper/sponge_paper/data/interim/assemblies/FL2014_3.filtered.fna --nucl-orfs /home/evan/sponge_paper/sponge_paper/data/interim/binning/FL2014_3.orfs.fna --prot-orfs /home/evan/sponge_paper/sponge_paper/data/interim/binning/FL2014_3.orfs.faa --blast /home/evan/sponge_paper/sponge_paper/data/interim/binning/FL2014_3.blastp.tsv --lca /home/evan/sponge_paper/sponge_paper/data/interim/binning/FL2014_3.lca.tsv --method majority_vote /home/evan/sponge_paper/sponge_paper/data/interim/binning/FL2014_3.taxonomy.tsv
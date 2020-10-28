#!/bin/bash
#SBATCH --partition=queue
#SBATCH --time=14-00:00:00
#SBATCH -N 1 # Nodes
#SBATCH -n 1 # Tasks
#SBATCH --cpus-per-task=1
#SBATCH --error=logs/%J.run_FL2015_9_makeflow.err
#SBATCH --output=logs/%J.run_FL2015_9_makeflow.out
# Sponge Makeflows generated by
# /home/evan/marine_drugs/marine_drugs/src/make_sponge_makeflows.sh

makeflow --local-cores=40 --email=erees@wisc.edu --summary-log=/home/evan/marine_drugs/marine_drugs/data/interim/binning/logs/FL2015_9.summary.log --monitor=/home/evan/marine_drugs/marine_drugs/data/interim/binning/logs/FL2015_9 -T slurm /home/evan/marine_drugs/marine_drugs/src/features/FL2015_9.mf
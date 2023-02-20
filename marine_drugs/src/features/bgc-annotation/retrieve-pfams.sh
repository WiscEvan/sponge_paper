#!/usr/bin/env bash

REPO="/media/bigdrive2/evan/marine_drugs"
OUTDIR="${REPO}/marine_drugs/data/interim/bgcs"
SCRIPT="${REPO}/marine_drugs/src/features/bgc-annotation/retrieve-pfam-annotations.py"

for antismash_dirpath in `ls -d ${REPO}/marine_drugs/data/interim/bgcs/FL201*/`;do
    sample=$(basename ${antismash_dirpath})
    # NOTE: no need for '/' in `infpath` as `ls -d */` keeps the trailing '/'
    infpath="${antismash_dirpath}${sample}.gbk"
    outfpath="${OUTDIR}/${sample}_pfams.tsv"
    if [ ! -f $outfpath ];
    then python $SCRIPT --input $infpath --output $outfpath
    else echo "pfams annotations table already exists for ${sample} in ${OUTDIR}"
    fi
done
#!/usr/bin/env bash

EXTERNAL="${HOME}/marine_drugs/marine_drugs/data/external"



function getKeyfiles() {
    keyfiles=()
    for keyfile in `ls ${EXTERNAL}/${1}/*.keyfile`;do
        if [[ $keyfile != *"all_markers"* ]];
        then keyfiles+=($keyfile)
        fi  
    done
    echo ${keyfiles[@]}
}

function countDisjointMarkersInKeyfiles() {
    sort "$@" | \
    uniq -c | \
    grep "1\s"| \
    wc -l
}

function countUnionMarkersInKeyfiles() {
    sort "$@" | \
    uniq | \
    wc -l
}

taxonSets=("phylum_Proteobacteria_markers" "class_Gammaproteobacteria_markers" "class_Alphaproteobacteria_markers")

echo -e "rank\tlineage\tdisjoint_marker_count\tunion_marker_count\tmarker_set_count"
for taxonSet in ${taxonSets[@]};do
    keyfiles=$(getKeyfiles $taxonSet)
    disjointMarkerCount=$(countDisjointMarkersInKeyfiles ${keyfiles[@]})
    unionMarkerCount=$(countUnionMarkersInKeyfiles ${keyfiles[@]})
    rank=$(echo $taxonSet | cut -f1 -d"_")
    lineage=$(echo $taxonSet | cut -f2 -d"_")
    markerSets=(${keyfiles[@]})
    markerSetCount=(${#markerSets[@]})
    echo -e "${rank}\t${lineage}\t${disjointMarkerCount}\t${unionMarkerCount}\t${markerSetCount}"
done

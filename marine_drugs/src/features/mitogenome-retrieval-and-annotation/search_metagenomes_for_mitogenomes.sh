

metagenomes=`ls ${HOME}/marine_drugs/marine_drugs/data/interim/assemblies/*.fna`
mitogenomes="${HOME}/marine_drugs/marine_drugs/data/interim/mitogenomes"
query="${HOME}/marine_drugs/marine_drugs/data/external/sponges_COI.fna"
for fasta in ${metagenomes};do
    metagenome="$(basename ${fasta/.filtered.fna/})"
    echo "searching ${metagenome} for mitogenomic contigs"
    db="${mitogenomes}/${metagenome}.blastdb"
    makeblastdb -dbtype nucl -parse_seqids -in ${fasta} -input_type fasta -out ${db}

    out="${mitogenomes}/${metagenome}.sponges_COIs.tblastx.tsv"
    # tblastx -db FL2015_43.blastdb -query ../../external/tedania_ignis_reference_mtdna.fna -outfmt 6 -out FL2015_43.tblastx.tsv
    tblastx -db ${db} -query ${query} -outfmt 6 -out ${out}
    rm ${db}.n*
done
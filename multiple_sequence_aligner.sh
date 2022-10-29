#!usr/bin/bash

#activating the conda environment
conda activate msa

#getting input data as uniprot id
VAR=$(cat uniprots_id.txt) 
URL="https://www.uniprot.org/uniprot/"oo

#loop to download sequence
for i in ${VAR}
    do
        echo "(o) Downloading Uniprot entry ${i}"
        wget ${URL}${i}.fasta
        echo "(o) Downloaded Uniprot entry ${i}"
        #making a single file with all fasta sequences:
        cat ${i}.fasta >> muscle_input.fasta
        rm ${i}.fasta
    done
    
#using muscle to run sequence alignment and getting output in clw format
muscle -align muscle_input.fasta -output muscle_output.clw

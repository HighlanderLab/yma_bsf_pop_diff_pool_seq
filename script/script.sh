#!/bin/sh
#$ -cwd
#$ -N mapping
#$ -l h_vmem=64G


# Initialise the environment modules
. /etc/profile.d/modules.sh

module load roslin/bwa/2.1.0

# load the reference file 
#bwa index ../ref/ref.fasta 

#map reads to reference
bwa aln -n 0.01 -l 100 -o 1 -d 12 -e 12  ../ref/ref.fasta ../sequence/SRR189066_1.fastq > ../map/SRR1.sai
bwa aln -n 0.01 -l 100 -o 1 -d 12 -e 12  ../ref/ref.fasta ../sequence/SRR189066_2.fastq > ../map/SRR2.sai

bwa samse ../ref/ref.fasta ../map/SRR1.sai ../sequence/SRR189066_1.fastq > ../map/SSR1.sam
bwa samse ../ref/ref.fasta ../map/SRR2.sai ../sequence/SRR189066_2.fastq > ../map/SSR2.sam

#$ -e mapping.e

#!/bin/sh

bwa index ../ref/ref.fasta

bwa aln -n 0.01 -l 100 -o 1 -d 12 -e 12 -t 8 ../ref/ref.fasta ../sequence/SRR189066_1.fastq > ../map/SRR1.sai
bwa aln -n 0.01 -l 100 -o 1 -d 12 -e 12 -t 8 ../ref/ref.fasta ../sequence/SRR189066_2.fastq > ../map/SRR2.sai
bwa samse ../ref/ref.fasta ../map/SRR1.sai ../sequence/SRR189066_1.fastq > ../map/SRR1.sam
bwa samse ../ref/ref.fasta ../map/SRR2.sai ../sequence/SRR189066_2.fastq > ../map/SRR2.sam

#$ -o hello.o
#$ -e hello.e

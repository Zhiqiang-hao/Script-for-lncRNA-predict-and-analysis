# Script-for-lncRNA-predict-and-analysis

This is the perl script set for lncRNA prediction. To facilitate the usage of the tools in lncRNA pipeline, here we introduce the detail functions and usages of those scripts. 

For the first script "1_length_filter.pl", it could classify transcripts into two classes: transcripts with length shorter than 200nt and transcripts with length no less than 200nt. The input file is transcript sequence in fasta format, for example, "Trinity.fasta" from the Trinity result by assembling transcriptome data.

For the script "2orf_len.pl", it can calculate the transcript orf length in file "1_length_grater". Its input file is the file "1_length_greater" including the transcript name from previous step, and another input file is "Trinity.fasta.transdecoder.pep". The output file is "2_orf_len".

For the script ""


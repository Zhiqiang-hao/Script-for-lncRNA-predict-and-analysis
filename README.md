# Script-for-lncRNA-predict-and-analysis

This is the perl script set for lncRNA prediction. To facilitate the usage of the tools in lncRNA pipeline, here we introduce the detail functions and usages of those scripts. 

For the first script "1_length_filter.pl", it could classify transcripts into two classes: transcripts with length shorter than 200nt and transcripts with length no less than 200nt. The input file is transcript sequence in fasta format, for example, "Trinity.fasta" from the Trinity result by assembling transcriptome data.

For the script "2orf_len.pl", it can calculate the transcript orf length in file "1_length_grater". Its input file is the file "1_length_greater" including the transcript name from previous step, and another input file is "Trinity.fasta.transdecoder.pep". The output file is "2_orf_len".

For the script 2orf_filter.pl, it was used for classifying transcripts into two classes, one with long ORFs more than 300 nt, and one with short ORFs. The input file comes from outfile “1_length_greater” of script “1_length_filter” and the outfile “2_orf_len” of script. The transcripts with short ORFs are used for next analysis. 

For the script “3swiss.pl”, it was used for classifying transcripts into two classes, one with homology in swiss-prot database, and another one without homology in swiss-prot database. The input file come from output file “2_orf_short” of the last script “2orf_filter.pl”, and file sw_out that was the alignments among transcripts and swiss-prot database. 

For the script “4_nr.pl”, it was used to classifying the transcripts into two classes, one that have homology with nr database, and another without homology. The input file come from the output file “nr_out” that was the output in tab format when aligning transcripts with nr database, and output file “3_non_sw” from last step. 

For the script “5pfam_1.pl”, it was used to extract pep sequences of transcripts from “4_nr.pl” output file “4_non_nr”. The input file “longest_orfs.pep” comes from Transdecoder software.

For the script “5pfam_filter.pl”, it was used to classify the transcripts from file “4_non_nr” into two classes, one (output file “5_pfam”) that have pfam motif, and another one (output file “5_non_pfam”) without pfam motif. 

For the script “6cpc_filter.pl”, it was used to extract the transcript name with non-coding potential from cpc outfile “6cpc_out.txt”. The output files of this script is “6_cpc_coding” that showed the coding transcripts, and “6_non_cpc” that was labeled as non-coding transcript.

For the script “7cpat_filter.pl”, this script could classify transcript into noncoding and coding classes based on the software CPAT output. The input file is “cpat_out.ORF_prob.best.tsv”.

For the script “8rfam_filter.pl”, this script could use Rfam output and classify transcripts into two classes, 8_house_rfam for transcripts with homology in Rfam database, and 8_non_rfam2 for transcripts without homology against Rfam database. The input file is "rfam_class2"




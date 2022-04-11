#!/usr/bin/perl
open$in1,"$ARGV[0]"or die; #### Input file1: cpat_out.ORF_prob.best.tsv
while($in2=<$in1>){
if($in2=~/^(TRINITY\S+)_I\d+\s+(\S+\s+){9}(\S+)/){$prob=$3;
$nam=$1;$nam=~s/G/g/;$nam=~s/C/c/;#print$."\n";
#next if $3>=1e-1;
#print$nam."\t".$1."\n";
$cpat{$nam}.=$prob.";" if $prob>=0.44;#print$nam."\t".$1."\n";
$cod{$nam}.=$prob.";" if $prob<0.44;#print$nam."\t".$1."\n";
#print $gen{$rf};
}}
open$in1,"$ARGV[1]"or die; #### Input file2: 6_non_cpc
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;#print$nam."\n";
if($cpat{$nam}){print$nam;
$c.=$nam."\t".$cpat{$nam}."\n";}
else{
$d.=$nam."\t".$cod{$nam}."\n";
}}}

open$out,'>',"7_cpat_coding" or die; #### Output file1: 7_cpc_coding
print$out($c);
open$out,'>',"7_non_cpat" or die; #### Output file2: 7_non_cpat
print$out($d);

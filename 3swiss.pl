#!/usr/bin/perl
open$in1,"$ARGV[0]"or die; #### Input file1: sw_out
while($in2=<$in1>){
if($in2=~/(TRINITY\S+)_i\d+\s+(\S+)/){
$nam=$1;
$sw{$nam}.=$2;
#print $gen{$rf};
}
}

open$in1,"$ARGV[1]"or die; #### 2_orf_short
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($sw{$nam}){
$c.=$nam."\t".$sw{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"3_sw" or die; #### Output file1: 3_sw
print$out($c);
open$out,'>',"3_non_sw" or die; #### Output file2: 3_non_sw
print$out($d);

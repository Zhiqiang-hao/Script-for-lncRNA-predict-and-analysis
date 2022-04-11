#!/usr/bin/perl
open$in1,"$ARGV[0]"or die; #### Input file1: rfam_class2
while($in2=<$in1>){
if($in2=~/^(\S+)\s+(.*)/){
$rfam{$1}=1;
$gen{$1}=$2;
#print $2."\n";
}
}

open$in1,"$ARGV[1]"or die; #### Input file2: rfam_out
while($in2=<$in1>){
if($in2=~/^(\S+)_i\d+\s+(\w+)/){
$nam=$1;$rf=$2;
$hou{$nam}.="\t".$rf."\t".$gen{$rf}.";" if $rfam{$rf};
#print $gen{$rf};
}
}

open$in1,"$ARGV[2]"or die; #### Input file3: 7_non_cpat
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($hou{$nam}){
$c.=$nam.$hou{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"8_house_rfam" or die; #### Output file1: 8_house_rfam
print$out($c);
open$out,'>',"8_non_rfam2" or die; #### Output file2: 8_non_rfam2
print$out($d);

#!/usr/bin/perl
open$in1,"$ARGV[0]"or die; #### Input file: nr_out
while($in2=<$in1>){
if($in2=~/(TRINITY\S+)_i\d+(.*)/){
$nam=$1;
@b=split"\t",$2;
next if $b[9]>=1e-10;
$nr{$nam}.="\t".$b[1];
}
}

open$in1,"$ARGV[1]"or die; #### Input file2:3_non_sw
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($nr{$nam}){
$c.=$nam.$nr{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"4_nr" or die; #### Output file1: 4_nr
print$out($c);
open$out,'>',"4_non_nr" or die; #### Output file: 4_non_nr
print$out($d);

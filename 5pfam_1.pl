#!/usr/bin/perl
open$in1,"$ARGV[0]"or die;#### Input file1: 4_non_nr
while($in2=<$in1>){
chomp$in2;
$b{$in2}=1;
}
open$in1,"$ARGV[1]"or die; #### Input file2: longest_orfs.pep
while($in2=<$in1>){
if($in2=~/>(\w+):/){$a=1;
$a=0 unless $b{$1};
}
$c.=$in2 if $a;
}
open$out,'>',"5_pep"or die; #### Output: 5_pep
print$out($c);

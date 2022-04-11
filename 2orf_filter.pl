#!/usr/bin/perl
open$in1,"$ARGV[0]"or die;   #### Input file1: 2_orf_len
while($in2=<$in1>){chomp$in2;
@b=split"\t",$in2;
if($b[1]>=100){print $b[0];
$b{$b[0]}=$b[1];
}
else{
$b{$b[0]}=0;
}
}
open$in1,"$ARGV[1]"or die; #### Input file2: 1_length_greater
while($in2=<$in1>){chomp$in2;
if($in2=~/^(TRI\S+)/){
if($b{$1}){
$c.=$1."\t".$b{$1}."\n";
}
else{
$d.=$1."\n";
}
}
}
open$out,'>',"2_orf_long"or die; #### Output file 1: 2_orf_long
print$out($c);
open$out,'>',"2_orf_short"or die; #### Output file 2: 2_orf_short
print$out($d);

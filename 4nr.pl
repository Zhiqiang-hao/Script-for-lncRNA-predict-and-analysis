#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/blast2go_topblast.txt"or die;
while($in2=<$in1>){
next if $in2=~/(TRINITY\S+)_i\d+\s+(---NA---)/;
if($in2=~/(TRINITY\S+)_i\d+(.*)/){
$nam=$1;
@b=split"\t",$2;
next if $b[4]>=1e-5;
print$b[4]."\n";
$nr{$nam}.="\t".$b[1];
#print $gen{$rf};
}
}

open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/3_non_sw"or die;
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($nr{$nam}){
$c.=$nam.$nr{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/4_nr" or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/4_non_nr" or die;
print$out($d);

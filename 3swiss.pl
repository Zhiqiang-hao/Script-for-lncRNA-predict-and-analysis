#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/sw_out"or die;
while($in2=<$in1>){
if($in2=~/(TRINITY\S+)_i\d+\s+(\S+)/){
$nam=$1;
$sw{$nam}.=$2;
#print $gen{$rf};
}
}

open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/2_orf_short"or die;
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($sw{$nam}){
$c.=$nam."\t".$sw{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/3_sw" or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/3_non_sw" or die;
print$out($d);

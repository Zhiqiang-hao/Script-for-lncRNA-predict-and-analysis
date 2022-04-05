#!/usr/bin/perl
open$in1,"/home/li/Other_studys/lncRNA_VVI/V5/pipline_out/rfam/rfam_class2"or die;
while($in2=<$in1>){
if($in2=~/^(\S+)\s+(.*)/){
$rfam{$1}=1;
$gen{$1}=$2;
#print $2."\n";
}
}

open$in1,"/home/li/Myopsalax/LncRNA/v3/CDS/rfam/rfam_out"or die;
while($in2=<$in1>){
if($in2=~/^(\S+)_i\d+\s+(\w+)/){
$nam=$1;$rf=$2;
$hou{$nam}.="\t".$rf."\t".$gen{$rf}.";" if $rfam{$rf};
#print $gen{$rf};
}
}

open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/7_non_cpat"or die;
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;
if($hou{$nam}){
$c.=$nam.$hou{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/8_house_rfam2" or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/8_non_rfam2" or die;
print$out($d);

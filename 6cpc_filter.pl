#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/6cpc_out.txt"or die;
while($in2=<$in1>){
if($in2=~/^(TRINITY\S+)_i\d+\s+(\S+\s+){5}(\S+)\s+coding/){
$nam=$1;
#next if $3>=1e-1;
#print$nam."\t".$1."\n";
$cpc{$nam}.=$3.";";print$nam."\t".$1."\n";
#print $gen{$rf};
}
elsif($in2=~/^(TRINITY\S+)_i\d+\s+(\S+\s+){5}(\S+)\s+noncoding/){
$cod{$1}.=$3.";";
}
}
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/5_non_pfam"or die;
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;#print$nam."\n";
if($cpc{$nam}){print$nam;
$c.=$nam."\t".$cpc{$nam}."\n";}
else{
$d.=$nam."\t".$cod{$nam}."\n";
}}}

open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/6_cpc_coding" or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/6_non_cpc" or die;
print$out($d);

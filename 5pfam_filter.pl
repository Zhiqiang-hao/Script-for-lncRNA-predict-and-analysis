#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/5_pep_pfam_out"or die;
while($in2=<$in1>){
if($in2=~/^(TRINITY\S+?)::\S+\s+\S+\s+\S+\s+(\S+)\s+(\S+)/){
$nam=$1;
#next if $3>=1e-1;
#print$nam."\t".$1."\n";
$pfam{$nam}.=$2.";";print$nam."\t".$1."\n";
#print $gen{$rf};
}
}

open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/4_non_nr"or die;
while($in2=<$in1>){chomp$in2;
if($in2=~/^(\S+)/){$nam=$1;#print$nam."\n";
if($pfam{$nam}){print$nam;
$c.=$nam."\t".$pfam{$nam}."\n";}
else{
$d.=$nam."\n";
}}}

open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/5_pfam" or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/5_non_pfam" or die;
print$out($d);

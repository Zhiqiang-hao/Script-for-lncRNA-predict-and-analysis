#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/1_length_greater"or die;
while($in2=<$in1>){
chomp$in2;
if($in2=~/^(TRI\S+)/){
$gen{$1}=1;
}}
open$in1,"/home/li/Myopsalax/LncRNA/v3/CDS/Trinity.fasta.transdecoder.pep"or die;
while($in2=<$in1>){
if($in2=~/>(TRI\S+?)::.*len:(\d+)/){
$len=$2;$nam=$1;next unless $gen{$1};
if ($c{$nam}<$len){
$c{$nam}=$len;#print$len."\t".$nam."\n";
#print$len."\n";
}
}}

sub sn{$c{$b}<=>$c{$a}}
for$nam(sort sn keys%c){#print$c{$_};
$c.=$nam."\t".$c{$nam}."\n";#print$_;
#print$_."\t".$c{$_}."\n";
}
print$c;
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/2_orf_len"or die;
print$out($c);

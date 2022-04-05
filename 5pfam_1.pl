#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/4_non_nr"or die;
while($in2=<$in1>){
chomp$in2;
$b{$in2}=1;
}
open$in1,"/home/li/Myopsalax/LncRNA/v3/CDS/Trinity.fasta.transdecoder_dir/longest_orfs.pep"or die;
while($in2=<$in1>){
if($in2=~/>(\w+):/){$a=1;
$a=0 unless $b{$1};
}
$c.=$in2 if $a;
}
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/5_pep"or die;
print$out($c);

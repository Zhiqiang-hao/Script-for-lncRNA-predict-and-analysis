#!/usr/bin/perl
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/2_orf_len"or die;
while($in2=<$in1>){chomp$in2;
@b=split"\t",$in2;
if($b[1]>=100){print $b[0];
$b{$b[0]}=$b[1];
}
else{
$b{$b[0]}=0;
}
}
open$in1,"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/1_length_greater"or die;
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
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/2_orf_long"or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/2_orf_short"or die;
print$out($d);

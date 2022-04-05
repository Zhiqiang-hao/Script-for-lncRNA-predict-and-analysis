#!/usr/bin/perl
open$in3,"/home/li/Myopsalax/LncRNA/v3/Trinity/Trinity.fasta"or die;
while($in4=<$in3>){
chomp$in4; 
if ($in4=~/>((\S+)_\S+)/){$a=$1;$gen=$2;next;}
$b{$a}.=$in4;
$nam{$a}=$gen;
}
for(keys%b){
if(length($b{$_})>=200){$gen=$nam{$_};
$great{$gen}=1;
}
else{$less{$gen}=1;}
}
for(keys%great){
$c.=$_."\n";
}
for(keys%less){
$d.=$_."\n";
}
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/1_length_greater"or die;
print$out($c);
open$out,'>',"/home/li/Myopsalax/LncRNA/v3/Lnc_identifiy/pip_out/1_length_less"or die;
print$out($d);

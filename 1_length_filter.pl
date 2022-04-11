#!/usr/bin/perl
open$in3,"$ARGV[0]"or die; #### PATHWAY to Trinity.fasta ####
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
open$out,'>',"1_length_greater"or die;#### Output for transcripts with length longer than 200 nt ####
print$out($c);
open$out,'>',"1_length_less"or die; ##### Output for transcripts with short length (<200) ####
print$out($d);

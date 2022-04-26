#!/usr/bin/perl -w
use strict;

my $ztrondel =shift @ARGV;
my $ztrondup=shift @ARGV;
my $delnum=&NUM($ztrondel);
my $dupnum=&NUM($ztrondup);
my $total=$delnum+$dupnum;
#open O,">$sample.cnv.intersect";
#print O "$total\tztron";
print "$total" ;

sub NUM {
my $tmp=shift @_;
open Z,"$tmp" or die $!;
my $n;
while(<Z>){
	chomp;
	
	my ($start,$end,$len)=(split/\t/,$_)[1,2,-1];
	my $gap=$end-$start;
	if (($len/$gap) >=0.5){ 
		$n++;
	}
}
close Z;
return $n;
}

#!/usr/bin/perl -w
use strict;
my $me=shift @ARGV;
my $ztr=shift @ARGV;
my %mega1=();
my %ztron=();
=pod
open M,"$me" or die $!;
open Z,"$ztr" or die $!;
my(%H_me,%H_zt);
while (<M>){
	chomp;
	my $sample=(split/\t/,$_)[-4];
	$H_me{$sample}=$_;	
}
close M;

while (<Z>){
	chomp;
	my $sample=(split/\t/,$_)[-4];
	$Z_me{$sample}=$_;	
}
close Z;
=cut

my $r=&HASH_VALUE($me);
%mega1=%$r;
my $r1=&HASH_VALUE($ztr);
%ztron=%$r1;
sub HASH_VALUE {
my $in=shift @_;
open F1,"$in" or die $!;
my %mega=();
while(<F1>){
	chomp;
	open FILE,"$_" or die $!;
	my $sample;
	while(<FILE>){
		chomp;
		my ($title,$value);
		next if (/raw|length/);
		if (/Sample/){
			$sample=(split/\t/,$_)[-1];
		}	
		else{
			($title,$value)=(split/\t/,$_);
			if ($value =~/(.*)%$/){
			$value=$1/100;
			}
		
			$mega{$title}{$sample}=$value;
		}
	}
	close FILE;
}
close F1;
	my $hashref=\%mega;
	 return $hashref;
}

open OUT,">megabolt_ztron.fq_stat_value.table";

print OUT "title\tsample\tdiff\n";
for my $tit (keys %ztron){
	my $num=0;
	for my $samp (keys %{$ztron{$tit}}  ){
		my $diff=($ztron{$tit}{$samp}>$mega1{$tit}{$samp})?($ztron{$tit}{$samp}-$mega1{$tit}{$samp}):($mega1{$tit}{$samp}-$ztron{$tit}{$samp});
	#	my $diff_val=$diff/$ztron{$tit}{$samp};
	#	if ($diff_val <= $freq && $diff_val >= -$freq){
			print OUT "$tit\t$samp\t$diff\n";
	#		$num++;
	#	}
	#	else{
	#		print OUT "$tit\t$samp\t$diff_val\tNo\n";
	#	}
	}
#	print OUT1 "$tit\t$num\n";
}
close OUT;
#close OUT1;

#!/usr/bin/perl -w
use strict;
my $me=shift @ARGV;
my $ztr=shift @ARGV;
my %mega1=();
my %ztron=();
my $freq ||= 0.0002;

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
		if (/Sample/){
			$sample=(split/\t/,$_)[-1];
		}	
		else{
			($title,$value)=(split/\t/,$_);
			if ($title =~/Average_depth/){
				$title="Average_depth";
			}
			elsif($title =~/>=(\w+)/){
				$title="Cov" . $1;
			}
			elsif($title =~/Uniformity/){
				$title="Uniformity";
			}
		
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

open OUT,">megabolt_ztron.bam_stat_value.table";

print OUT "title\tsample\tdiff\n";
for my $tit (keys %ztron){
	my $num=0;
	for my $samp (keys %{$ztron{$tit}}  ){
		my $diff=($ztron{$tit}{$samp}>$mega1{$tit}{$samp})?($ztron{$tit}{$samp}-$mega1{$tit}{$samp}):($mega1{$tit}{$samp}-$ztron{$tit}{$samp});
			print OUT "$tit\t$samp\t$diff\n";
	}
}
close OUT;
close OUT1;

#!/usr/bin/perl -w
use strict;
my $samtools="~/anaconda3/envs/vcf/bin/samtools";
my $ztron= shift @ARGV;
my $megabolt= shift @ARGV;
open F1,"$samtools view $ztron | " or die $!;
open F2,"$samtools view $megabolt | " or die $!;
my %bench=();
while(<F1>){
	chomp;
	my ($id,$chr,$pos,$seq,$qua)=(split/\t/,$_)[0,2,3,9,10];
	my $key=join "\t",($id,$chr,$pos,$seq);
#	print "ZTRON\t$key\n";
	$bench{$key}++;
}
close F1;
my $tp;
while(<F2>){
	chomp;
	my ($id,$chr,$pos,$seq,$qua)=(split/\t/,$_)[0,2,3,9,10];
	my $tmp=join "\t",($id,$chr,$pos,$seq);
#	print "MEGABOLT\t$tmp\n";
	if (exists $bench{$tmp}){
		$tp++;

	}
}
print "tp_num=$tp";
close F2;



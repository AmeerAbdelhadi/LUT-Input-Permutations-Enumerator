#!/usr/bin/perl -w
# Ameer  Abdelhadi
# ameer@ece.ubc.ca
# June, 2011

use strict;   # Install all strictures
use warnings; # Show warnings
$|++;         # Force auto flush of output buffer

my $spiFN = "/CMC/kits/tsmc_65nm_libs/tcbn65lp/TSMCHOME/digital/Back_End/spice/tcbn65lp_200a/tcbn65lp_200a.spi";
open(SPIHND,$spiFN) || die "Can't open spi file";
my @spiLines = <SPIHND>;
chomp(@spiLines);
close(SPIHND);

my %nchCnt = ();
my %pchCnt = ();
for (my $i=0; $i<=$#spiLines; $i++) {

  # ignore comment lines
  if ($spiLines[$i] =~ /^\s*\*/) {next}

  # ignore empty lines
  if ($spiLines[$i] =~ /^\s*$/ ) {next}

  # if .subckt keyword, define new cell
  if ($spiLines[$i] =~ /^\s*\.subckt\s+(\S+)/ ) {
    $i++;
    my $currCell = $1;
    $nchCnt{$currCell} = 0;
    $pchCnt{$currCell} = 0;
    while ($spiLines[$i] !~ /^\s*\.ends\s*$/) {
      my @device = split(/\s+/,$spiLines[$i]);
      if ($device[5] eq "nch") {$nchCnt{$currCell}++}
      if ($device[5] eq "pch") {$pchCnt{$currCell}++}     
      $i++;
    }
  }
  
}

#foreach my $key (keys(%nchCnt)) {
#  print "$key $nchCnt{$key} $pchCnt{$key}\n";
#}

my $netFN = $ARGV[0];
open(NETHND,$netFN) || die "Can't open netlist file";
my @netLines = <NETHND>;
chomp(@netLines);
close(NETHND);

my @chunks = split(/\s*\;\s*/,"@netLines");

my $totNchCnt = 0;
my $totPchCnt = 0;

my $format = "%-12s%-5s%-5s%-5s\n";
my $spacer = "=" x 27 . "\n";
printf($format,"Cell","nch","pch","tot");
print $spacer;
foreach my $chunk (@chunks) {
  if ($chunk =~ /^\s*$|^\s*module\s+|^\s*endmodule\s+|^\s*input\s+|^\s*output\s+|^\s*wire\s+|^\s*reg\s+/) {next}
  if ($chunk =~ /^\s*(\S+)\s+(\S+)\s+\(.*\)\s*$/) {
    my $currCell = $1;
    my $currInst = $2;
    my $curNchCnt = $nchCnt{$currCell};
    my $curPchCnt = $pchCnt{$currCell};
    my $curTot = $curNchCnt + $curPchCnt;
    $totNchCnt += $curNchCnt;
    $totPchCnt += $curPchCnt;
    printf($format,$currCell,$curNchCnt,$curPchCnt,$curTot);
  }
}

my $totDevCnt = $totNchCnt + $totPchCnt;
print $spacer;
printf($format,"TOTAL",$totNchCnt,$totPchCnt,$totDevCnt);

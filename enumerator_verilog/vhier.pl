#!/usr/bin/perl -w
# Ameer  Abdelhadi
# ameer@ece.ubc.ca
# May, 2011

use strict;   # Install all strictures
use warnings; # Show warnings
$|++;         # Force auto flush of output buffer

printHierarchies(0,$ARGV[0]);

# recursive printing of hierarchies
sub printHierarchies {
    my ($indent,$module) = @_;
    my @subModules;
    my @moduleFiles = getModulesFiles($module);

    print "" . (" " x $indent) . "$module      @ @moduleFiles\n";

    @subModules = getModulesInstantiations($module);
    
    # recurse down hierarchy
    foreach my $subModule (@subModules) {
	  printHierarchies($indent+2,$subModule);
    }

}

# return a list of instatntiated modules inside the given module
sub getModulesInstantiations {
  my @modules = @_;
  my @instatiations;
  foreach my $module (@modules) {
    my @files = getModulesFiles($module);
    if (scalar(@files) < 1) {next;}
    my $fileName = shift(@files);
    open(VRLGHNDL, $fileName ) || return;
    my @vrlgLines = <VRLGHNDL>;
    chomp(@vrlgLines);
    close(VRLGHNDL);

    my $isGeneric      = 1 ;
    my $isPlatform     = 0 ;
    my $genericOneLine = "";
    my $moduleLine     = "";

    foreach my $vrlgLine (@vrlgLines) {

      # remove comments
      $vrlgLine =~ s/(.*)\/\/.*/$1/g;
   
      # remove precompile, and choose code where PLATFORM_GENERIC is defined
      if ($vrlgLine =~ /^\s*\`(\S+)\s*(\S*)/) {
        my ($def1,$def2)=($1,$2);
        if    ($def2 =~ /PLATFORM_/)                            { $isPlatform = 1;      }
        if    ($def1 =~ /endif/    )                            { $isPlatform = 0;      }
        if    ($def1 =~ /endif/ || $def2 =~ /PLATFORM_GENERIC/) { $isGeneric  = 1; next }
        elsif ($def1 =~ /ifdef|elsif|else/ && $isPlatform     ) { $isGeneric  = 0; next }
        else                                                    {                  next }
      }
      if ($isGeneric) {$genericOneLine .= "$vrlgLine "}
    } # for vrlgLines

    # get specific module only
    if ($genericOneLine =~ /module\s+$module\s+(.+?)(endmodule\b)+?/) {
      $moduleLine =  $1;
    }

    # get instantiations
    while ($moduleLine =~ /\s+(\S+)\s+(\S+)\s*\(\s*\./g) {
      if ($1 !~ /\)/) {push(@instatiations,$1);}
    }

  } # for modules

  return uniq(@instatiations);
}

# returns files list containing given modules
sub getModulesFiles {
  my @modules = @_     ;
  my @vfiles  = <./*.v>;
  my @mfiles           ;
  foreach my $module (@modules) {
    foreach my $vfile (@vfiles) {
      open(VHNDL, $vfile) || next;
      my @vfileList=<VHNDL>; close(VHNDL);
      if ("@vfileList" =~ /\bmodule\s*$module\b/) {
        push(@mfiles,$vfile);
      }
    }
  }
  return uniq(@mfiles);
}

# uniq a list (remove redundant items)
sub uniq {
  my %seen = ();
  foreach my $item (@_) { $seen{$item}++; }
  my @uniq_ = keys %seen;
  return @uniq_; 
}


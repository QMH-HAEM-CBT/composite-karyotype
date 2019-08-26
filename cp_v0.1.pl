#!/usr/bin/perl

################################################################################
# This script takes the CSV output from MetaSystem and convert the karyotypes
# from individual metaphases to a composite karyotype in the format of ISCN.
#
# Author: Clinical Bioinformatics Team, Cytogenetics and Genomics Laboratory,
#         Division of Haematology, Queen Mary Hospital
#
# Creation Date: 25/08/2019
# Modified Date: 25/08/2019
#
# v0.1: Prototypical version
################################################################################

use strict;
use warnings;

$/ = "\r\n";   # Change the default new line character from LF to CRLF to take input from MetaSystem

open IN, $ARGV[0], or die $!;
<IN>;
while(<IN>){
   chomp;
   my @fields = split '";"';  # Split by ";", instead of just by semicolon

   $fields[0] =~ s/^"//;   # Remove the leading quotation mark
   $fields[$#fields] =~ s/"$//;  # Remove the trailing quotation mark

   print ($fields[4]);
   print "\n";
}
close IN;

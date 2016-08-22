#!/usr/bin/perl -w
#use strict;
use diagnostics;

open FILE_1, "/Users/christophermotes/file.500";
while (<FILE_1>) {
  s/Protocol 2/Protocol 1,2/;
  }
close FILE_1;

#!/usr/bin/perl
$ip = "/sbin/ip route show";
open route_table, "$ip |";
while (<route_table>) { 
    if (/via/) { 
      split(/\s+/);
      push @routes_list, $_[2];  }
 }
close route_table;
print @routes_list;
open cats, ">/home/cmotes/test.file" or die "fuck you";
for ( @routes_list) {
print cats "$_\n"; }
close cats;


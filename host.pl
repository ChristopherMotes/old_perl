#!/usr/bin/perl
print "\n";
($name,$aliases,$type,$len,$addr) = gethostbyname("www.verisign.com");
($a,$b,$c,$d) = unpack('C4',$addr);
print "$name has these aliases:\n";
print "$aliases\n";
print "and resolves to the following ip:\n";
print "$a.$b.$c.$d\n";

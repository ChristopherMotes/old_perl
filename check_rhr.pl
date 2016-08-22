#!/usr/bin/perl
$REDHAT=`cat /etc/redhat-release`;
if ($REDHAT =~ /release 2.1/) {
   print "I am release 2.1";
} elsif ($REDHAT =~ /release [34]/) {
   print "I am relese 3";
} elsif ($REDHAT =~ /release 4/) {
 print "I am relese 4";
} else {
  print "unsure of relase taking no further action";
}

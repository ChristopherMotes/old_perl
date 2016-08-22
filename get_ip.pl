#!/usr/bin/perl
$BACK_OFFICE_INTERFACE="eth0";
$IP_INFO_COMMAND="/sbin/ifconfig $BACK_OFFICE_INTERFACE";
$IP_SEARCH_VALUE="inet ";
open IP_INFO, "$IP_INFO_COMMAND |" or die "you are fucked";
while (<IP_INFO>) {
   if (/$IP_SEARCH_VALUE/) {
    split(/\s+|\:/);
    $BACKOFFICE_IP="$_[3]"; }
}
close IP_INFO;

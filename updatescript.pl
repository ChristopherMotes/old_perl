#!/usr/bin/perl
$CONFIG_FILE="rrpag.config.7500";
$CONFIG_FILE_BACKUP="${CONFIG_FILE}.srsupdate.old";
$CONFIG_DIR="/app/registry/core-srs-rrpag-6.2.0.3/";
$CLUSTER_SOURCE="/app/registry/core-srs-rrpag-6.0.0.11/";
$COPY_COMMAND="/bin/cp";
$REGEX_COMMAND="/bin/grep";
$CLUSTER_LINE=`$REGEX_COMMAND cluster\.targets ${CLUSTER_SOURCE}${CONFIG_FILE}`;
chomp $CLUSTER_LINE;
$HEALTH_CHECK_LINE="gateway.healthcheck.ipAddresses=172.24.16.5,172.24.16.6";
$GATEWAY_PASSWORD="Registry99";
$GATEWAY_KEYSTORE="gateway.ssl.keystore.password=";
$GATEWAY_TRUSTSTORE="gateway.ssl.truststore.password=";




system($COPY_COMMAND, "${CONFIG_DIR}${CONFIG_FILE}", "${CONFIG_DIR}${CONFIG_FILE_BACKUP}");
open BACKUP_CONFIG_FILE, "${CONFIG_DIR}${CONFIG_FILE_BACKUP}" or die "no backup file found";
open CURRENT_CONFIG_FILE, ">${CONFIG_DIR}${CONFIG_FILE}";
while (<BACKUP_CONFIG_FILE>) {
     s/cluster\.targets=.*/$CLUSTER_LINE/;
     s/gateway.healthcheck.ipAddresses=\s/$HEALTH_CHECK_LINE/;
     s/${GATEWAY_KEYSTORE}.*/${GATEWAY_KEYSTORE}${GATEWAY_PASSWORD}/;
     s/${GATEWAY_TRUSTSTORE}.*/${GATEWAY_TRUSTSTORE}${GATEWAY_PASSWORD}/;
     print CURRENT_CONFIG_FILE $_;
}
close BACKUP_CONFIG_FILE;
close CURRENT_CONFIG_FILE;

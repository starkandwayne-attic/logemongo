#!/usr/bin/perl

use strict;
use warnings;

use Getopt::Long;
use IPC::Open2;

my $nossl = '';                       # SSL enabled by default
my $sawmill_ip = '10.244.73.2';       # default for BOSH lite
my $sawmill_port = '443';             # default port
my $sawmill_user = 'admin';           # default for BOSH lite
my $sawmill_pass = 'admin';           # default for BOSH lite

GetOptions("nossl"    => \$nossl,
           "host=s"   => \$sawmill_ip,
           "port=s"   => \$sawmill_port,
           "user=s"   => \$sawmill_user,
           "pass=s"   => \$sawmill_pass)
or die("Error in command line arguments\n");

my $sawmill_url = "https://$sawmill_ip:$sawmill_port";
my $sawmill_ws  = "$sawmill_url/ws";

my $sslmsg = '';
my $curl = "curl -s -u $sawmill_user:$sawmill_pass $sawmill_url";

if ($nossl) {
  $sslmsg = "\n\nSSL is disabled.";
  $curl = "$curl -k";
}

print "Targeting sawmill at '$sawmill_url'. $sslmsg\n\nDepending on your configuration it may take a moment for log\nmessages to appear. Please be patient.\n\n";

my $logs;
$| = 1;                               # using pipe mode -> turns off buffering
my $pid = open2($logs, undef, "$curl") or die;

while (<$logs>) {
    print;
}

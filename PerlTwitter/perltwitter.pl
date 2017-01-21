#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Encode;
binmode STDOUT,":utf8";

use Net::Twitter;

my $consumerKey = "s8Z785x1q8OAgmhWmmfopA6vB";
my $consumerSecret = "IGXvOnd6sKW7eAccoliiOiczZAKtzqyI6FKpfexNYJAaR7C9Zy";
my $accessToken = "1014888828-21sBDgbmfnAi6gHv8CmXaT4ruIvM7u96ZZRL6Sx";
my $accessTokenSecret = "OB9sO8oO1sY0tYVk9yVtiQmBlikbkkEXRhNU8qRZjNa1n";


my $nt = Net::Twitter ->new({
    traits => [qw/OAuth API::RESTv1_1/],
    consumer_key => $consumerKey,
    consumer_secret => $consumerSecret,
    access_token => $accessToken,
    access_token_secret => $accessTokenSecret}
    );

while (<STDIN>) {
    chomp;
    &tweet($_);
}

sub tweet {
    my ($msg) = @_;
    $msg = decode_utf8($msg);
    my $ret = $nt->update({status=>$msg});
    print "Cannot post!!" unless $ret;

}

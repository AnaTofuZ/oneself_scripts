#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Encode;
use Data::Dumper;

binmode STDOUT,":utf8";

use Net::Twitter;

my $keys =require ('Keys');

my $nt = Net::Twitter ->new({
    traits => [qw/OAuth API::RESTv1_1/],
    consumer_key => $keys->{"consumerKey"},
    consumer_secret => $keys->{"consumerSecret"},
    access_token => $keys->{"accessToken"},
    access_token_secret => $keys->{"accessTokenSecret"}}
    );


while (<STDIN>) {
    chomp;
    if ($_ eq "mention"){
        &replay;
        redo;
    } 

    &tweet($_);
}

sub tweet {
    my ($msg) = @_;
    $msg = decode_utf8($msg);
    my $ret = $nt->update({status=>$msg});
    print "Cannot post!!" unless $ret;
}

sub replay {

    my $res = $nt->mentions();

    for my $mention (@$res){
        my $mentionText = $mention->{text};
        my $mentionUser = $mention->{user}->{screen_name};
        my $mentionID = $mention->{user}->{name};

        printf(" %s 【%s】「%s」\n",$mentionID,$mentionUser,$mentionText);

    }
}

#!/usr/bin/env perl
use strict;
use warnings;
use utf8;

use Net::Twitter;
use Scalar::Util 'blessed';


my $nt = Net::Twitter ->new(
    traits => ['API::RESTv1_1'],
    consumer_key => "",
    consumer_secret => "",
);



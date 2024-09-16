#!/usr/bin/perl
use strict;
use warnings;

my $_a = 0;
print "$_a\n";
my $_b = 1;
print "$_b\n";
my $_c = $_a + $_b;

do {
    print "$_c\n";
    $_a = $_b;
    $_b = $_c;
    $_c = $_a + $_b;
} until $_c =~ /\D/;

print "Overflowed!\n";

#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use File::Slurp;
my $csv = Text::CSV_XS->new;
my @data = read_file("04_perl_education.csv");
foreach (@data) {
    $csv->parse($_);
    my @fields = $csv->fields;
    print $fields[3],"\n" if $fields[3] ne '';
}

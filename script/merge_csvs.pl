#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use FindBin qw/$Bin/;
use Smart::Comments;

=head1 merge_csvs.pl

Time to merge the two csv files into one big survey file.

=cut

my $file1 = "$Bin/../data/survey1.csv";
my $file2 = "$Bin/../data/survey2.csv";

my @f1data = get_array_file($file1);
my @f2data = get_array_file($file2);

my @all_data = combine_data( \@f1data, \@f2data);

my $out = "$Bin/../data/all_data.csv";
my $csv = Text::CSV_XS->new ({ binary => 1, eol => $/ });
open my $OUT, ">", $out;
foreach (@all_data) { ### writing===[%]
    $csv->combine(@$_);
    print $OUT $csv->string;
}

sub combine_data {
    my ($f1, $f2) = @_;
    my @all;
    for my $i (0 .. $#{$f1}) { ### combining===[%]
        $DB::single=1;
        push @all, [(@{$f1->[$i]}, @{$f2->[$i]})];
    }
    return @all;
}

sub get_array_file {
    my $file = shift;
    my $csv = Text::CSV_XS->new ({ binary => 1, eol => $/ });
    my @data;

    open my $io, "<", $file or die "$file: $!";

    while (my $row = $csv->getline ($io)) { ### slurping===[%]
        push @data, $row;
    }

    return @data;
}

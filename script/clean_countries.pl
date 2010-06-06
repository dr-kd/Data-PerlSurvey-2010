#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use FindBin qw/$Bin/;
my $num = 4; # country of birth
if ($ARGV[0]) { $num = 5 } # country of residence;

my $file = "$Bin/../data/all_data.csv";
my $csv = Text::CSV_XS->new ({ binary => 1, eol => $/ });
open my $io, "<", $file or die "$file: $!";
while (my $row = $csv->getline ($io)) { 
        $row->[$num] = lc($row->[$num]);
        $row->[$num] =~ s/^(united states( of america)?|us|u\.s(\.a)?(\.)?|us of a)$/usa/i;
        $row->[$num] =~ s/^(russia|ussr|soviet union|ru)$/russian federation/i;
        $row->[$num] =~ s/^(the netherlands|nl)$/netherlands/i;
        $row->[$num] =~ s/^(ch|switzerland`|swiss)$/switzerland/i;
        $row->[$num] =~ s/^(uk$|.*?united kin?gdom.*?|scotland|wales|great britain)$/united kingdom/i;
        $row->[$num] =~ s/^(de|german democratic republic|gemany)$/germany/i;
        $row->[$num] =~ s/^no$/norway/i;
        $row->[$num] =~ s/^france, of course$/france/i;
        $row->[$num] =~ s/^at$/austria/i;
        print $row->[$num], "\n";

}


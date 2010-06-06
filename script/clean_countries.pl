#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use FindBin qw/$Bin/;

my $file = "$Bin/../data/all_data.csv";
my $outfile = "$Bin/../data/all_data_countries_cleaned.csv";
open my $OUT, ">", $outfile;
my $csv = Text::CSV_XS->new ({ binary => 1, eol => $/ });
open my $io, "<", $file or die "$file: $!";

    while (my $row = $csv->getline ($io)) {
        for my $num (4,5) {
            $row->[$num] = lc($row->[$num]);
            $row->[$num] =~ s/^((the )?unite[ds] states( of america| minor outlying islands)?|us|u\.s(\.a)?(\.)?|us of a)$/usa/i;
            $row->[$num] =~ s/(^\s+)|(\s+$)//i;
            $row->[$num] =~ s/^$/not stated/i;
            $row->[$num] =~ s/^(unknown|confidential)$/not stated/i;
            $row->[$num] =~ s/^viet nam$/vietnam/i;
            $row->[$num] =~ s/^(the )?republic of//i;
            $row->[$num] =~ s/^.*?korea.*$/korea/i;
            $row->[$num] =~ s/^brasil*$/brazil/i;
            $row->[$num] =~ s/^catalunya/catalonia/i;
            $row->[$num] =~ s/^(czechoslovakie|cz)$/czech republic/i;
            $row->[$num] =~ s/^iran, islamic republic of$/iran/i;
            $row->[$num] =~ s/^(russ(ia|ai)|ud?ssr|soviet union|ru)$/russian federation/i;
            $row->[$num] =~ s/^(the netherlands|nl)$/netherlands/i;
            $row->[$num] =~ s/^(ch|switzerland`|swiss)$/switzerland/i;
            $row->[$num] =~ s/^(uk$|.*?united kin?gdom.*?|scott?land|wales|england|(great )?britain)$/united kingdom/i;
            $row->[$num] =~ s/^(de|ger||german democratic republic|gemany)$/germany/i;
            $row->[$num] =~ s/^no$/norway/i;
            $row->[$num] =~ s/^au$/australia/i;
            $row->[$num] =~ s/^france, of course$/france/i;
            $row->[$num] =~ s/^nzl?$/new zealand/i;
            $row->[$num] =~ s/^at$/austria/i;
            $row->[$num] =~ s/^dk$/denmark/i;
            $row->[$num] =~ s/^jerusalem$/israel/i;
        }
        my @newrow = $csv->combine(@$row);
        print $OUT $csv->string(@newrow), "\n";
    }


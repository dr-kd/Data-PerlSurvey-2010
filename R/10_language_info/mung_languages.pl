#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use File::Slurp;
# use Smart::Comments;
use YAML;

my $csv = Text::CSV_XS->new;
my @lines = read_file("10_language_info.csv");
my @language_data;
foreach (@lines) { ### parsing csv===[%]
    $csv->parse($_);
    my @line = $csv->fields;
    push @language_data, \@line;
}

my %languages;
foreach my $l (@language_data){ ### getting each langage===[%]
    foreach my $m (@$l[1 .. 5]) {
        next if $m eq '';
        $languages{lc($m)} = '';
    }
}

open my $OUT, ">", "languages_rank.csv";
my @head = keys %languages;
$csv->combine(@head);
print $OUT $csv->string,"\n";

my @all_languages;
foreach my $m (@language_data) {
    next if $m->[1] eq 'language_1';
    my %person_lang = %languages;
    my @person_lang;
    my @langs = @$m[1 .. 5];
    my $perlpos = $m->[6]-1;
    splice(@langs,$perlpos,0,('perl'));
    for my $i (0 .. $#langs) {
        $person_lang{lc($langs[$i])} = $i + 1;
    }
    @person_lang{keys %person_lang} = values %person_lang;
    $csv->combine(@person_lang{@head});
    print $OUT $csv->string,"\n";

}





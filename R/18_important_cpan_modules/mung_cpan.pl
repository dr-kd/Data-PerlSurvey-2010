#!/usr/bin/env perl
use warnings;
use strict;
#!/usr/bin/env perl
use warnings;
use strict;
use Text::CSV_XS;
use File::Slurp;
# use Smart::Comments;
use YAML;

my $csv = Text::CSV_XS->new;
my @lines = read_file("18_important_cpan_modules.csv");
my @cpan_data;
foreach (@lines) {
    $csv->parse($_);
    my @line = $csv->fields;
    push @cpan_data, \@line;
}

my %modules;
foreach my $l (@cpan_data) {
    foreach my $m (@$l[1 .. 5]) {
        next if $m eq '';
        $modules{lc($m)} = '';
    }
}

open my $OUT,">","cpan_rank.csv";
my @head = keys %modules;
$csv->combine(@head);
print $OUT $csv->string,"\n";

my @all_modules;
foreach my $m (@cpan_data) {
    next if $m->[1] eq 'CPAN_1';
    my %person_modules = %modules;
    my @person_modules;
    my @mods = @$m[1 .. 5];
    for my $i (0 .. $#mods) {
        $person_modules{lc($mods[$i])} = $i + 1;
    }
    @person_modules{keys %person_modules} = values %person_modules;
    $csv->combine(@person_modules{@head});
    print $OUT $csv->string,"\n";
}
print $OUT "====";

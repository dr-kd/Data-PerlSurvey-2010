use inc::Module::Install;

name     'Data-PerlSurvey-2010';
all_from 'lib/Data/PerlSurvey/2010.pm';
author   q{Kieren Diment <zarquon@cpan.org>};
license  'perl';

build_requires 'Test::More';

auto_install;

WriteAll;


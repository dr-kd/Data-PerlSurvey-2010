#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'Data::PerlSurvey::2010' ) || print "Bail out!
";
}

diag( "Testing Data::PerlSurvey::2010 $Data::PerlSurvey::2010::VERSION, Perl $], $^X" );

use 5.006;
use strict;
use warnings;
use Test::More;

if ( $ENV{API_KEY} ) {
    plan tests => 1;
} else {
    plan( skip_all => "API_KEY env var required for testing." );
}

BEGIN {
    use_ok('Mslm') || print "Bail out!\n";
}

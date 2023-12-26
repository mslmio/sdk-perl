use 5.006;
use strict;
use warnings;
use Test::More;

if ( $ENV{RELEASE_TESTING} ) {
    plan tests => 1;
} else {
    plan( skip_all => "Usage tests not required for installation" );
}

# my $api_key = $ENV{API_KEY};


BEGIN {
    use_ok('Mslm') || print "Bail out!\n";
}

# my $mslm = Mslm->new($api_key);
# my $resp = $mslm->EmailVerify->single_verify('support@mslm.io');

diag("done testing module Mslm");

#########################

# Insert your test code below, the Test::More module is use()ed here so read
# its man page ( perldoc Test::More ) for help writing this test script.

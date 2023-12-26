#!/usr/bin/perl
#
use strict;
use warnings;

use lib 'Mslm/lib';

use JSON;
use Data::Dumper;

# Mslm module usage
use Mslm;

my $mslm = Mslm->new('aas123456789jkl');
my $resp = $mslm->email_verify->single_verify('support@mslm.io');

if ( defined $resp ) {
    my $json        = JSON->new->allow_blessed->convert_blessed;
    my $json_string = $json->utf8->pretty->encode($resp);
    print $json_string . "\n";
    # print Dumper($resp);
}
else {
    print $mslm->email_verify->error_msg . "\n";
}

# my $otp_send_req1 = {
#     phone          => "03001234567",
#     tmpl_sms       => "",
#     token_len      => 4,
#     expire_seconds => 120
# };
# my $resp = $mslm->otp->send($otp_send_req1);

# if ( defined $resp ) {
#     my $json        = JSON->new->allow_blessed->convert_blessed;
#     my $json_string = $json->utf8->pretty->encode($resp);
#     print $json_string . "\n";
#     # print Dumper($resp);
# }
# else {
#     print $mslm->otp->error_msg . "\n";
# }


# Mslm::EmailVerify sub-module usage
# use Mslm::EmailVerify;

# my $email_verify = Mslm::EmailVerify->new('aas123456789jkl');
# my $resp = $email_verify->single_verify('support@mslm.io');
# print Dumper($resp);


# Mslm::OTP sub-module usage
# use Mslm::OTP;
# my $otp_send_req2 = {
#     phone          => "03001234567",
#     tmpl_sms       => "Your verification code is: {1234}",
#     token_len      => 4,
#     expire_seconds => 120
# };

# my $otp  = Mslm::OTP->new('aas123456789jkl');
# my $resp = $otp->send($otp_send_req2);
# if ( defined $resp ) {
#     print Dumper($resp);
# }
# else {
#     print $otp->error_msg . "\n";
# }

# my $otp_verify_req = {
#     phone          => "03001234567",
#     token          => "1234",
#     consume        => \1
# };

# my $resp = $otp->verify($otp_verify_req);
# if ( defined $resp ) {
#     print Dumper($resp);
# }
# else {
#     print $otp->error_msg . "\n";
# }

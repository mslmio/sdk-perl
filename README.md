# Mslm Perl SDK

The official Perl SDK for Mslm APIs.

## Requirements

Perl version 5.006 or above.

## Authentication

Mslm's APIs require an API key. If you don't have one, please read
[Authentication](https://mslm.io/docs/api/authentication) to understand how to
get an API key before continuing.

## Installation

### Via CPAN or CPANMINUS

`Mslm` module can be installed using `cpan` or `cpanm`:

```bash
cpanm Mslm
```

### Via source

If you'd like to install from source (not necessary for use in your application), download the source and run the following commands within the Mslm directory:

```bash
perl Makefile.PL
make
make test
make install
```

## Usage

```perl
use Mslm;

my $api_key = "YOUR_API_KEY";
my $mslm = Mslm->new($api_key);

# Access EmailVerify functionality
my $sv_details = $mslm->email_verify->single_verify('support@mslm.io');

# Access OTP functionality. (OTP service is currently available for Pakistan only)
# Sending OTP
my $response = $mslm->otp->send({
	phone          => '03001234567',
	tmpl_sms       => 'Your verification code is: <otp>',
	token_len      => 6,
	expire_seconds => 60
});
# Verifying OTP token
my $verification_result = $mslm->otp->verify({
	phone   => '03001234567',
	token   => '123456',
	consume => \1
});
```

You can install and use sub-modules that are available under the Mslm module individually.

### Using EmailVerify sub-module

```perl
use Mslm::EmailVerify;

my $api_key = "YOUR_API_KEY";
my $email_verifier = Mslm::EmailVerify->new($api_key);

# Single email verification
my $verification_result = $email_verifier->single_verify('example@example.com');
```

### Using OTP sub-module

```perl
use Mslm::OTP;

my $api_key = "YOUR_API_KEY";
my $otp = Mslm::OTP->new($api_key);

# Sending OTP
my $response = $otp->send({
	phone          => '03001234567',
	tmpl_sms       => 'Your verification code is: <otp>',
	token_len      => 6,
	expire_seconds => 60
});

# Verifying OTP token
my $verification_result = $otp->verify({
	phone   => '1234567890',
	token   => '123456',
	consume => \1
});
```

### Configuration

The `new` method of each client accepts an optional `%opts` parameter, which can be used to override the `base_url`, `user_agent`, `timeout`, and `http_client`; where `http_client` can only be a `LWP::UserAgent`.
* Default base_url: 'https://mslm.io'
* Default user_agent: 'mslm/perl/1.0'
* Default request timeout: 120 seconds
* Default http_client: LWP::UserAgent

```perl
$mslm = Mslm->new($api_key, (timeout => 180, base_url => "https://example.com"));
```

The `single_verify` method of EmailVerify sub-module, can accept an additional option; `disable_url_encoding`, that can be set to `1` (TRUE), if the email address you are providing is already URL encoded. URL encoding is enabled by default.

```perl
my $email_verifier = Mslm::EmailVerify->new($api_key);
my $sv_details = $mslm->email_verify->single_verify('support@mslm.io', (disable_url_encoding => '1'));
```

Methods `set_base_url`, `set_http_client`, `set_user_agent`, and `set_api_key` can also be used for configuration.

```perl
$mslm = Mslm->new($api_key);
$mslm->set_api_key("YOUR_NEW_API_KEY");
```


## Additional Resources

See the official [API Reference Documentation](https://mslm.io/docs/api) for
details on each API's actual interface, which is implemented by this SDK.

## Contributing

See [CONTRIBUTING](CONTRIBUTING.md) for more information.

## Security

See [Security Issue
Notifications](CONTRIBUTING.md#security-issue-notifications) for more
information.

## License

This project is licensed under the [MIT License](LICENSE).

## About Mslm

At Mslm, we're all about making things better. Where others see norm, we see
opportunity.

We build world-class solutions to the toughest problems. Excellence is a core
value that defines our approach from top to bottom.

We're all about creating positive value for ourselves, our partners and our
societies.

We do it by focusing on quality and the long-term, while intelligently
maneuvering the complex realities of day-to-day business.

Our partners share our perspective, and we jointly produce truly world-class
solutions to the toughest problems.

[![image](https://avatars.githubusercontent.com/u/50307970?s=200&v=4)](https://mslm.io/)

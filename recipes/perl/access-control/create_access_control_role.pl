#!/usr/bin/env perl

use LWP::UserAgent;
use LWP::Protocol::https;
use JSON;
use Getopt::Long;

require 'api_requests.pl';
require 'access_control_api_requests.pl';

my $hostname;
my $username;
my $password;
my $domain_name;
my $domain_type;
my $role_name;
my $role_description;

my $base_url;
my $token;

GetOptions(
    'hostname=s' => \$hostname,
    'username=s' => \$username,
    'password=s' => \$password,
    'domain_name=s' => \$domain_name,
    'domain_type=s' => \$domain_type,
    'role_name=s' => \$role_name,
    'role_description=s' => \$role_description
) or die print_usage();

if ($hostname eq "") {
    print("Please provide value for 'hostname'");
    exit;
}

if ($username eq "") {
    print("Please provide value for 'username'");
    exit;
}

if ($password eq "") {
    print("Please provide value for 'password'");
    exit;
}

if ($role_name eq "") {
    print("Please provide value for 'role_name'");
}

$base_url = "https://$hostname/netbackup";
$token = perform_login($base_url, $username, $password, $domain_name, $domain_type);

create_access_control_role($base_url, $token, $role_name, $role_description);


sub print_usage {
    print("\n\nUsage:");
    print("\nperl list_gen1_roles -hostname <master_server> -username <username> -password <password> -role_name <role_name> [-role_description <role_description>] [-domain_name <domain_name>] [-domain_type <domain_type>]\n\n\n");
}


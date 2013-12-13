#; -*- mode: perl;-*-

use Test::Nginx::Socket;
use Cwd qw(cwd);

repeat_each(2);
plan tests => repeat_each() * blocks() * 3;

my $pwd = cwd();

our $HttpConfig = qq{
    resolver 8.8.8.8;
    lua_package_path "$pwd/lib/?.lua;;";
};

our $MainConfig = qq{
env IRONMQ_PROJECT;
env IRONMQ_TOKEN;
};

no_long_string();

run_tests();

__DATA__

=== TEST 1: List queues
--- main_config eval: $::MainConfig
--- http_config eval: $::HttpConfig
--- config
    location /t {
        content_by_lua_file '../../examples/list-queues.lua';
    }
--- request
GET /t
--- response_body
table
--- no_error_log
[error]
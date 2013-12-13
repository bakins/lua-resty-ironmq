# lua-resty-ironmq #

lua-resty-ironmq - simple [IronMQ](http://www.iron.io/) client for [ngx_lua](https://github.com/chaoslawful/lua-nginx-module)

## Status ##

Just started playing with IronMQ and this client is extremely new and incomplete.

## Requirements ##
- ngx_lua - https://github.com/chaoslawful/lua-nginx-module
- lua-resty-http-simple - https://github.com/bakins/lua-resty-http-simple

## Limitations ##

- Can only do http, not https.  This is due to the current lack of cosocket SSL support in ngx_lua.  I could have used sub-requests and captures, I suppose.


Copyright and License
=====================

This module is licensed under the BSD license.

Copyright (C) 2013, by Brian Akins <brian@akins.org>.

All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

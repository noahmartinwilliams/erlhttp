-module(htserv).
-include_lib("inets/include/httpd.hrl").
-export([start/0, do/1]).

do(#mod{request_uri=R}) -> 
	{proceed, [{response, {200, R}}]}.

go() ->
	go().

start() ->
	inets:start(),
	{ok, Pid} = inets:start(httpd, [{modules, [htserv]}, {port, 8080}, {server_name, "httpd"}, {server_root, "."}, {document_root, "./htdocs"}, {bind_address, "localhost"}]),
	go().

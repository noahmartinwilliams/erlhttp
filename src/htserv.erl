-module(htserv).

-export([start/0]).

go() ->
	go().

start() ->
	inets:start(),
	{ok, Pid} = inets:start(httpd, [{port, 8080}, {server_name, "httpd"}, {server_root, "."}, {document_root, "./htdocs"}, {bind_address, "localhost"}]),
	go().

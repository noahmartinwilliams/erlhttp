-module(htserv).

-export([start/0, do/1]).

do(_) -> {proceed, [{response, {200, "<html><body>hi</body></html>"}}]}.

go() ->
	go().

start() ->
	inets:start(),
	{ok, Pid} = inets:start(httpd, [{modules, [htserv]}, {port, 8080}, {server_name, "httpd"}, {server_root, "."}, {document_root, "./htdocs"}, {bind_address, "localhost"}]),
	go().

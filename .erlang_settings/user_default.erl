-module(user_default).
-author('kormie@gmail.com').

-export([clear/0]).

-import(io, [format/1]).

clear() ->
  io:format(os:cmd("clear")).

-module(msg_pack).

-export([init/1]).

-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    {ok, State1} = msg_pack_prv:init(State),
    {ok, State1}.

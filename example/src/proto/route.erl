-module(route).
-export([decode/1,encode/2]).

decode(<<101:16,1:16,Bin/binary>>) ->
    { role, cs_role,role:decode(Bin,cs_role)};
decode(<<101:16,2:16,Bin/binary>>) ->
    { role, sc_role,role:decode(Bin,sc_role)};
decode(<<103:16,1:16,Bin/binary>>) ->
    { ger, cs_ger,ger:decode(Bin,cs_ger)};
decode(<<103:16,2:16,Bin/binary>>) ->
    { ger, sc_ger,ger:decode(Bin,sc_ger)};
decode(<<103:16,3:16,Bin/binary>>) ->
    { ger, cs_ger_update,ger:decode(Bin,cs_ger_update)};
decode(<<103:16,4:16,Bin/binary>>) ->
    { ger, sc_ger_update,ger:decode(Bin,sc_ger_update)};
decode(Msg) ->
    throw({error, no_decoder,Msg}).

encode(cs_role, Msg) ->
    EncodeBin = role:encode(Msg),
    Bin = << 101:16, 1:16, EncodeBin>>,
    Bin;
encode(sc_role, Msg) ->
    EncodeBin = role:encode(Msg),
    Bin = << 101:16, 2:16, EncodeBin>>,
    Bin;
encode(cs_ger, Msg) ->
    EncodeBin = ger:encode(Msg),
    Bin = << 103:16, 1:16, EncodeBin>>,
    Bin;
encode(sc_ger, Msg) ->
    EncodeBin = ger:encode(Msg),
    Bin = << 103:16, 2:16, EncodeBin>>,
    Bin;
encode(cs_ger_update, Msg) ->
    EncodeBin = ger:encode(Msg),
    Bin = << 103:16, 3:16, EncodeBin>>,
    Bin;
encode(sc_ger_update, Msg) ->
    EncodeBin = ger:encode(Msg),
    Bin = << 103:16, 4:16, EncodeBin>>,
    Bin;
encode(_,Msg) ->
    throw({error, no_encoder, Msg}).

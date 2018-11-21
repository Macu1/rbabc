-module({{router_module}}).
-export([decode/1,encode/2]).

{{#commands}}
decode(<<{{router_id}}:16,{{message_id}}:16,Bin/binary>>) ->
    { {{pb_module}}, {{message_name}},{{pb_module}}:decode(Bin,{{message_name}})};
{{/commands}}
decode(Msg) ->
    throw({error, no_decoder,Msg}).

{{#commands}}
encode({{pb_module}}, Msg) ->
    EncodeBin = {{pb_module}}:encode(Msg),
    Bin = << {{router_id}}:16, {{message_id}}:16, EncodeBin>>
    Bin;
{{/commands}}
encode(_,Msg) ->
    throw({error, no_encoder, Msg}).
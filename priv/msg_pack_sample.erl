-module({{pp}}).
-export([decode/1,encode/2]).

{{#commands}}
decode(<<{{router_id}}:16,{{message_id}}:16,108:8,58:8,Bin/binary>>) ->
    { {{pb_module}}, {{message_name}},{{pb_module}}:decode_msg(Bin,{{message_name}})};
{{/commands}}
decode(Msg) ->
    throw({error, no_decoder,Msg}).

{{#commands}}
encode({{message_name}}, Msg) ->
    EncodeBin = {{pb_module}}:encode_msg(Msg),
    Bin = << {{router_id}}:16, {{message_id}}:16, 58:8,108:8,EncodeBin>>,
    Bin;
{{/commands}}
encode(_,Msg) ->
    throw({error, no_encoder, Msg}).

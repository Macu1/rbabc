-module(msg_pack_prv).

-export([init/1, do/1, format_error/1]).

-define(PROVIDER, msg_pack).
-define(DEPS, [app_discovery]).

%% ===================================================================
%% Public API
%% ===================================================================
-spec init(rebar_state:t()) -> {ok, rebar_state:t()}.
init(State) ->
    Provider = providers:create([
            {name, ?PROVIDER},            % The 'user friendly' name of the task
            {module, ?MODULE},            % The module implementation of the task
            {bare, true},                 % The task can be run by the user, always true
            {deps, ?DEPS},                % The list of dependencies
            {example, "rebar3 msg_pack"}, % How to use the plugin
            {opts, []},                   % list of options understood by the plugin
            {short_desc, "msg pack"},
            {desc, "msg pack"}
    ]),
    {ok, rebar_state:add_provider(State, Provider)}.


-spec do(rebar_state:t()) -> {ok, rebar_state:t()} | {error, string()}.
do(State) ->
    Config = rebar_state:opts(State),
    PackConfig = rebar_opts:get(Config,pack_config, []),
    GpbOpts = rebar_opts:get(Config, gpb_opts, []),
    {Options, _} = rebar_state:command_parsed_args(State),
    ProtoDir = proplists:get_value(protos, Options,
                                  proplists:get_value(protos,PackConfig, "proto")
                                  ),
    rebar_api:warn("pack config:~p ~p ~p ~n",[ProtoDir, PackConfig, GpbOpts]),
    [begin
        rebar_api:warn("pack proto name:~p",[FileName])
     end||FileName <-filelib:wildcard(filename:join(ProtoDir, "*.proto"))],
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

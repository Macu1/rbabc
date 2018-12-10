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
            {namespace, msg_pack},
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
%    App = rebar_state:current_app(State),
    Apps = case rebar_state:current_app(State) of
               undefined ->
                   rebar_state:project_apps(State);
               AppInfo ->
                   [AppInfo]
           end,
    lists:foreach(fun(DoApp) ->
                          DirBase = case DoApp of
                                        undefined -> ".";
                                        _ -> rebar_app_info:dir(DoApp)
                                    end,
                          FakeApp = rebar_app_info:out_dir(DoApp, DirBase),
                          rebar3_gpb_compiler:compile(FakeApp, State),
                          msg_pack_compile:compile(FakeApp,State),
                          rebar_api:warn("compile in app:~p",[rebar_app_info:name(FakeApp)])
                  end, Apps),
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).



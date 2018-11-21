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
    RouterMod = get_router_module(PackConfig, GpbOpts),
    rebar_api:warn("pack config:~p ~p ~p ~n",[ProtoDir, PackConfig, GpbOpts]),
    [begin
        rebar_api:warn("pack proto name:~p",[FileName]),
        GpbModule = preload_pb_file(FileName, GpbOpts),
        try
            gen_encoder_decoder(RouterMod,GpbModule,GpbOpts,PackConfig,State)
        catch E:R ->
                  rebar_utils:abort("Failed to generate tag_id_map :~p with ~p ~p ~n"
                                    ,[FileName,E,R])
        end
     end||FileName <-filelib:wildcard(filename:join(ProtoDir, "*.proto"))],
    {ok, State}.

-spec format_error(any()) ->  iolist().
format_error(Reason) ->
    io_lib:format("~p", [Reason]).

gen_encoder_decoder(RouterMod,GpbModule,_GpbOpts,PackConfig, State) ->
    RouterEnum = proplists:get_value(router_enum,PackConfig,"mod_list"),
%    RouterPackage = atom_to_list(RouterMod:get_package_name()),
    RouterEnumFun = list_to_atom("enum_value_by_symbol_"++RouterEnum),
    ModEnum = proplists:get_value(mod_enum,PackConfig,"tag_map"),
%    ModEnumFun = list_to_atom("enum_value_by_symbol_"++ModEnum),
    Commands = [begin
                    RouterID = RouterMod:RouterEnumFun(list_to_atom(S)),
                    [
                     [{router_id,RouterID}
                      ,{pb_module, atom_to_list(S)}
                      ,{message_id, MsgID}
                      ,{message_name, atom_to_list(MsgName)}
                     ]
                     ||{MsgName,MsgID} <- S:find_enum_def(list_to_atom(ModEnum))]
                end||S <- GpbModule],
    Service = [{out_dir, proplists:get_value(o_erl,PackConfig,"src")}
               ,{router_module, proplists:get_value(router_module,PackConfig,"router")}
               ,{commands, Commands}],
    rebar_log:log(debug, "service:~p",[Service]),
    Force = proplists:get_value(force, PackConfig, true),
    rebar_templater:new("msg_pack",Service,Force,State).

get_router_module(PackConfig, GpbOpts) ->
    RouterMod = proplists:get_value(router_module, PackConfig, "router"),
    ModuleNameSuffix = proplists:get_value(module_name_suffix, GpbOpts,"_pb"),
    ModuleNamePrefix = proplists:get_value(module_name_prefix, GpbOpts, ""),
    list_to_atom(ModuleNamePrefix ++ RouterMod ++ ModuleNameSuffix).

preload_pb_file(FileName,GpbOpts) ->
    Dir = proplists:get_value(o_erl, GpbOpts, "src"),
    ModuleNameSuffix = proplists:get_value(module_name_suffix,GpbOpts, "_pb"),
    ModuleNamePrefix = proplists:get_value(module_name_prefix,GpbOpts, ""),
    CompiledFileName = filename:join(Dir, ModuleNamePrefix ++
                                     filename:basename(FileName, ".proto")++
                                     ModuleNameSuffix ++".erl"),
    rebar_log:log(info, "loading ~s~n",[CompiledFileName]),
    GpbIncludeDir = filename:join(code:lib_dir(gpb), "include"),
    case compile:file(CompiledFileName,[binary, {i,GpbIncludeDir}, {i,"./include"},return_errors]) of
        {ok,Module,Compiled} ->
            {module, _} = code:load_binary(Module, CompiledFileName, Compiled),
            Module;
        {ok,Module,Compiled,Warnings} ->
            [begin
            rebar_api:warn("warning building ~s ~n",[File]),
            [rebar_api:warn("   ~p:~s",[Line,M:format_error(E)])||{Line,M,E}<-Es]
             end||{File,Es}<-Warnings],
            {module,_} = code:load_binary(Module, CompiledFileName, Compiled),
            Module;
        {error,Errors, Warnings} ->
            reabr_utils:abort("Failed to load ~p ~p:~p ~p~nPlease run rebar compile first!~n"
                             ,[CompiledFileName,Errors, Warnings, erlang:get_stacktrace()])
    end.

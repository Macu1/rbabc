-module(msg_pack_compile).

-export([compile/2]).

compile(AppInfo,State) ->
    DirBase = rebar_app_info:out_dir(AppInfo),
    Config = rebar_state:opts(State),
    PackConfig = rebar_opts:get(Config,pack_config, []),
    GpbOpts = rebar_opts:get(Config, gpb_opts, []),
    {Options, _} = rebar_state:command_parsed_args(State),
    ProtoDir = filename:join(DirBase,
                             proplists:get_value(protos, Options,
                                                 proplists:get_value(protos,PackConfig, "proto")
                                                )
                            ),
    RouterMod = get_router_module(DirBase,PackConfig, GpbOpts),
    rebar_api:abort("pack config:~p ~p ~p ~p~n",[DirBase,ProtoDir, PackConfig, GpbOpts]),
    AllCommands =
    lists:foldl(fun(FileName,Acc) ->
                        GpbModule = preload_pb_file(DirBase,FileName, GpbOpts),
                        RouterEnum = proplists:get_value(router_enum,PackConfig,"mod_list"),
                        AllRouters = RouterMod:find_enum_def(list_to_atom(RouterEnum)),
%                        rebar_api:warn("pack proto name:~p,~p",[FileName,AllRouters]),
                        case lists:keyfind(GpbModule,1,AllRouters) of
                            false -> Acc;
                            _ ->
                                try
                                    gen_encoder_decoder(RouterMod,RouterEnum,GpbModule,GpbOpts,PackConfig,State) ++ Acc
                                catch E:R ->
                                          rebar_utils:abort("Failed to generate tag_id_map :~p with ~p ~p ~n"
                                                            ,[FileName,E,R])
                                end
                        end
                end,[],filelib:wildcard(filename:join(ProtoDir, "*.proto"))),
    flush_commands(DirBase,PackConfig,AllCommands,State),
    ok.

gen_encoder_decoder(RouterMod,RouterEnum,GpbModule,_GpbOpts,PackConfig, _State) ->
            ModEnum = proplists:get_value(mod_enum,PackConfig,"tag_map"),
            RouterID = RouterMod:enum_value_by_symbol(list_to_atom(RouterEnum),GpbModule),
            Commands = [begin
                            [{router_id,RouterID}
                             ,{pb_module, atom_to_list(GpbModule)}
                             ,{message_id, MsgID}
                             ,{message_name, atom_to_list(MsgName)}
                            ]
                        end||{MsgName,MsgID} <- GpbModule:find_enum_def(list_to_atom(ModEnum))],
%            rebar_log:log(info, "~w commands:~p~n",[GpbModule,Commands]),
            Commands.

flush_commands(BaseDir,PackConfig,Commands,State)->
    OutDir = filename:join(BaseDir,proplists:get_value(o_erl,PackConfig,"src")),
    Service = [{out_dir, OutDir}
               ,{pp, proplists:get_value(file,PackConfig,"pp")}
               ,{commands, Commands}],
   % rebar_log:log(debug, "service:~p",[Service]),
    Force = proplists:get_value(force, PackConfig, true),
    rebar_templater:new("msg_pack",Service,Force,State).


get_router_module(BaseDir,PackConfig, GpbOpts) ->
    RouterMod = proplists:get_value(router_module, PackConfig, "route"),
    ModuleNameSuffix = proplists:get_value(module_name_suffix, GpbOpts,"_pb"),
    ModuleNamePrefix = proplists:get_value(module_name_prefix, GpbOpts, ""),
    FileName =ModuleNamePrefix ++ RouterMod ++ ModuleNameSuffix,
    preload_pb_file(BaseDir,FileName, GpbOpts),
    list_to_atom(FileName).

preload_pb_file(DirBase,FileName,GpbOpts) ->
    DirAppend = proplists:get_value(o_erl, GpbOpts, "src"),
    Dir = filename:join(DirBase,DirAppend),
    ModuleNameSuffix = proplists:get_value(module_name_suffix,GpbOpts, "_pb"),
    ModuleNamePrefix = proplists:get_value(module_name_prefix,GpbOpts, ""),
    CompiledFileName = filename:join(Dir, ModuleNamePrefix ++
                                     filename:basename(FileName, ".proto")++
                                     ModuleNameSuffix ++".erl"),
    rebar_log:log(info, "loading ~s~n",[CompiledFileName]),
    GpbIncludeDir = filename:join(code:lib_dir(gpb), "include"),
    IncludeDir = filename:join(DirBase,"include"),
    case compile:file(CompiledFileName,[binary, {i,GpbIncludeDir}, {i,IncludeDir},return_errors]) of
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
            rebar_utils:abort("Failed to load ~p ~p:~p ~p~nPlease run rebar compile first!~n"
                             ,[CompiledFileName,Errors, Warnings, erlang:get_stacktrace()])
    end.

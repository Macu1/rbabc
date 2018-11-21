msg_pack
=====

msg pack

Build
-----

    $ rebar3 compile

Use
---

Add the plugin to your rebar config:

    {plugins, [
        { msg_pack, ".*", {git, "git@host:user/msg_pack.git", {tag, "0.1.0"}}}
    ]}.

Then just call your plugin directly in an existing application:


    $ rebar3 msg_pack
    ===> Fetching msg_pack
    ===> Compiling msg_pack
    <Plugin Output>


Config
---

append these to rebar.config

    {pack_config, [{router_module,"route"}
                ,{router_enum, "mod_list"}
                ,{o_erl, "src/proto"}
                ,{mod_enum, "tag_map"}
                ,{module_name_suffix, ""}
                ,{module_name_prefix,""}
               ]}.



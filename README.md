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

%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.4.0

-ifndef(ger).
-define(ger, true).

-define(ger_gpb_version, "4.4.0").

-ifndef('CS_GER_PB_H').
-define('CS_GER_PB_H', true).
-record(cs_ger,
        {
        }).
-endif.

-ifndef('SC_GER_PB_H').
-define('SC_GER_PB_H', true).
-record(sc_ger,
        {gers = []              :: [ger:ger_dtl()] | undefined % = 1
        }).
-endif.

-ifndef('CS_GER_UPDATE_PB_H').
-define('CS_GER_UPDATE_PB_H', true).
-record(cs_ger_update,
        {gerID = 0              :: integer()        % = 1, 32 bits
        }).
-endif.

-ifndef('SC_GER_UPDATE_PB_H').
-define('SC_GER_UPDATE_PB_H', true).
-record(sc_ger_update,
        {result = 0             :: integer(),       % = 1, 32 bits
         ger = undefined        :: ger:ger_dtl()    % = 2
        }).
-endif.

-ifndef('GER_DTL_PB_H').
-define('GER_DTL_PB_H', true).
-record(ger_dtl,
        {id = 0                 :: integer(),       % = 1, 32 bits
         type = 0               :: integer(),       % = 2, 32 bits
         pos = 0                :: integer()        % = 3, 32 bits
        }).
-endif.

-endif.

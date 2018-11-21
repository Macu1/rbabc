%% -*- coding: utf-8 -*-
%% Automatically generated, do not edit
%% Generated by gpb_compile version 4.4.0
-module(role).

-export([encode_msg/1, encode_msg/2, encode_msg/3]).
-export([decode_msg/2, decode_msg/3]).
-export([merge_msgs/2, merge_msgs/3, merge_msgs/4]).
-export([verify_msg/1, verify_msg/2, verify_msg/3]).
-export([get_msg_defs/0]).
-export([get_msg_names/0]).
-export([get_group_names/0]).
-export([get_msg_or_group_names/0]).
-export([get_enum_names/0]).
-export([find_msg_def/1, fetch_msg_def/1]).
-export([find_enum_def/1, fetch_enum_def/1]).
-export([enum_symbol_by_value/2, enum_value_by_symbol/2]).
-export([enum_symbol_by_value_tag_map/1, enum_value_by_symbol_tag_map/1]).
-export(['enum_symbol_by_value_cs_role.person_enum'/1, 'enum_value_by_symbol_cs_role.person_enum'/1]).
-export([get_service_names/0]).
-export([get_service_def/1]).
-export([get_rpc_names/1]).
-export([find_rpc_def/2, fetch_rpc_def/2]).
-export([get_package_name/0]).
-export([gpb_version_as_string/0, gpb_version_as_list/0]).

-include("role.hrl").
-include("gpb.hrl").

%% enumerated types
-type 'tag_map'() :: 'cs_role' | 'sc_role'.
-type 'cs_role.person_enum'() :: 'val1' | 'val2'.
-export_type(['tag_map'/0, 'cs_role.person_enum'/0]).

%% message types
-type cs_role() :: #cs_role{}.

-type sc_role() :: #sc_role{}.

-type ger_dtl() :: #ger_dtl{}.

-export_type(['cs_role'/0, 'sc_role'/0, 'ger_dtl'/0]).

-spec encode_msg(#cs_role{} | #sc_role{} | #ger_dtl{}) -> binary().
encode_msg(Msg) when tuple_size(Msg) >= 1 ->
    encode_msg(Msg, element(1, Msg), []).

-spec encode_msg(#cs_role{} | #sc_role{} | #ger_dtl{}, atom() | list()) -> binary().
encode_msg(Msg, MsgName) when is_atom(MsgName) ->
    encode_msg(Msg, MsgName, []);
encode_msg(Msg, Opts)
    when tuple_size(Msg) >= 1, is_list(Opts) ->
    encode_msg(Msg, element(1, Msg), Opts).

-spec encode_msg(#cs_role{} | #sc_role{} | #ger_dtl{}, atom(), list()) -> binary().
encode_msg(Msg, MsgName, Opts) ->
    case proplists:get_bool(verify, Opts) of
      true -> verify_msg(Msg, MsgName, Opts);
      false -> ok
    end,
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      cs_role ->
	  encode_msg_cs_role(id(Msg, TrUserData), TrUserData);
      sc_role ->
	  encode_msg_sc_role(id(Msg, TrUserData), TrUserData);
      ger_dtl ->
	  encode_msg_ger_dtl(id(Msg, TrUserData), TrUserData)
    end.


encode_msg_cs_role(Msg, TrUserData) ->
    encode_msg_cs_role(Msg, <<>>, TrUserData).


encode_msg_cs_role(#cs_role{name = F1, id = F2,
			    type = F3},
		   Bin, TrUserData) ->
    B1 = begin
	   TrF1 = id(F1, TrUserData),
	   e_type_string(TrF1, <<Bin/binary, 10>>, TrUserData)
	 end,
    B2 = begin
	   TrF2 = id(F2, TrUserData),
	   e_type_int32(TrF2, <<B1/binary, 16>>, TrUserData)
	 end,
    begin
      TrF3 = id(F3, TrUserData),
      'e_enum_cs_role.person_enum'(TrF3, <<B2/binary, 24>>,
				   TrUserData)
    end.

encode_msg_sc_role(Msg, TrUserData) ->
    encode_msg_sc_role(Msg, <<>>, TrUserData).


encode_msg_sc_role(#sc_role{result = F1, gers = F2},
		   Bin, TrUserData) ->
    B1 = begin
	   TrF1 = id(F1, TrUserData),
	   e_type_int32(TrF1, <<Bin/binary, 8>>, TrUserData)
	 end,
    begin
      TrF2 = id(F2, TrUserData),
      if TrF2 == [] -> B1;
	 true -> e_field_sc_role_gers(TrF2, B1, TrUserData)
      end
    end.

encode_msg_ger_dtl(Msg, TrUserData) ->
    encode_msg_ger_dtl(Msg, <<>>, TrUserData).


encode_msg_ger_dtl(#ger_dtl{id = F1, type = F2,
			    pos = F3},
		   Bin, TrUserData) ->
    B1 = begin
	   TrF1 = id(F1, TrUserData),
	   e_type_int32(TrF1, <<Bin/binary, 8>>, TrUserData)
	 end,
    B2 = begin
	   TrF2 = id(F2, TrUserData),
	   e_type_int32(TrF2, <<B1/binary, 16>>, TrUserData)
	 end,
    begin
      TrF3 = id(F3, TrUserData),
      e_type_int32(TrF3, <<B2/binary, 24>>, TrUserData)
    end.

e_mfield_sc_role_gers(Msg, Bin, TrUserData) ->
    SubBin = encode_msg_ger_dtl(Msg, <<>>, TrUserData),
    Bin2 = e_varint(byte_size(SubBin), Bin),
    <<Bin2/binary, SubBin/binary>>.

e_field_sc_role_gers([Elem | Rest], Bin, TrUserData) ->
    Bin2 = <<Bin/binary, 18>>,
    Bin3 = e_mfield_sc_role_gers(id(Elem, TrUserData), Bin2,
				 TrUserData),
    e_field_sc_role_gers(Rest, Bin3, TrUserData);
e_field_sc_role_gers([], Bin, _TrUserData) -> Bin.

'e_enum_cs_role.person_enum'(val1, Bin, _TrUserData) ->
    <<Bin/binary, 233, 7>>;
'e_enum_cs_role.person_enum'(val2, Bin, _TrUserData) ->
    <<Bin/binary, 234, 7>>;
'e_enum_cs_role.person_enum'(V, Bin, _TrUserData) ->
    e_varint(V, Bin).

-compile({nowarn_unused_function,e_type_sint/3}).
e_type_sint(Value, Bin, _TrUserData) when Value >= 0 ->
    e_varint(Value * 2, Bin);
e_type_sint(Value, Bin, _TrUserData) ->
    e_varint(Value * -2 - 1, Bin).

-compile({nowarn_unused_function,e_type_int32/3}).
e_type_int32(Value, Bin, _TrUserData)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int32(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_int64/3}).
e_type_int64(Value, Bin, _TrUserData)
    when 0 =< Value, Value =< 127 ->
    <<Bin/binary, Value>>;
e_type_int64(Value, Bin, _TrUserData) ->
    <<N:64/unsigned-native>> = <<Value:64/signed-native>>,
    e_varint(N, Bin).

-compile({nowarn_unused_function,e_type_bool/3}).
e_type_bool(true, Bin, _TrUserData) ->
    <<Bin/binary, 1>>;
e_type_bool(false, Bin, _TrUserData) ->
    <<Bin/binary, 0>>;
e_type_bool(1, Bin, _TrUserData) -> <<Bin/binary, 1>>;
e_type_bool(0, Bin, _TrUserData) -> <<Bin/binary, 0>>.

-compile({nowarn_unused_function,e_type_string/3}).
e_type_string(S, Bin, _TrUserData) ->
    Utf8 = unicode:characters_to_binary(S),
    Bin2 = e_varint(byte_size(Utf8), Bin),
    <<Bin2/binary, Utf8/binary>>.

-compile({nowarn_unused_function,e_type_bytes/3}).
e_type_bytes(Bytes, Bin, _TrUserData)
    when is_binary(Bytes) ->
    Bin2 = e_varint(byte_size(Bytes), Bin),
    <<Bin2/binary, Bytes/binary>>;
e_type_bytes(Bytes, Bin, _TrUserData)
    when is_list(Bytes) ->
    BytesBin = iolist_to_binary(Bytes),
    Bin2 = e_varint(byte_size(BytesBin), Bin),
    <<Bin2/binary, BytesBin/binary>>.

-compile({nowarn_unused_function,e_type_fixed32/3}).
e_type_fixed32(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:32/little>>.

-compile({nowarn_unused_function,e_type_sfixed32/3}).
e_type_sfixed32(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:32/little-signed>>.

-compile({nowarn_unused_function,e_type_fixed64/3}).
e_type_fixed64(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:64/little>>.

-compile({nowarn_unused_function,e_type_sfixed64/3}).
e_type_sfixed64(Value, Bin, _TrUserData) ->
    <<Bin/binary, Value:64/little-signed>>.

-compile({nowarn_unused_function,e_type_float/3}).
e_type_float(V, Bin, _) when is_number(V) ->
    <<Bin/binary, V:32/little-float>>;
e_type_float(infinity, Bin, _) ->
    <<Bin/binary, 0:16, 128, 127>>;
e_type_float('-infinity', Bin, _) ->
    <<Bin/binary, 0:16, 128, 255>>;
e_type_float(nan, Bin, _) ->
    <<Bin/binary, 0:16, 192, 127>>.

-compile({nowarn_unused_function,e_type_double/3}).
e_type_double(V, Bin, _) when is_number(V) ->
    <<Bin/binary, V:64/little-float>>;
e_type_double(infinity, Bin, _) ->
    <<Bin/binary, 0:48, 240, 127>>;
e_type_double('-infinity', Bin, _) ->
    <<Bin/binary, 0:48, 240, 255>>;
e_type_double(nan, Bin, _) ->
    <<Bin/binary, 0:48, 248, 127>>.

-compile({nowarn_unused_function,e_varint/3}).
e_varint(N, Bin, _TrUserData) -> e_varint(N, Bin).

-compile({nowarn_unused_function,e_varint/2}).
e_varint(N, Bin) when N =< 127 -> <<Bin/binary, N>>;
e_varint(N, Bin) ->
    Bin2 = <<Bin/binary, (N band 127 bor 128)>>,
    e_varint(N bsr 7, Bin2).


decode_msg(Bin, MsgName) when is_binary(Bin) ->
    decode_msg(Bin, MsgName, []).

decode_msg(Bin, MsgName, Opts) when is_binary(Bin) ->
    TrUserData = proplists:get_value(user_data, Opts),
    decode_msg_1_catch(Bin, MsgName, TrUserData).

-ifdef('OTP_RELEASE').
decode_msg_1_catch(Bin, MsgName, TrUserData) ->
    try decode_msg_2_doit(MsgName, Bin, TrUserData)
    catch Class:Reason:StackTrace -> error({gpb_error,{decoding_failure, {Bin, MsgName, {Class, Reason, StackTrace}}}})
    end.
-else.
decode_msg_1_catch(Bin, MsgName, TrUserData) ->
    try decode_msg_2_doit(MsgName, Bin, TrUserData)
    catch Class:Reason ->
        StackTrace = erlang:get_stacktrace(),
        error({gpb_error,{decoding_failure, {Bin, MsgName, {Class, Reason, StackTrace}}}})
    end.
-endif.

decode_msg_2_doit(cs_role, Bin, TrUserData) ->
    id(decode_msg_cs_role(Bin, TrUserData), TrUserData);
decode_msg_2_doit(sc_role, Bin, TrUserData) ->
    id(decode_msg_sc_role(Bin, TrUserData), TrUserData);
decode_msg_2_doit(ger_dtl, Bin, TrUserData) ->
    id(decode_msg_ger_dtl(Bin, TrUserData), TrUserData).



decode_msg_cs_role(Bin, TrUserData) ->
    dfp_read_field_def_cs_role(Bin, 0, 0,
			       id(undefined, TrUserData),
			       id(undefined, TrUserData),
			       id(undefined, TrUserData), TrUserData).

dfp_read_field_def_cs_role(<<10, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_cs_role_name(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			 TrUserData);
dfp_read_field_def_cs_role(<<16, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_cs_role_id(Rest, Z1, Z2, F@_1, F@_2, F@_3,
		       TrUserData);
dfp_read_field_def_cs_role(<<24, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_cs_role_type(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			 TrUserData);
dfp_read_field_def_cs_role(<<>>, 0, 0, F@_1, F@_2, F@_3,
			   _) ->
    #cs_role{name = F@_1, id = F@_2, type = F@_3};
dfp_read_field_def_cs_role(Other, Z1, Z2, F@_1, F@_2,
			   F@_3, TrUserData) ->
    dg_read_field_def_cs_role(Other, Z1, Z2, F@_1, F@_2,
			      F@_3, TrUserData).

dg_read_field_def_cs_role(<<1:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, F@_3, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_cs_role(Rest, N + 7, X bsl N + Acc,
			      F@_1, F@_2, F@_3, TrUserData);
dg_read_field_def_cs_role(<<0:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, F@_3, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      10 ->
	  d_field_cs_role_name(Rest, 0, 0, F@_1, F@_2, F@_3,
			       TrUserData);
      16 ->
	  d_field_cs_role_id(Rest, 0, 0, F@_1, F@_2, F@_3,
			     TrUserData);
      24 ->
	  d_field_cs_role_type(Rest, 0, 0, F@_1, F@_2, F@_3,
			       TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_cs_role(Rest, 0, 0, F@_1, F@_2, F@_3,
				    TrUserData);
	    1 ->
		skip_64_cs_role(Rest, 0, 0, F@_1, F@_2, F@_3,
				TrUserData);
	    2 ->
		skip_length_delimited_cs_role(Rest, 0, 0, F@_1, F@_2,
					      F@_3, TrUserData);
	    3 ->
		skip_group_cs_role(Rest, Key bsr 3, 0, F@_1, F@_2, F@_3,
				   TrUserData);
	    5 ->
		skip_32_cs_role(Rest, 0, 0, F@_1, F@_2, F@_3,
				TrUserData)
	  end
    end;
dg_read_field_def_cs_role(<<>>, 0, 0, F@_1, F@_2, F@_3,
			  _) ->
    #cs_role{name = F@_1, id = F@_2, type = F@_3}.

d_field_cs_role_name(<<1:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_cs_role_name(Rest, N + 7, X bsl N + Acc, F@_1,
			 F@_2, F@_3, TrUserData);
d_field_cs_role_name(<<0:1, X:7, Rest/binary>>, N, Acc,
		     _, F@_2, F@_3, TrUserData) ->
    {NewFValue, RestF} = begin
			   Len = X bsl N + Acc,
			   <<Bytes:Len/binary, Rest2/binary>> = Rest,
			   {id(binary:copy(Bytes), TrUserData), Rest2}
			 end,
    dfp_read_field_def_cs_role(RestF, 0, 0, NewFValue, F@_2,
			       F@_3, TrUserData).

d_field_cs_role_id(<<1:1, X:7, Rest/binary>>, N, Acc,
		   F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_cs_role_id(Rest, N + 7, X bsl N + Acc, F@_1,
		       F@_2, F@_3, TrUserData);
d_field_cs_role_id(<<0:1, X:7, Rest/binary>>, N, Acc,
		   F@_1, _, F@_3, TrUserData) ->
    {NewFValue, RestF} = {begin
			    <<Res:32/signed-native>> = <<(X bsl N +
							    Acc):32/unsigned-native>>,
			    id(Res, TrUserData)
			  end,
			  Rest},
    dfp_read_field_def_cs_role(RestF, 0, 0, F@_1, NewFValue,
			       F@_3, TrUserData).

d_field_cs_role_type(<<1:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_cs_role_type(Rest, N + 7, X bsl N + Acc, F@_1,
			 F@_2, F@_3, TrUserData);
d_field_cs_role_type(<<0:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, F@_2, _, TrUserData) ->
    {NewFValue, RestF} =
	{id('d_enum_cs_role.person_enum'(begin
					   <<Res:32/signed-native>> = <<(X bsl N
									   +
									   Acc):32/unsigned-native>>,
					   id(Res, TrUserData)
					 end),
	    TrUserData),
	 Rest},
    dfp_read_field_def_cs_role(RestF, 0, 0, F@_1, F@_2,
			       NewFValue, TrUserData).

skip_varint_cs_role(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, F@_3, TrUserData) ->
    skip_varint_cs_role(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			TrUserData);
skip_varint_cs_role(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_cs_role(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_length_delimited_cs_role(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    skip_length_delimited_cs_role(Rest, N + 7,
				  X bsl N + Acc, F@_1, F@_2, F@_3, TrUserData);
skip_length_delimited_cs_role(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, F@_3, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_cs_role(Rest2, 0, 0, F@_1, F@_2,
			       F@_3, TrUserData).

skip_group_cs_role(Bin, FNum, Z2, F@_1, F@_2, F@_3,
		   TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_cs_role(Rest, 0, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_32_cs_role(<<_:32, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_cs_role(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_64_cs_role(<<_:64, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_cs_role(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

decode_msg_sc_role(Bin, TrUserData) ->
    dfp_read_field_def_sc_role(Bin, 0, 0,
			       id(undefined, TrUserData), id([], TrUserData),
			       TrUserData).

dfp_read_field_def_sc_role(<<8, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, TrUserData) ->
    d_field_sc_role_result(Rest, Z1, Z2, F@_1, F@_2,
			   TrUserData);
dfp_read_field_def_sc_role(<<18, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, TrUserData) ->
    d_field_sc_role_gers(Rest, Z1, Z2, F@_1, F@_2,
			 TrUserData);
dfp_read_field_def_sc_role(<<>>, 0, 0, F@_1, R1,
			   TrUserData) ->
    #sc_role{result = F@_1,
	     gers = lists_reverse(R1, TrUserData)};
dfp_read_field_def_sc_role(Other, Z1, Z2, F@_1, F@_2,
			   TrUserData) ->
    dg_read_field_def_sc_role(Other, Z1, Z2, F@_1, F@_2,
			      TrUserData).

dg_read_field_def_sc_role(<<1:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_sc_role(Rest, N + 7, X bsl N + Acc,
			      F@_1, F@_2, TrUserData);
dg_read_field_def_sc_role(<<0:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  d_field_sc_role_result(Rest, 0, 0, F@_1, F@_2,
				 TrUserData);
      18 ->
	  d_field_sc_role_gers(Rest, 0, 0, F@_1, F@_2,
			       TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_sc_role(Rest, 0, 0, F@_1, F@_2, TrUserData);
	    1 ->
		skip_64_sc_role(Rest, 0, 0, F@_1, F@_2, TrUserData);
	    2 ->
		skip_length_delimited_sc_role(Rest, 0, 0, F@_1, F@_2,
					      TrUserData);
	    3 ->
		skip_group_sc_role(Rest, Key bsr 3, 0, F@_1, F@_2,
				   TrUserData);
	    5 -> skip_32_sc_role(Rest, 0, 0, F@_1, F@_2, TrUserData)
	  end
    end;
dg_read_field_def_sc_role(<<>>, 0, 0, F@_1, R1,
			  TrUserData) ->
    #sc_role{result = F@_1,
	     gers = lists_reverse(R1, TrUserData)}.

d_field_sc_role_result(<<1:1, X:7, Rest/binary>>, N,
		       Acc, F@_1, F@_2, TrUserData)
    when N < 57 ->
    d_field_sc_role_result(Rest, N + 7, X bsl N + Acc, F@_1,
			   F@_2, TrUserData);
d_field_sc_role_result(<<0:1, X:7, Rest/binary>>, N,
		       Acc, _, F@_2, TrUserData) ->
    {NewFValue, RestF} = {begin
			    <<Res:32/signed-native>> = <<(X bsl N +
							    Acc):32/unsigned-native>>,
			    id(Res, TrUserData)
			  end,
			  Rest},
    dfp_read_field_def_sc_role(RestF, 0, 0, NewFValue, F@_2,
			       TrUserData).

d_field_sc_role_gers(<<1:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, F@_2, TrUserData)
    when N < 57 ->
    d_field_sc_role_gers(Rest, N + 7, X bsl N + Acc, F@_1,
			 F@_2, TrUserData);
d_field_sc_role_gers(<<0:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, Prev, TrUserData) ->
    {NewFValue, RestF} = begin
			   Len = X bsl N + Acc,
			   <<Bs:Len/binary, Rest2/binary>> = Rest,
			   {id(decode_msg_ger_dtl(Bs, TrUserData), TrUserData),
			    Rest2}
			 end,
    dfp_read_field_def_sc_role(RestF, 0, 0, F@_1,
			       cons(NewFValue, Prev, TrUserData), TrUserData).

skip_varint_sc_role(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, TrUserData) ->
    skip_varint_sc_role(Rest, Z1, Z2, F@_1, F@_2,
			TrUserData);
skip_varint_sc_role(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, TrUserData) ->
    dfp_read_field_def_sc_role(Rest, Z1, Z2, F@_1, F@_2,
			       TrUserData).

skip_length_delimited_sc_role(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, TrUserData)
    when N < 57 ->
    skip_length_delimited_sc_role(Rest, N + 7,
				  X bsl N + Acc, F@_1, F@_2, TrUserData);
skip_length_delimited_sc_role(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_sc_role(Rest2, 0, 0, F@_1, F@_2,
			       TrUserData).

skip_group_sc_role(Bin, FNum, Z2, F@_1, F@_2,
		   TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_sc_role(Rest, 0, Z2, F@_1, F@_2,
			       TrUserData).

skip_32_sc_role(<<_:32, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, TrUserData) ->
    dfp_read_field_def_sc_role(Rest, Z1, Z2, F@_1, F@_2,
			       TrUserData).

skip_64_sc_role(<<_:64, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, TrUserData) ->
    dfp_read_field_def_sc_role(Rest, Z1, Z2, F@_1, F@_2,
			       TrUserData).

decode_msg_ger_dtl(Bin, TrUserData) ->
    dfp_read_field_def_ger_dtl(Bin, 0, 0,
			       id(undefined, TrUserData),
			       id(undefined, TrUserData),
			       id(undefined, TrUserData), TrUserData).

dfp_read_field_def_ger_dtl(<<8, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_ger_dtl_id(Rest, Z1, Z2, F@_1, F@_2, F@_3,
		       TrUserData);
dfp_read_field_def_ger_dtl(<<16, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_ger_dtl_type(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			 TrUserData);
dfp_read_field_def_ger_dtl(<<24, Rest/binary>>, Z1, Z2,
			   F@_1, F@_2, F@_3, TrUserData) ->
    d_field_ger_dtl_pos(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			TrUserData);
dfp_read_field_def_ger_dtl(<<>>, 0, 0, F@_1, F@_2, F@_3,
			   _) ->
    #ger_dtl{id = F@_1, type = F@_2, pos = F@_3};
dfp_read_field_def_ger_dtl(Other, Z1, Z2, F@_1, F@_2,
			   F@_3, TrUserData) ->
    dg_read_field_def_ger_dtl(Other, Z1, Z2, F@_1, F@_2,
			      F@_3, TrUserData).

dg_read_field_def_ger_dtl(<<1:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, F@_3, TrUserData)
    when N < 32 - 7 ->
    dg_read_field_def_ger_dtl(Rest, N + 7, X bsl N + Acc,
			      F@_1, F@_2, F@_3, TrUserData);
dg_read_field_def_ger_dtl(<<0:1, X:7, Rest/binary>>, N,
			  Acc, F@_1, F@_2, F@_3, TrUserData) ->
    Key = X bsl N + Acc,
    case Key of
      8 ->
	  d_field_ger_dtl_id(Rest, 0, 0, F@_1, F@_2, F@_3,
			     TrUserData);
      16 ->
	  d_field_ger_dtl_type(Rest, 0, 0, F@_1, F@_2, F@_3,
			       TrUserData);
      24 ->
	  d_field_ger_dtl_pos(Rest, 0, 0, F@_1, F@_2, F@_3,
			      TrUserData);
      _ ->
	  case Key band 7 of
	    0 ->
		skip_varint_ger_dtl(Rest, 0, 0, F@_1, F@_2, F@_3,
				    TrUserData);
	    1 ->
		skip_64_ger_dtl(Rest, 0, 0, F@_1, F@_2, F@_3,
				TrUserData);
	    2 ->
		skip_length_delimited_ger_dtl(Rest, 0, 0, F@_1, F@_2,
					      F@_3, TrUserData);
	    3 ->
		skip_group_ger_dtl(Rest, Key bsr 3, 0, F@_1, F@_2, F@_3,
				   TrUserData);
	    5 ->
		skip_32_ger_dtl(Rest, 0, 0, F@_1, F@_2, F@_3,
				TrUserData)
	  end
    end;
dg_read_field_def_ger_dtl(<<>>, 0, 0, F@_1, F@_2, F@_3,
			  _) ->
    #ger_dtl{id = F@_1, type = F@_2, pos = F@_3}.

d_field_ger_dtl_id(<<1:1, X:7, Rest/binary>>, N, Acc,
		   F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_ger_dtl_id(Rest, N + 7, X bsl N + Acc, F@_1,
		       F@_2, F@_3, TrUserData);
d_field_ger_dtl_id(<<0:1, X:7, Rest/binary>>, N, Acc, _,
		   F@_2, F@_3, TrUserData) ->
    {NewFValue, RestF} = {begin
			    <<Res:32/signed-native>> = <<(X bsl N +
							    Acc):32/unsigned-native>>,
			    id(Res, TrUserData)
			  end,
			  Rest},
    dfp_read_field_def_ger_dtl(RestF, 0, 0, NewFValue, F@_2,
			       F@_3, TrUserData).

d_field_ger_dtl_type(<<1:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_ger_dtl_type(Rest, N + 7, X bsl N + Acc, F@_1,
			 F@_2, F@_3, TrUserData);
d_field_ger_dtl_type(<<0:1, X:7, Rest/binary>>, N, Acc,
		     F@_1, _, F@_3, TrUserData) ->
    {NewFValue, RestF} = {begin
			    <<Res:32/signed-native>> = <<(X bsl N +
							    Acc):32/unsigned-native>>,
			    id(Res, TrUserData)
			  end,
			  Rest},
    dfp_read_field_def_ger_dtl(RestF, 0, 0, F@_1, NewFValue,
			       F@_3, TrUserData).

d_field_ger_dtl_pos(<<1:1, X:7, Rest/binary>>, N, Acc,
		    F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    d_field_ger_dtl_pos(Rest, N + 7, X bsl N + Acc, F@_1,
			F@_2, F@_3, TrUserData);
d_field_ger_dtl_pos(<<0:1, X:7, Rest/binary>>, N, Acc,
		    F@_1, F@_2, _, TrUserData) ->
    {NewFValue, RestF} = {begin
			    <<Res:32/signed-native>> = <<(X bsl N +
							    Acc):32/unsigned-native>>,
			    id(Res, TrUserData)
			  end,
			  Rest},
    dfp_read_field_def_ger_dtl(RestF, 0, 0, F@_1, F@_2,
			       NewFValue, TrUserData).

skip_varint_ger_dtl(<<1:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, F@_3, TrUserData) ->
    skip_varint_ger_dtl(Rest, Z1, Z2, F@_1, F@_2, F@_3,
			TrUserData);
skip_varint_ger_dtl(<<0:1, _:7, Rest/binary>>, Z1, Z2,
		    F@_1, F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_ger_dtl(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_length_delimited_ger_dtl(<<1:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, F@_3, TrUserData)
    when N < 57 ->
    skip_length_delimited_ger_dtl(Rest, N + 7,
				  X bsl N + Acc, F@_1, F@_2, F@_3, TrUserData);
skip_length_delimited_ger_dtl(<<0:1, X:7, Rest/binary>>,
			      N, Acc, F@_1, F@_2, F@_3, TrUserData) ->
    Length = X bsl N + Acc,
    <<_:Length/binary, Rest2/binary>> = Rest,
    dfp_read_field_def_ger_dtl(Rest2, 0, 0, F@_1, F@_2,
			       F@_3, TrUserData).

skip_group_ger_dtl(Bin, FNum, Z2, F@_1, F@_2, F@_3,
		   TrUserData) ->
    {_, Rest} = read_group(Bin, FNum),
    dfp_read_field_def_ger_dtl(Rest, 0, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_32_ger_dtl(<<_:32, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_ger_dtl(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

skip_64_ger_dtl(<<_:64, Rest/binary>>, Z1, Z2, F@_1,
		F@_2, F@_3, TrUserData) ->
    dfp_read_field_def_ger_dtl(Rest, Z1, Z2, F@_1, F@_2,
			       F@_3, TrUserData).

'd_enum_cs_role.person_enum'(1001) -> val1;
'd_enum_cs_role.person_enum'(1002) -> val2;
'd_enum_cs_role.person_enum'(V) -> V.

read_group(Bin, FieldNum) ->
    {NumBytes, EndTagLen} = read_gr_b(Bin, 0, 0, 0, 0, FieldNum),
    <<Group:NumBytes/binary, _:EndTagLen/binary, Rest/binary>> = Bin,
    {Group, Rest}.

%% Like skipping over fields, but record the total length,
%% Each field is <(FieldNum bsl 3) bor FieldType> ++ <FieldValue>
%% Record the length because varints may be non-optimally encoded.
%%
%% Groups can be nested, but assume the same FieldNum cannot be nested
%% because group field numbers are shared with the rest of the fields
%% numbers. Thus we can search just for an group-end with the same
%% field number.
%%
%% (The only time the same group field number could occur would
%% be in a nested sub message, but then it would be inside a
%% length-delimited entry, which we skip-read by length.)
read_gr_b(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen, FieldNum)
  when N < (32-7) ->
    read_gr_b(Tl, N+7, X bsl N + Acc, NumBytes, TagLen+1, FieldNum);
read_gr_b(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, TagLen,
          FieldNum) ->
    Key = X bsl N + Acc,
    TagLen1 = TagLen + 1,
    case {Key bsr 3, Key band 7} of
        {FieldNum, 4} -> % 4 = group_end
            {NumBytes, TagLen1};
        {_, 0} -> % 0 = varint
            read_gr_vi(Tl, 0, NumBytes + TagLen1, FieldNum);
        {_, 1} -> % 1 = bits64
            <<_:64, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 8, 0, FieldNum);
        {_, 2} -> % 2 = length_delimited
            read_gr_ld(Tl, 0, 0, NumBytes + TagLen1, FieldNum);
        {_, 3} -> % 3 = group_start
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 4} -> % 4 = group_end
            read_gr_b(Tl, 0, 0, NumBytes + TagLen1, 0, FieldNum);
        {_, 5} -> % 5 = bits32
            <<_:32, Tl2/binary>> = Tl,
            read_gr_b(Tl2, 0, 0, NumBytes + TagLen1 + 4, 0, FieldNum)
    end.

read_gr_vi(<<1:1, _:7, Tl/binary>>, N, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_vi(Tl, N+7, NumBytes+1, FieldNum);
read_gr_vi(<<0:1, _:7, Tl/binary>>, _, NumBytes, FieldNum) ->
    read_gr_b(Tl, 0, 0, NumBytes+1, 0, FieldNum).

read_gr_ld(<<1:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum)
  when N < (64-7) ->
    read_gr_ld(Tl, N+7, X bsl N + Acc, NumBytes+1, FieldNum);
read_gr_ld(<<0:1, X:7, Tl/binary>>, N, Acc, NumBytes, FieldNum) ->
    Len = X bsl N + Acc,
    NumBytes1 = NumBytes + 1,
    <<_:Len/binary, Tl2/binary>> = Tl,
    read_gr_b(Tl2, 0, 0, NumBytes1 + Len, 0, FieldNum).

merge_msgs(Prev, New)
    when element(1, Prev) =:= element(1, New) ->
    merge_msgs(Prev, New, element(1, Prev), []).

merge_msgs(Prev, New, MsgName) when is_atom(MsgName) ->
    merge_msgs(Prev, New, MsgName, []);
merge_msgs(Prev, New, Opts)
    when element(1, Prev) =:= element(1, New),
	 is_list(Opts) ->
    merge_msgs(Prev, New, element(1, Prev), Opts).

merge_msgs(Prev, New, MsgName, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      cs_role -> merge_msg_cs_role(Prev, New, TrUserData);
      sc_role -> merge_msg_sc_role(Prev, New, TrUserData);
      ger_dtl -> merge_msg_ger_dtl(Prev, New, TrUserData)
    end.

-compile({nowarn_unused_function,merge_msg_cs_role/3}).
merge_msg_cs_role(#cs_role{},
		  #cs_role{name = NFname, id = NFid, type = NFtype}, _) ->
    #cs_role{name = NFname, id = NFid, type = NFtype}.

-compile({nowarn_unused_function,merge_msg_sc_role/3}).
merge_msg_sc_role(#sc_role{gers = PFgers},
		  #sc_role{result = NFresult, gers = NFgers},
		  TrUserData) ->
    #sc_role{result = NFresult,
	     gers =
		 if PFgers /= undefined, NFgers /= undefined ->
			'erlang_++'(PFgers, NFgers, TrUserData);
		    PFgers == undefined -> NFgers;
		    NFgers == undefined -> PFgers
		 end}.

-compile({nowarn_unused_function,merge_msg_ger_dtl/3}).
merge_msg_ger_dtl(#ger_dtl{},
		  #ger_dtl{id = NFid, type = NFtype, pos = NFpos}, _) ->
    #ger_dtl{id = NFid, type = NFtype, pos = NFpos}.


verify_msg(Msg) when tuple_size(Msg) >= 1 ->
    verify_msg(Msg, element(1, Msg), []);
verify_msg(X) ->
    mk_type_error(not_a_known_message, X, []).

verify_msg(Msg, MsgName) when is_atom(MsgName) ->
    verify_msg(Msg, MsgName, []);
verify_msg(Msg, Opts) when tuple_size(Msg) >= 1 ->
    verify_msg(Msg, element(1, Msg), Opts);
verify_msg(X, _Opts) ->
    mk_type_error(not_a_known_message, X, []).

verify_msg(Msg, MsgName, Opts) ->
    TrUserData = proplists:get_value(user_data, Opts),
    case MsgName of
      cs_role -> v_msg_cs_role(Msg, [MsgName], TrUserData);
      sc_role -> v_msg_sc_role(Msg, [MsgName], TrUserData);
      ger_dtl -> v_msg_ger_dtl(Msg, [MsgName], TrUserData);
      _ -> mk_type_error(not_a_known_message, Msg, [])
    end.


-compile({nowarn_unused_function,v_msg_cs_role/3}).
-dialyzer({nowarn_function,v_msg_cs_role/3}).
v_msg_cs_role(#cs_role{name = F1, id = F2, type = F3},
	      Path, TrUserData) ->
    v_type_string(F1, [name | Path], TrUserData),
    v_type_int32(F2, [id | Path], TrUserData),
    'v_enum_cs_role.person_enum'(F3, [type | Path],
				 TrUserData),
    ok;
v_msg_cs_role(X, Path, _TrUserData) ->
    mk_type_error({expected_msg, cs_role}, X, Path).

-compile({nowarn_unused_function,v_msg_sc_role/3}).
-dialyzer({nowarn_function,v_msg_sc_role/3}).
v_msg_sc_role(#sc_role{result = F1, gers = F2}, Path,
	      TrUserData) ->
    v_type_int32(F1, [result | Path], TrUserData),
    if is_list(F2) ->
	   _ = [v_msg_ger_dtl(Elem, [gers | Path], TrUserData)
		|| Elem <- F2],
	   ok;
       true ->
	   mk_type_error({invalid_list_of, {msg, ger_dtl}}, F2,
			 [gers | Path])
    end,
    ok;
v_msg_sc_role(X, Path, _TrUserData) ->
    mk_type_error({expected_msg, sc_role}, X, Path).

-compile({nowarn_unused_function,v_msg_ger_dtl/3}).
-dialyzer({nowarn_function,v_msg_ger_dtl/3}).
v_msg_ger_dtl(#ger_dtl{id = F1, type = F2, pos = F3},
	      Path, TrUserData) ->
    v_type_int32(F1, [id | Path], TrUserData),
    v_type_int32(F2, [type | Path], TrUserData),
    v_type_int32(F3, [pos | Path], TrUserData),
    ok;
v_msg_ger_dtl(X, Path, _TrUserData) ->
    mk_type_error({expected_msg, ger_dtl}, X, Path).

-compile({nowarn_unused_function,'v_enum_cs_role.person_enum'/3}).
-dialyzer({nowarn_function,'v_enum_cs_role.person_enum'/3}).
'v_enum_cs_role.person_enum'(val1, _Path,
			     _TrUserData) ->
    ok;
'v_enum_cs_role.person_enum'(val2, _Path,
			     _TrUserData) ->
    ok;
'v_enum_cs_role.person_enum'(V, Path, TrUserData)
    when is_integer(V) ->
    v_type_sint32(V, Path, TrUserData);
'v_enum_cs_role.person_enum'(X, Path, _TrUserData) ->
    mk_type_error({invalid_enum, 'cs_role.person_enum'}, X,
		  Path).

-compile({nowarn_unused_function,v_type_sint32/3}).
-dialyzer({nowarn_function,v_type_sint32/3}).
v_type_sint32(N, _Path, _TrUserData)
    when -2147483648 =< N, N =< 2147483647 ->
    ok;
v_type_sint32(N, Path, _TrUserData)
    when is_integer(N) ->
    mk_type_error({value_out_of_range, sint32, signed, 32},
		  N, Path);
v_type_sint32(X, Path, _TrUserData) ->
    mk_type_error({bad_integer, sint32, signed, 32}, X,
		  Path).

-compile({nowarn_unused_function,v_type_int32/3}).
-dialyzer({nowarn_function,v_type_int32/3}).
v_type_int32(N, _Path, _TrUserData)
    when -2147483648 =< N, N =< 2147483647 ->
    ok;
v_type_int32(N, Path, _TrUserData) when is_integer(N) ->
    mk_type_error({value_out_of_range, int32, signed, 32},
		  N, Path);
v_type_int32(X, Path, _TrUserData) ->
    mk_type_error({bad_integer, int32, signed, 32}, X,
		  Path).

-compile({nowarn_unused_function,v_type_string/3}).
-dialyzer({nowarn_function,v_type_string/3}).
v_type_string(S, Path, _TrUserData)
    when is_list(S); is_binary(S) ->
    try unicode:characters_to_binary(S) of
      B when is_binary(B) -> ok;
      {error, _, _} ->
	  mk_type_error(bad_unicode_string, S, Path)
    catch
      error:badarg ->
	  mk_type_error(bad_unicode_string, S, Path)
    end;
v_type_string(X, Path, _TrUserData) ->
    mk_type_error(bad_unicode_string, X, Path).

-compile({nowarn_unused_function,mk_type_error/3}).
-spec mk_type_error(_, _, list()) -> no_return().
mk_type_error(Error, ValueSeen, Path) ->
    Path2 = prettify_path(Path),
    erlang:error({gpb_type_error,
		  {Error, [{value, ValueSeen}, {path, Path2}]}}).


-compile({nowarn_unused_function,prettify_path/1}).
-dialyzer({nowarn_function,prettify_path/1}).
prettify_path([]) -> top_level;
prettify_path(PathR) ->
    list_to_atom(lists:append(lists:join(".",
					 lists:map(fun atom_to_list/1,
						   lists:reverse(PathR))))).


-compile({nowarn_unused_function,id/2}).
-compile({inline,id/2}).
id(X, _TrUserData) -> X.

-compile({nowarn_unused_function,v_ok/3}).
-compile({inline,v_ok/3}).
v_ok(_Value, _Path, _TrUserData) -> ok.

-compile({nowarn_unused_function,m_overwrite/3}).
-compile({inline,m_overwrite/3}).
m_overwrite(_Prev, New, _TrUserData) -> New.

-compile({nowarn_unused_function,cons/3}).
-compile({inline,cons/3}).
cons(Elem, Acc, _TrUserData) -> [Elem | Acc].

-compile({nowarn_unused_function,lists_reverse/2}).
-compile({inline,lists_reverse/2}).
'lists_reverse'(L, _TrUserData) -> lists:reverse(L).
-compile({nowarn_unused_function,'erlang_++'/3}).
-compile({inline,'erlang_++'/3}).
'erlang_++'(A, B, _TrUserData) -> A ++ B.

get_msg_defs() ->
    [{{enum, tag_map}, [{cs_role, 1}, {sc_role, 2}]},
     {{enum, 'cs_role.person_enum'},
      [{val1, 1001}, {val2, 1002}]},
     {{msg, cs_role},
      [#field{name = name, fnum = 1, rnum = 2, type = string,
	      occurrence = required, opts = []},
       #field{name = id, fnum = 2, rnum = 3, type = int32,
	      occurrence = required, opts = []},
       #field{name = type, fnum = 3, rnum = 4,
	      type = {enum, 'cs_role.person_enum'},
	      occurrence = required, opts = []}]},
     {{msg, sc_role},
      [#field{name = result, fnum = 1, rnum = 2, type = int32,
	      occurrence = required, opts = []},
       #field{name = gers, fnum = 2, rnum = 3,
	      type = {msg, ger_dtl}, occurrence = repeated,
	      opts = []}]},
     {{msg, ger_dtl},
      [#field{name = id, fnum = 1, rnum = 2, type = int32,
	      occurrence = required, opts = []},
       #field{name = type, fnum = 2, rnum = 3, type = int32,
	      occurrence = required, opts = []},
       #field{name = pos, fnum = 3, rnum = 4, type = int32,
	      occurrence = required, opts = []}]}].


get_msg_names() -> [cs_role, sc_role, ger_dtl].


get_group_names() -> [].


get_msg_or_group_names() -> [cs_role, sc_role, ger_dtl].


get_enum_names() -> [tag_map, 'cs_role.person_enum'].


fetch_msg_def(MsgName) ->
    case find_msg_def(MsgName) of
      Fs when is_list(Fs) -> Fs;
      error -> erlang:error({no_such_msg, MsgName})
    end.


fetch_enum_def(EnumName) ->
    case find_enum_def(EnumName) of
      Es when is_list(Es) -> Es;
      error -> erlang:error({no_such_enum, EnumName})
    end.


find_msg_def(cs_role) ->
    [#field{name = name, fnum = 1, rnum = 2, type = string,
	    occurrence = required, opts = []},
     #field{name = id, fnum = 2, rnum = 3, type = int32,
	    occurrence = required, opts = []},
     #field{name = type, fnum = 3, rnum = 4,
	    type = {enum, 'cs_role.person_enum'},
	    occurrence = required, opts = []}];
find_msg_def(sc_role) ->
    [#field{name = result, fnum = 1, rnum = 2, type = int32,
	    occurrence = required, opts = []},
     #field{name = gers, fnum = 2, rnum = 3,
	    type = {msg, ger_dtl}, occurrence = repeated,
	    opts = []}];
find_msg_def(ger_dtl) ->
    [#field{name = id, fnum = 1, rnum = 2, type = int32,
	    occurrence = required, opts = []},
     #field{name = type, fnum = 2, rnum = 3, type = int32,
	    occurrence = required, opts = []},
     #field{name = pos, fnum = 3, rnum = 4, type = int32,
	    occurrence = required, opts = []}];
find_msg_def(_) -> error.


find_enum_def(tag_map) -> [{cs_role, 1}, {sc_role, 2}];
find_enum_def('cs_role.person_enum') ->
    [{val1, 1001}, {val2, 1002}];
find_enum_def(_) -> error.


enum_symbol_by_value(tag_map, Value) ->
    enum_symbol_by_value_tag_map(Value);
enum_symbol_by_value('cs_role.person_enum', Value) ->
    'enum_symbol_by_value_cs_role.person_enum'(Value).


enum_value_by_symbol(tag_map, Sym) ->
    enum_value_by_symbol_tag_map(Sym);
enum_value_by_symbol('cs_role.person_enum', Sym) ->
    'enum_value_by_symbol_cs_role.person_enum'(Sym).


enum_symbol_by_value_tag_map(1) -> cs_role;
enum_symbol_by_value_tag_map(2) -> sc_role.


enum_value_by_symbol_tag_map(cs_role) -> 1;
enum_value_by_symbol_tag_map(sc_role) -> 2.

'enum_symbol_by_value_cs_role.person_enum'(1001) ->
    val1;
'enum_symbol_by_value_cs_role.person_enum'(1002) ->
    val2.


'enum_value_by_symbol_cs_role.person_enum'(val1) ->
    1001;
'enum_value_by_symbol_cs_role.person_enum'(val2) ->
    1002.


get_service_names() -> [].


get_service_def(_) -> error.


get_rpc_names(_) -> error.


find_rpc_def(_, _) -> error.



-spec fetch_rpc_def(_, _) -> no_return().
fetch_rpc_def(ServiceName, RpcName) ->
    erlang:error({no_such_rpc, ServiceName, RpcName}).


get_package_name() -> msg.



gpb_version_as_string() ->
    "4.4.0".

gpb_version_as_list() ->
    [4,4,0].

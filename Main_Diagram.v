// Copyright (C) 2023  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and any partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details, at
// https://fpgasoftware.intel.com/eula.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 22.1std.1 Build 917 02/14/2023 SC Lite Edition"
// CREATED		"Thu Jun  6 22:46:21 2024"

module Main_Diagram(
	AlarmSwitch,
	ResetBtn,
	IncMinBtn,
	IncHourBtn,
	Clock,
	UserHr,
	UserMin,
	SoundOut,
	Seg0,
	Seg1,
	Seg2,
	Seg3
);


input wire	AlarmSwitch;
input wire	ResetBtn;
input wire	IncMinBtn;
input wire	IncHourBtn;
input wire	Clock;
input wire	[7:0] UserHr;
input wire	[7:0] UserMin;
output wire	SoundOut;
output wire	[6:0] Seg0;
output wire	[6:0] Seg1;
output wire	[6:0] Seg2;
output wire	[6:0] Seg3;

wire	Alarm;
wire	[7:0] AlarmHr;
wire	[7:0] AlarmMin;
wire	Clk;
wire	EN;
wire	Freq1;
wire	Freq2;
wire	[7:0] Hours;
wire	IncHour;
wire	IncMin;
wire	[25:0] MHz;
wire	[7:0] Minutes;
wire	OneDay;
wire	OneHr;
wire	OneMin;
wire	OneSec;
wire	Reset;
wire	[7:0] Seconds;
wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	[3:0] SYNTHESIZED_WIRE_5;
wire	[3:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[3:0] SYNTHESIZED_WIRE_10;
wire	SYNTHESIZED_WIRE_11;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	SYNTHESIZED_WIRE_16;




assign	Reset =  ~ResetBtn;

assign	IncMin =  ~IncMinBtn;


counter	b2v_inst10(
	.clk(OneSec),
	.reset(SYNTHESIZED_WIRE_0),
	.q(Seconds));
	defparam	b2v_inst10.N = 8;

assign	SYNTHESIZED_WIRE_0 = Reset | OneMin;


comparator	b2v_inst13(
	.a(Seconds),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_1));
	defparam	b2v_inst13.b = 10;
	defparam	b2v_inst13.N = 8;


sync	b2v_inst14(
	.clk(Clk),
	.d(SYNTHESIZED_WIRE_1),
	.q(OneMin));


counter	b2v_inst15(
	.clk(SYNTHESIZED_WIRE_2),
	.reset(SYNTHESIZED_WIRE_3),
	.q(Minutes));
	defparam	b2v_inst15.N = 8;

assign	SYNTHESIZED_WIRE_3 = Reset | OneHr;

assign	SYNTHESIZED_WIRE_2 = IncMin | OneMin;


comparator	b2v_inst18(
	.a(Minutes),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst18.b = 10;
	defparam	b2v_inst18.N = 8;


sync	b2v_inst19(
	.clk(Clk),
	.d(SYNTHESIZED_WIRE_4),
	.q(OneHr));

assign	IncHour =  ~IncHourBtn;


parser	b2v_inst20(
	.num(Minutes),
	.ones(SYNTHESIZED_WIRE_5),
	.tens(SYNTHESIZED_WIRE_6));
	defparam	b2v_inst20.N = 8;


sevenseg	b2v_inst21(
	.data(SYNTHESIZED_WIRE_5),
	.segments(Seg0));


sevenseg	b2v_inst22(
	.data(SYNTHESIZED_WIRE_6),
	.segments(Seg1));


counter	b2v_inst23(
	.clk(SYNTHESIZED_WIRE_7),
	.reset(SYNTHESIZED_WIRE_8),
	.q(Hours));
	defparam	b2v_inst23.N = 8;

assign	SYNTHESIZED_WIRE_8 = Reset | OneDay;

assign	SYNTHESIZED_WIRE_7 = IncHour | OneHr;


comparator	b2v_inst26(
	.a(Hours),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_9));
	defparam	b2v_inst26.b = 24;
	defparam	b2v_inst26.N = 8;


sync	b2v_inst27(
	.clk(Clk),
	.d(SYNTHESIZED_WIRE_9),
	.q(OneDay));


parser	b2v_inst28(
	.num(Hours),
	.ones(SYNTHESIZED_WIRE_10),
	.tens(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst28.N = 8;


sevenseg	b2v_inst29(
	.data(SYNTHESIZED_WIRE_10),
	.segments(Seg2));


counter	b2v_inst3(
	.clk(Clk),
	.reset(SYNTHESIZED_WIRE_11),
	.q(MHz));
	defparam	b2v_inst3.N = 26;


sevenseg	b2v_inst30(
	.data(SYNTHESIZED_WIRE_12),
	.segments(Seg3));


comparator_2	b2v_inst32(
	.a(Minutes),
	.b(AlarmMin),
	.eq(SYNTHESIZED_WIRE_13)
	
	
	
	
	);
	defparam	b2v_inst32.N = 8;


comparator_2	b2v_inst33(
	.a(Hours),
	.b(AlarmHr),
	.eq(SYNTHESIZED_WIRE_14)
	
	
	
	
	);
	defparam	b2v_inst33.N = 8;

assign	SYNTHESIZED_WIRE_15 = SYNTHESIZED_WIRE_13 & SYNTHESIZED_WIRE_14;

assign	EN = Alarm & SYNTHESIZED_WIRE_15;


frequency	b2v_inst36(
	.count(MHz),
	.freq(Freq1));
	defparam	b2v_inst36.BITS = 26;
	defparam	b2v_inst36.DIVISOR = 3;


frequency	b2v_inst37(
	.count(MHz),
	.freq(Freq2));
	defparam	b2v_inst37.BITS = 26;
	defparam	b2v_inst37.DIVISOR = 5;


freq_mux	b2v_inst38(
	.alarm(EN),
	.freq1(Freq1),
	.freq2(Freq2),
	.seconds(Seconds),
	.freq(SoundOut));

assign	SYNTHESIZED_WIRE_11 = Reset | OneSec;


n_bit_reg	b2v_inst6(
	.clk(Clk),
	.reset(Reset),
	.d(UserMin),
	.q(AlarmMin));
	defparam	b2v_inst6.N = 8;


n_bit_reg	b2v_inst7(
	.clk(Clk),
	.reset(Reset),
	.d(UserHr),
	.q(AlarmHr));
	defparam	b2v_inst7.N = 8;


comparator	b2v_inst8(
	.a(MHz),
	
	
	
	
	
	.gte(SYNTHESIZED_WIRE_16));
	defparam	b2v_inst8.b = 20;
	defparam	b2v_inst8.N = 26;


sync	b2v_inst9(
	.clk(Clk),
	.d(SYNTHESIZED_WIRE_16),
	.q(OneSec));

assign	Alarm = AlarmSwitch;
assign	Clk = Clock;

endmodule

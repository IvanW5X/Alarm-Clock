module frequency #(parameter BITS = 26,
						 parameter DIVISOR = 100000)
						(input logic [BITS-1:0] count,
						 output logic freq);

	assign freq = (count % DIVISOR == 0) ? 1 : 0;
endmodule
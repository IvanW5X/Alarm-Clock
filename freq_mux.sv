module freq_mux(input logic [7:0] seconds,
					 input logic alarm,
					 input logic freq1,
					 input logic freq2,
					 output logic freq);

	always_comb begin
		if (alarm) begin
			if (seconds[0] == 1'b0)
				freq = freq1;
			else
				freq = freq2;
		end
		else
			freq = 0;
	end
endmodule
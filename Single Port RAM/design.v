//64-bit X 8-bit single port RAM

module single_port_ram(
  input clk, we,    //write_enable
  input [5:0] addr,
  input [7:0] data,

  output[7:0] val //read_value from RAM
);
  
  reg [7:0] ram[63:0];
  reg [5:0] addr_reg;

  always @(posedge clk) begin
    if(we)
      ram[addr] <= data;
    else 
      addr_reg <= addr;
  end
  
  assign val = ram[addr_reg];
  
endmodule

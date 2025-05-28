//64-bit X 8-bit Dual port RAM

module dual_port_ram(
  input clk, we_a, we_b,   //write_enable for port a & b
  input [5:0] addr_a, addr_b,
  input [7:0] data_a, data_b,

  output reg [7:0] val_a, val_b //read_value from RAM using port a & b resp.
);
  
  reg [7:0] ram[63:0];

  always @(posedge clk) begin
    if(we_a)
      ram[addr_a] <= data_a;
    else 
      val_a <= ram[addr_a];
  end
    
  always @(posedge clk) begin
    if(we_b)
      ram[addr_b] <= data_b;
    else 
      val_b <= ram[addr_b];
  end
  
endmodule

module ROM(
  input clk, en, // enables reading process
  input [2:0] addr,

  output reg [3:0] val,
);
  
  reg [3:0] rom[7:0]; //4-bit data & 8 locations

  always @(posedge clk) begin
    if(en)
      val <= rom[addr];
    else
      val <= 4'bxxxx;
  end
  
  initial begin
    rom[0] = 4'd10;
    rom[1] = 4'd11;
    rom[2] = 4'd12;
    rom[3] = 4'd13;
    rom[4] = 4'd14;
    rom[5] = 4'd15;
    rom[6] = 4'd16;
    rom[7] = 4'd8;
  end
  
endmodule

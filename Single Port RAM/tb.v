module single_port_ram_tb;
  reg clk,we;
  reg [5:0] addr;
  reg [7:0] data;
  wire [7:0] val;
  
  single_port_ram ram1(clk,we,addr,data,val);
  
  initial begin
   clk = 1; we = 1; 
       addr = 6'd3; data=8'd43;
   #9  addr = 6'd4; data=8'd44;
   #10 addr = 6'd19; data=8'd45;
   #10 we = 0; addr = 6'd4;
   #10 addr = 6'd19;
   #10 we = 1 ; addr = 6'd3; data = 8'd62;
   #10 we = 0 ; addr = 6'd3;  
    #20 $finish();
  end
    
  initial begin
    $dumpvars(1);
    $dumpfile("dump.vcd");
  end
  
  always #5 clk <= ~clk;  

endmodule

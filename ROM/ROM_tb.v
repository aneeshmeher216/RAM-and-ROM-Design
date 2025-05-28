module ROM_tb;
  reg clk,en;
  reg [2:0] addr;
  wire [3:0] val;
  
  ROM ram1(clk, en, addr, val);
  
  initial begin
   clk = 1; en=1; addr=3'd5;
    # 9 addr= 3'd3;
    #10 addr= 3'd7;
    #10 en= 0; addr= 3'd4;

   #20 $finish();
  end
    
  initial begin
    $dumpvars(1);
    $dumpfile("dump.vcd");
  end
  
  always #5 clk <= ~clk;  

endmodule

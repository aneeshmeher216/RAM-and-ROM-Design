module dual_port_ram_tb;
  reg clk,we_a,we_b;
  reg [5:0] addr_a, addr_b;
  reg [7:0] data_a, data_b;
  wire [7:0] val_a, val_b;
  
  dual_port_ram ram1(clk, we_a, we_b, addr_a, addr_b, 
                       data_a, data_b, val_a, val_b);
  
  initial begin
   clk = 1; we_a = 1; we_b = 1; 
       addr_a = 6'd3; data_a = 8'd43;
	   addr_b = 6'd22; data_b = 8'd150;

   #9  addr_a = 6'd4; data_a = 8'd44; 
       addr_b = 6'd23; data_b = 8'd151;

   #10 we_a = 0; addr_a = 6'd23;
       we_b = 0; addr_b = 6'd3;

   #10 we_a = 1; addr_a = 6'd23; data_a = 8'd49;
       
   #10 we_b = 0; addr_b = 6'd23;
   
   #20 $finish();
  end
    
  initial begin
    $dumpvars(1);
    $dumpfile("dump.vcd");
  end
  
  always #5 clk <= ~clk;  

endmodule

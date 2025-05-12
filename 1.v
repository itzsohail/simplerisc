module instruction(reset,branchPC,inst,isbranchTaken,pc,clk);
input wire [31:0] branchPC;
input wire isbranchTaken;
output reg [31:0] inst;
input clk;
output pc;
reg [31:0] pc;
reg [31:0] instructionmemory [0:255];
input wire reset;


always@(posedge clk,reset)
begin
if (reset)
pc=0;
inst<= instructionmemory [pc>>2];
pc<=(isbranchTaken)?branchPC:pc+4;
end
endmodule

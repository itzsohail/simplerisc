module fetch(pc,inst,immx,branchTarget,clk);
input clk;
input wire [31:0] inst;
input wire [31:0] pc;
output reg [31:0]immx;
output reg [31:0] branchTarget;
wire [31:0]target;
assign target = {{5{inst[26]}}, inst[26:0]};
always @(*)
begin
branchTarget<=pc+target;
if (inst[17:16]==2'b10)
immx<={inst[15:0],16'h0000};
else 
immx<={16'h0000,inst[15:0]};
end
endmodule




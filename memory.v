module memoryaccess(clk,isLd,isSt,op2,aluResult,ldResult);
input clk;
input wire isLd,isSt ;
input wire [31:0]op2;
input wire [31:0]aluResult;
output reg [31:0]ldResult;
reg [31:0] datamemory [0:255];
always @(clk)
begin
if(isLd)
ldResult<=datamemory [aluResult];
 if(isSt)
datamemory [aluResult]<=op2;
end
endmodule

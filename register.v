module writeback(clk,isLd,isCall,pc,ldResult,aluResult,isWb,isRet,isSt,inst,op1,op2);
input wire isLd,isCall,isWb;
input wire [31:0] pc,ldResult,aluResult;

reg [31:0]registerfile[0:15];
reg [31:0] result;
input clk;
input wire isRet,isSt;
input wire [31:0] inst;

output reg [31:0] op1;
output reg [31:0] op2;
reg [31:0] register_file[0:15];


always@(*)
begin 
if (isRet)
op1=register_file[15];
else 
op1=register_file[inst[21:18]];
if(isSt)
op2=register_file[inst[25:22]];
else
op2=register_file[inst[17:14]];
end
always@(posedge clk)
begin
if(isWb)
begin
if(isLd==0 && isCall==0)
  result=aluResult;
else if(isLd==1 && isCall==0)
result=ldResult;
else if(isLd==0 && isCall==1)
result=pc+4;

if(isCall)
registerfile[15]=result;
else
registerfile[inst[25:22]]=result;
end
end

endmodule

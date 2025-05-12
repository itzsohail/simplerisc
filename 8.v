module control(inst, isRet,isSt,isWb,isImmediate,aluSignals,isBeq,isBgt,isUBranch,isLd,isCall);
input wire [31:0] inst;
output reg isRet,isSt,isWb,isImmediate,isBeq,isBgt,isUBranch,isLd,isCall;
output reg [4:0] aluSignals;
wire[4:0] opcode;
assign opcode= inst[31:27];
always@(*)
begin
isImmediate=inst[26];
aluSignals=inst[31:27];
isRet=(opcode==5'b10100)?1'b1:1'b0;
isBeq=(opcode==5'b10000)?1'b1:1'b0;
isBgt=(opcode==5'b10001)?1'b1:1'b0;
isUBranch=(opcode==5'b10010)?1'b1:1'b0;
isCall=(opcode==5'b10011)?1'b1:1'b0;
isLd=(opcode==5'b01110)?1'b1:1'b0;
case(opcode)
5'b00000:isWb=1'b1;
5'b00001:isWb=1'b1;
5'b00010:isWb=1'b1;
5'b00011:isWb=1'b1;
5'b00100:isWb=1'b1;
//5'b00101:isWb=1'b0;
5'b00110:isWb=1'b1;
5'b00111:isWb=1'b1;
5'b01000:isWb=1'b1;
5'b01001:isWb=1'b1;
5'b01010:isWb=1'b1;
5'b01011:isWb=1'b1;
5'b01100:isWb=1'b1;
5'b01111:isWb=1'b1;
default:isWb=1'b0;
endcase
end
endmodule;
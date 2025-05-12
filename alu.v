module aludesign(clk,aluSignals,op1,op2,immx,isImmediate,aluResult);
output reg [31:0] aluResult;
input clk;
input wire [31:0] op1;
input wire [31:0] op2;
input wire [31:0] immx;
input wire [4:0] aluSignals ;
input wire isImmediate;
reg flags_E,flags_GT;
wire [31:0] A;
wire [31:0] B;
assign A=op1;
assign B = (isImmediate) ? immx : op2;
always@(*)
begin
case (aluSignals)
5'b00000:aluResult=A+B;
5'b00001:aluResult=A-B;
//5'b00010:c=
//5'b00011:
5'b00100:aluResult=A%B;
5'b00101:
begin
if(A>B)
flags_GT=1'b1;
else 
flags_GT=1'b0;
if(A==B)
flags_E=1'b1;
else 
flags_E=1'b0;
end

5'b00110: aluResult=A&B;
5'b00111:aluResult=A|B;
5'b01000:aluResult=(~B);
5'b01001:aluResult=B;
5'b01010:aluResult=A<<B;
5'b01011:aluResult=A>>B;
5'b01100:aluResult=A>>>B;
//5'b01101:
5'b01110:aluResult=A+B;
5'b01111:aluResult=A+B;
//5'b10000:
//5'b10001:
/*5'b10010:
5'b10011:
5'b10100:*/
default:aluResult=aluResult;
endcase
end
 flags g1(1'b1,flag_E,flag_GT,flag_E,flag_GT);
endmodule

module flags(save,flage,flaggt,flag_E,flag_GT);
input wire flage,flaggt;
reg flag[0:1];
input wire save;
 output wire flag_E,flag_GT;
assign flag_E=flag[0];
assign flag_GT=flag[1];
always@(*)
if(save)
begin
flag[0]=flage;
flag[1]=flaggt;
end
endmodule

   













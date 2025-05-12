module branchunit(isRet,branchPC,isBeq,isBgt,isUBranch,isBranchTaken,branchTarget,op1);
output reg [31:0] branchPC;

input wire isRet,isUBranch,isBeq,isBgt;
input wire [31:0] branchTarget,op1;
//take value from of
wire flags_E ,flags_GT;
 flags g2(1'b0,1'b0,1'b0,flag_E,flag_GT);
output reg isBranchTaken;
always@(*)
begin
isBranchTaken=isBeq&flags_E || isUBranch || isBgt&flags_GT;
if(isRet)
branchPC=op1;
else 
branchPC=branchTarget;
end
endmodule
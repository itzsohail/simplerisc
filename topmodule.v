module top_module(clk,reset);
 input clk;
 wire [31:0] branchPC;
wire isbranchTaken;
wire [31:0] inst;
wire [31:0] pc;
input wire reset;
  wire [31:0]ldResult;
  wire [31:0] aluResult;
  wire  [31:0]immx;
  
wire [31:0] op1;
wire [31:0] op2;
 instruction  pointer (reset,branchPC,inst,isbranchTaken,pc,clk);
 wire isRet,isSt,isWb,isImmediate,isBeq,isBgt,isUBranch,isLd,isCall;
 wire [4:0] aluSignals;
 control CONTROL(inst, isRet,isSt,isWb,isImmediate,aluSignals,isBeq,isBgt,isUBranch,isLd,isCall);


writeback WRITEBACKandREGISTERFILE(clk,isLd,isCall,pc,ldResult,aluResult,isWb,isRet,isSt,inst,op1,op2);
 
 
wire [31:0] branchTarget; // branchPC;
 fetch Fetch(pc,inst,immx,branchTarget ,clk);
 

  aludesign  ALUdesign(clk,aluSignals,op1,op2,immx,isImmediate,aluResult);
  
   branchunit  BRANCHUNIT (isRet,branchPC,isBeq,isBgt,isUBranch,isbranchTaken,branchTarget,op1);
   
  
  memoryaccess MEMORYACCESS(isLd,isSt,op2,aluResult,ldResult);
  
endmodule

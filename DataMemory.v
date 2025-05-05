module DataMemory(clock,DataMemoryout,registerdata3,y,adaWB,adzWB,adcWB,awcWB,acaWB,aczWB,accWB,acwWB,nduWB,ndcWB,ndzWB,ncuWB,nccWB,nczWB,
adaRF,adzRF,adcRF,awcRF,acaRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,carryWB,carryWB2,carryRF,zeroWB,zeroWB2,zeroRF);
input clock;
output reg[15:0]DataMemoryout;
wire cry;
wire beq,blt,ble;
output reg[15:0]y;
wire[15:0]data1;
wire[15:0]data2;
wire [15:0]result;
reg [15:0]data_mem[1023:0];
output reg [15:0]registerdata3;
wire [15:0]registerdata1;
wire[15:0]registerdata2;
wire [15:0]x;
wire[2:0]RA,RB,RC;
wire[5:0]IMM1;
wire[8:0]IMM2;
wire[5:0]IMM1A;
wire[8:0]IMM2A;
wire [15:0]SEIMM1A;
wire[15:0]Instruction_A;
wire[15:0]Instruction;
wire[15:0]Instruction_RR;
wire[15:0]Instruction_MEM;
wire[15:0]Instruction_WB;
wire[15:0]Instruction_ST;
wire[15:0]Instruction_ST2;
wire[15:0]Instruction_ST3;
wire[15:0]Instruction_ST4;
wire[15:0]Instruction_ST5;
wire[15:0]Instruction_ST6;
wire[2:0]RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3;
	output reg carryWB;
	output reg adaWB;
	output reg adzWB;
   output reg adcWB;
	output reg awcWB;
	output reg acaWB;
	output reg aczWB;
	output reg accWB;
	output reg acwWB;
   output reg nduWB;
	output reg ndcWB;
	output reg ndzWB;
	output reg ncuWB;
	output reg nccWB;
	output reg nczWB;
	output reg adaRF;
	output reg adzRF;
	output reg adcRF;
	output reg awcRF;
	output reg acaRF;
	output reg aczRF;
	output reg accRF;
	output reg acwRF;
	output reg nduRF;
	output reg ndcRF;
	output reg ndzRF;
	output reg ncuRF;
	output reg nccRF;
	output reg nczRF;
	output reg carryWB2;
	output reg carryRF;
	output reg zeroRF;
	output reg zeroWB;
	output reg zeroWB2;
	wire ada;
	wire adz;
	wire adc;
	wire awc;
	wire aca;
	wire acz;
	wire acc;
	wire acw;
	wire ndu;
	wire ndc;
	wire ndz;
	wire ncu;
	wire ncc;
	wire ncz;
wire[15:0]Instruction_D;
wire[15:0]PC_D;
wire[15:0]PC_RF;
wire[15:0]PC_AL;
wire[15:0]PC_DM;
wire[15:0]PC;
wire [15:0]a;
wire[15:0]b;
wire[15:0]t;
wire[15:0]reg0;
integer i;
reg[15:0]g=0;
ALU A1(clock,result,cry,zero,ada,adz,adc,awc,aca,acz,acc,acw,ndu,ndc,ndz,ncu,ncc,ncz,SEIMM1A,a,b,adaRF,adzRF,adcRF,awcRF,acaRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,adaWB,
adzWB,adcWB,awcWB,acaWB,aczWB,accWB,acwWB,nduWB,ndcWB,ndzWB,ncuWB,nccWB,nczWB,carryRF,carryWB,carryWB2,zeroRF,zeroWB,zeroWB2,DataMemoryout,data1,data2,registerdata3);   
Decoder D1(clock,RA,RB,RC,IMM1,IMM2,andD,nandD,t,beq,blt,ble,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3);
Fetch F1(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
 

initial
begin
for(i=0;i<1023;i=i+1)
begin
    data_mem[i]=g;
	 g=g+1;

 end
 end
 always@(posedge clock) 
 begin
  if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else if((Instruction_ST5[15]==0)&&(Instruction_ST5[14]==1)&&(Instruction_ST5[13]==1)&&(Instruction_ST5[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
  if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_ST5[15]==0)&&(Instruction_ST5[14]==1)&&(Instruction_ST5[13]==1)&&(Instruction_ST5[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
 else if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==0)&&(Instruction_A[12]==0))//LW
 begin
 DataMemoryout=data_mem[result];
 registerdata3=data_mem[result];
 if(DataMemoryout==0)
 begin
 zeroRF<=0;
 end
 else
 begin
zeroRF<=zero;
end
 end
 else if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==0)&&(Instruction_A[12]==1))//SW
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
else if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==1)&&(Instruction_A[12]==0))//LM
 begin
DataMemoryout<=data_mem[result];
 registerdata3<=data_mem[result];
 zeroRF<=zero;
 end
else if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==0)&&(Instruction_A[12]==1))//SM
 begin
 data_mem[result]<=a;
 y<=a;
 zeroRF<=zero;
 end
 else
 begin
 DataMemoryout<=result;
 registerdata3<=result;
 zeroRF<=zero;
 end
 carryRF<=cry;
 carryWB<=carryRF;
 carryWB2<=carryWB;
 
 //zeroRF<=zero;
 zeroWB<=zeroRF;
 zeroWB2<=zeroWB;
 
 adaRF<=ada;
 adzRF<=adz;
 adcRF<=adc;
 awcRF<=awc;
 acaRF<=aca;
 aczRF<=acz;
 accRF<=acc;
 acwRF<=acw;
 nduRF<= ndu;
ndcRF<= ndc;
ndzRF<= ndz;
ncuRF<=ncu;
nccRF<= ncc;
nczRF<= ncz;

adaWB<=adaRF;
 adzWB<=adzRF;
 adcWB<=adcRF;
 awcWB<=awcRF;
 acaWB<=acaRF;
 aczWB<=aczRF;
 accWB<=accRF;
 acwWB<=acwRF;
 nduWB<= nduRF;
ndcWB<= ndcRF;
ndzWB<= ndzRF;
ncuWB<=ncuRF;
nccWB<= nccRF;
nczWB<= nczRF;
 end
 
 
endmodule
 
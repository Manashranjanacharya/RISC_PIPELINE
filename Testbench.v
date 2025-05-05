module Decodertest;
reg clock;
wire [2:0]RA;
wire [2:0]RB;
wire [2:0]RC;
wire [5:0]IMM1;
wire [8:0]IMM2;
wire [15:0]Instruction_D;
wire [15:0]Instruction;
wire [15:0]PC_D;
wire [15:0]registerdata3; 
wire[15:0]registerdata1; 
wire[15:0]registerdata2; 
wire[15:0]result;
wire[15:0]DataMemoryout;
wire [15:0]Instruction_A;
wire [15:0]Instruction_RR;
wire [15:0]Instruction_MEM;
wire [15:0]Instruction_WB;
wire [15:0]Instruction_ST;
wire [15:0]Instruction_ST2;
wire [15:0]Instruction_ST3;
wire [15:0]Instruction_ST4;
wire [15:0]Instruction_ST5;
wire [15:0]Instruction_ST6;
wire[15:0]PC;
wire[15:0]x;
wire [15:0] data1,data2;
wire carryRF;
wire zeroRF;
wire cry;
wire zero;
wire ada;
wire adz;
wire adc;
wire awc;
wire aca;
wire acz;
wire acc;
wire acw;
wire adaRF;
wire adzRF;
wire adcRF;
wire awcRF;
wire acaRF;
wire aczRF;
wire accRF;
wire acwRF;
wire ndu;
wire ndc;
wire ndz;
wire ncu;
wire ncc;
wire ncz;
wire nduRF;
wire ndcRF;
wire ndzRF;
wire ncuRF;
wire nccRF;
wire nczRF;
wire andALU;
wire nandALU;
wire[5:0]IMM1A;
wire[15:0]SEIMM1A;
wire[8:0]IMM2A;
wire[15:0]y;
wire[15:0]a;
wire[15:0]b;
wire[15:0]PC_RF;
wire[15:0]PC_AL;
wire[15:0]PC_DM;
wire[15:0]jlr;
wire[15:0]t;
wire[15:0]reg0;
wire[2:0]RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3;
	wire [15:0]registerdata1s1;
	wire [15:0]registerdata1s2;
	wire [15:0]registerdata1s3;
	wire [15:0]registerdata1s4;
	wire [15:0]registerdata1s5;
	wire [15:0]registerdata1s6;
	wire [15:0]registerdata1s7;

wire[8:0]IMM3A;
wire[8:0]IMM4A;
wire[8:0]IMM5A;
wire[8:0]IMM6A;
wire[8:0]IMM7A;
wire[8:0]IMM8A;
wire[8:0]IMM9A;
wire[8:0]IMM10A;
wire[8:0]IMM11A;
wire[15:0]SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8;

Fetch F1(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
 
 DataMemory M1(clock,DataMemoryout,registerdata3,y,adaWB,adzWB,adcWB,awcWB,acaWB,aczWB,accWB,acwWB,nduWB,ndcWB,ndzWB,ncuWB,nccWB,nczWB,
adaRF,adzRF,adcRF,awcRF,acaRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,carryWB,carryWB2,carryRF,zeroWB,zeroWB2,zeroRF);
ALU A1(clock,result,cry,zero,ada,adz,adc,awc,aca,acz,acc,acw,ndu,ndc,ndz,ncu,ncc,ncz,SEIMM1A,a,b,adaRF,adzRF,adcRF,awcRF,acaRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,adaWB,
adzWB,adcWB,awcWB,acaWB,aczWB,accWB,acwWB,nduWB,ndcWB,ndzWB,ncuWB,nccWB,nczWB,carryRF,carryWB,carryWB2,zeroRF,zeroWB,zeroWB2,DataMemoryout,data1,data2,registerdata3);     
Registerfile R1(clock,registerdata1,registerdata2,registerdata3,x,carryRF,zeroRF,acaRF,adaRF,adzRF,adcRF,awcRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,andALU,nandALU,IMM1A,IMM2A,beq,blt,ble,t,reg0,IMM3A,IMM4A,IMM5A,IMM6A,IMM7A,IMM8A,IMM9A,IMM10A,IMM11A,registerdata1s1,registerdata1s2,registerdata1s3,registerdata1s4,registerdata1s5,registerdata1s6,registerdata1s7,carryWB,SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8);

 Decoder D1(clock,RA,RB,RC,IMM1,IMM2,andD,nandD,t,beq,blt,ble,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3);



initial begin  
           clock = 0;  
           forever #10 clock = ~clock;  
      end  
endmodule
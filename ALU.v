module ALU(clock,result,cry,zero,ada,adz,adc,awc,aca,acz,acc,acw,ndu,ndc,ndz,ncu,ncc,ncz,SEIMM1A,a,b,adaRF,adzRF,adcRF,awcRF,acaRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,adaWB,
adzWB,adcWB,awcWB,acaWB,aczWB,accWB,acwWB,nduWB,ndcWB,ndzWB,ncuWB,nccWB,nczWB,carryRF,carryWB,carryWB2,zeroRF,zeroWB,zeroWB2,DataMemoryout,data1,data2,registerdata3);   
input clock;   
	output reg [15:0] a;          
  output reg [15:0] b; 
	output reg ada;
	output reg adz;
	output reg adc;
	output reg awc;
	output reg aca;
	output reg acz;
	output reg acc;
	output reg acw;
	output reg ndu;
	output reg ndc;
	output reg ndz;
	output reg ncu;
	output reg ncc;
	output reg ncz;
	output reg zero;
	output reg cry;
	wire[15:0]SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8;
	input carryWB;
	input adaWB;
	input adzWB;
   input adcWB;
	input awcWB;
	input acaWB;
	input aczWB;
	input accWB;
	input acwWB;
   input nduWB;
	input ndcWB;
	input ndzWB;
	input ncuWB;
	input nccWB;
	input nczWB;
	input adaRF;
	input adzRF;
	input adcRF;
	input awcRF;
	input acaRF;
	input aczRF;
	input accRF;
	input acwRF;
	input nduRF;
	input ndcRF;
	input ndzRF;
	input ncuRF;
	input nccRF;
	input nczRF;
	input carryWB2;
	input carryRF;
	input zeroRF;
	input zeroWB;
	input zeroWB2;
	output reg[15:0]data2;
	output reg[15:0]data1;
	input[15:0]DataMemoryout;
	wire[15:0]x;
wire[15:0]Instruction;
wire[15:0]Instruction_D;
wire[15:0]Instruction_A;
wire[15:0]PC_D;
wire[15:0]Instruction_RR;
wire[15:0]Instruction_MEM;
wire[15:0]Instruction_WB;	
  //Instructions
	output reg [15:0] result;
	//output reg load_en;
	wire [15:0]registerdata1;
	wire [15:0]registerdata1s1;
	wire [15:0]registerdata1s2;
	wire [15:0]registerdata1s3;
	wire [15:0]registerdata1s4;
	wire [15:0]registerdata1s5;
	wire [15:0]registerdata1s6;
	wire [15:0]registerdata1s7;
	
	wire [15:0]registerdata2;
	input[15:0]registerdata3;
	wire [5:0]IMM1A;
	wire [8:0]IMM2A;

	wire [15:0]Imm6mult2;
	wire [15:0]Imm6;
	wire[15:0]Imm9;
	wire[2:0]RA,RB,RC;
	wire [5:0]IMM1;
   wire [8:0]IMM2;
	
	wire[15:0]PC_RF;
	wire[15:0]PC_AL;
	wire[15:0]PC_DM;
	wire[15:0]Instruction_ST;
	wire[15:0]Instruction_ST2;
	wire[15:0]Instruction_ST3;
	wire[15:0]Instruction_ST4;
	wire[15:0]Instruction_ST5;
	wire[15:0]Instruction_ST6;


	wire [15:0]PC;
	wire andD;
	wire nandD;
	wire [15:0]t;
	output reg [15:0]SEIMM1A;
	wire beq;
	wire blt;
	wire ble;
	wire[15:0]reg0;
wire[8:0]IMM3A;
wire[8:0]IMM4A;
wire[8:0]IMM5A;
wire[8:0]IMM6A;
wire[8:0]IMM7A;
wire[8:0]IMM8A;
wire[8:0]IMM9A;
wire[8:0]IMM10A;
wire[8:0]IMM11A;
wire[2:0]RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3;
Fetch F1(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
Registerfile R1(clock,registerdata1,registerdata2,registerdata3,x,carryRF,zeroRF,acaRF,adaRF,adzRF,adcRF,awcRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,andALU,nandALU,IMM1A,IMM2A,beq,blt,ble,t,reg0,IMM3A,IMM4A,IMM5A,IMM6A,IMM7A,IMM8A,IMM9A,IMM10A,IMM11A,registerdata1s1,registerdata1s2,registerdata1s3,registerdata1s4,registerdata1s5,registerdata1s6,registerdata1s7,carryWB,SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8);

Decoder D1(clock,RA,RB,RC,IMM1,IMM2,andD,nandD,t,beq,blt,ble,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3);



always@(*) 
begin

if((Instruction_A[5:3]==Instruction_RR[8:6])&&(Instruction_A[5:3]==Instruction_RR[11:9]))//AA
begin
if(((adc)||(acc)||(ndc)||(ncc))&&(carryRF))
begin
data1= result;
 data2=result;
end
 else if(((adz)||(acz)||(ndz)||(ncz))&&(zeroRF))
 begin
 data1=result;
 data2=result;
 end
 else if((ada)||(aca)||(acw)||(awc)||(ncu)||(ndu))
 begin
 data1=result;
 data2=result;
 end
 end
 
 else if((Instruction_MEM[5:3]==Instruction_RR[8:6])&&(Instruction_A[5:3]==Instruction_RR[11:9])) 
 begin ///////a on ALU, b on MEM	if((adc||acc||ndc||ncc)&&(ndcRF||adcRF||accRF||nccRF)&&carryRF&&carryWB) begin //CC		data1=result;

	if((adz||acz||ndz||ncz)&&(ndcRF||adcRF||accRF||nccRF)&&(zeroRF)&&(carryWB)) begin //ZC
     data1=result;
		data2=DataMemoryout;
		end
	else if((adz||acz||ndz||ncz)&&(ndzRF||adzRF||aczRF||nczRF)&&(zeroRF)&&(zeroWB)) begin //ZZ
		data1=result;
		data2=DataMemoryout;
	
	end
	else if((adc||acc||ndc||ncc)&&(ndzRF||adzRF||aczRF||nczRF)&&(carryRF)&&(zeroWB)) begin //CZ
		data1=result;
		data2=DataMemoryout;
		
	end
	else if((adc||acc||ndc||ncc)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(carryRF)) begin //C
		data1=result;
		data2=DataMemoryout;

	end
	else if((adz||acz||ndz||ncz)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(zeroRF)) begin //Z
		data1=result;
		data2=DataMemoryout;

	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndcRF||adcRF||accRF||nccRF)&&(carryWB)) begin //  C
		data1=result;
		data2=DataMemoryout;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndzRF||adzRF||aczRF||nczRF)&&(zeroWB)) begin //  Z
		data1=result;
		data2=DataMemoryout;
	
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)) begin // 
		data1=result;
		data2=DataMemoryout;
		
	end

 end
 
 else if((Instruction_A[5:3]==Instruction_RR[8:6])&&(Instruction_MEM[5:3]==Instruction_RR[11:9])) begin ///////a on MEM, b on ALU
	if((adc||acc||ndc||ncc)&&(ndcRF||adcRF||accRF||nccRF)&&(carryRF)&&(carryWB)) begin //CC
		data1=DataMemoryout;
		data2=result;
   
	end
	else if((adz||acz||ndz||ncz)&&(ndcRF||adcRF||accRF||nccRF)&&(zeroRF)&&(carryWB)) begin //CZ
		data1=DataMemoryout;
		data2=result;

	end
	else if((adz||acz||ndz||ncz)&&(ndzRF||adzRF||aczRF||nczRF)&&(zeroRF)&&(zeroWB)) begin //ZZ
		data1=DataMemoryout;
		data2=result;
		
	end
	else if((adc||acc||ndc||ncc)&&(ndzRF||adzRF||aczRF||nczRF)&&(carryRF)&&(zeroWB)) begin //ZC
		data1=DataMemoryout;
		data2=result;
	
	end
	else if((adc||acc||ndc||ncc)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(carryRF)) begin //  C
		data1=DataMemoryout;
		data2=result;

	end
	else if((adz||acz||ndz||ncz)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(zeroRF))begin //  Z
		data1=DataMemoryout;
		data2=result;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndcRF||adcRF||accRF||nccRF)&&(carryWB)) begin //C
		data1=DataMemoryout;
		data2=result;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndzRF||adzRF||aczRF||nczRF)&&(zeroWB)) begin //Z
		data1=DataMemoryout;
		data2=result;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)) begin // 
		data1=DataMemoryout;
		data2=result;
	
	end

 end
 
 else if((Instruction_A[5:3]==Instruction_RR[8:6])&&(Instruction_WB[5:3]==Instruction_RR[11:9])) begin ///////a on WB, b on ALU
	if((adc||acc||ndc||ncc)&&(ndcWB||adcWB||accWB||nccWB)&&(carryRF)&&(carryWB2)) begin //CC
		data1=x;
		data2=result;
		
	end
	else if((adz||acz||ndz||ncz)&&(ndcWB||adcWB||accWB||nccWB)&&(zeroRF)&&(carryWB2)) begin //CZ
		data1=x;
		data2=result;
	
	end
	else if((adz||acz||ndz||ncz)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroRF)&&(zeroWB2)) begin //ZZ
		data1=x;
		data2=result;
	
	end
	else if((adc||acc||ndc||ncc)&&(ndzWB||adzWB||aczWB||nczWB)&&(carryRF)&&(zeroWB2)) begin //ZC
		data1=x;
		data2=result;
	
	end
	else if((adc||acc||ndc||ncc)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(carryRF)) begin //  C
		data1=x;
		data2=result;
	
	end
	else if((adz||acz||ndz||ncz)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(zeroRF)) begin //  Z
		data1=x;
		data2=result;
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB2)) begin //C
		data1=x;
		data2=result;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB2)) begin //Z
		data1=x;
		data2=result;
		
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)) begin // 
		data1=x;
		data2=result;
		
	end

 end
 
 else if((Instruction_WB[5:3]==Instruction_RR[8:6])&&(Instruction_A[5:3]==Instruction_RR[11:9])) begin ///////a on ALU, b on WB
	if((adc||acc||ndc||ncc)&&(ndcWB||adcWB||accWB||nccWB)&&(carryRF)&&(carryWB2)) begin //CC
		data2=x;
		data1=result;
	
	end
	else if((adz||acz||ndz||ncz)&&(ndcWB||adcWB||accWB||nccWB)&&(zeroRF)&&(carryWB2)) begin //ZC
		data2=x;
		data1=result;
		
	end
	else if((adz||acz||ndz||ncz)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroRF)&&(zeroWB2)) begin //ZZ
		data1=result;
		data2=x;

	end
	else if((adc||acc||ndc||ncc)&&(ndzWB||adzWB||aczWB||nczWB)&&(carryRF)&&(zeroWB2)) begin //CZ
		data1=result;
		data2=x;
		
	end
	else if((adc||acc||ndc||ncc)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(carryRF)) begin //C
		data1=result;
		data2=x;
	
	end
	else if((adz||acz||ndz||ncz)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(zeroRF)) begin //Z
		data1=result;
		data2=x;
	
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB2)) begin //  C
		data1=result;
		data2=x;
	
	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB2)) begin //  Z
		data1=result;
		data2=x;

	end
	else if((ada||awc||acw||aca||ncu||ndu)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)) begin // 
		data1=result;
		data2=x;
	
	end

 end
 
 else if((Instruction_MEM[5:3]==Instruction_RR[8:6])&&(Instruction_WB[5:3]==Instruction_RR[11:9])) begin ///////a on WB, b on MEM
	if((adcRF||accRF||ndcRF||nccRF)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB)&&(carryWB2)) begin //CC
		data1=x;
		data2=DataMemoryout;
		
	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(ndcWB||adcWB||accWB||nccWB)&&(zeroWB)&&(carryWB2)) begin //CZ
		data1=x;
		data2=DataMemoryout;
	
	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB)&&(zeroWB2)) begin //ZZ
		data1=x;
		data2=DataMemoryout;
	
	end
	else if((adcRF||accRF||ndcRF||nccRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(carryWB)&&(zeroWB2)) begin //ZC
		data1=x;
		data2=DataMemoryout;

	end
	else if((adcRF||accRF||ndcRF||nccRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(carryWB)) begin //  C
		data1=x;
		data2=DataMemoryout;

	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(zeroWB)) begin //  Z
		data1=x;
		data2=DataMemoryout;
	
	end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB2)) begin //C
		data1=x;
		data2=DataMemoryout;

	end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB2)) begin //Z
		data1=x;
		data2=DataMemoryout;
		
	end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)) begin // 
		data1=x;
		data2=DataMemoryout;
		
	end

 end
 
 else if((Instruction_WB[5:3]==Instruction_RR[8:6])&&(Instruction_MEM[5:3]==Instruction_RR[11:9]))//M,WB
begin
if((adcRF||accRF||ndcRF||nccRF)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB)&&(carryWB2)) begin //CC
		data1=DataMemoryout;
		data2=x;
	
	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(ndcWB||adcWB||accWB||nccWB)&&(zeroWB)&&(carryWB2)) begin //CZ
		data1=DataMemoryout;
		data2=x;
		
	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB)&&(zeroWB2)) begin //ZZ
		data1=DataMemoryout;
		data2=x;

	end
	else if((adcRF||accRF||ndcRF||nccRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(carryWB)&&(zeroWB2)) begin //ZC
		data1=DataMemoryout;
		data2=x;

	end
	else if((adcRF||accRF||ndcRF||nccRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(carryWB)) begin //  C
		data1=DataMemoryout;
		data2=x;
	end
	else if((adzRF||aczRF||ndzRF||nczRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)&&(zeroWB)) begin //  Z
		data1=DataMemoryout;
		data2=x;
		end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(ndcWB||adcWB||accWB||nccWB)&&(carryWB2)) begin //C
		data1=DataMemoryout;
		data2=x;
		end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(ndzWB||adzWB||aczWB||nczWB)&&(zeroWB2)) begin //Z
		data1=DataMemoryout;
		data2=x;
end
	else if((adaRF||awcRF||acwRF||acaRF||ncuRF||nduRF)&&(adaWB||awcWB||acwWB||acaWB||ncuWB||nduWB)) begin // 
		data1=DataMemoryout;
		data2=x;
	end
 end
 else if((Instruction_MEM[5:3]==Instruction_RR[8:6])&&(Instruction_MEM[5:3]==Instruction_RR[11:9]))//MM
begin
if(((adcRF)||(accRF)||(ndcRF)||(nccRF))&&(carryWB))
begin
data1= DataMemoryout;
 data2=DataMemoryout;
 end
 else if(((adzRF)||(aczRF)||(ndzRF)||(nczRF))&&(zeroWB))
 begin
 data1= DataMemoryout;
 data2=DataMemoryout;
 end
 else if((adaRF)||(acaRF)||(acwRF)||(awcRF)||(ncuRF)||(nduRF))
 begin
 data1= DataMemoryout;
 data2=DataMemoryout;
 end
 end
 else if((Instruction_WB[5:3]==Instruction_RR[8:6])&&(Instruction_WB[5:3]==Instruction_RR[11:9]))//ww
begin
if(((adcWB)||(accWB)||(ndcWB)||(nccWB))&&(carryWB2))
begin
data1= x;
 data2=x;
end
 else if(((adzWB)||(aczWB)||(ndzWB)||(nczWB))&&(zeroWB2))
 begin
 data1= x;
 data2=x;
 end
 else if((adaWB)||(acaWB)||(acwWB)||(awcWB)||(ncuWB)||(nduWB))
 begin
 data1= x;
 data2=x;
 end
 end
 else if((Instruction_A[5:3]==Instruction_RR[8:6]))//AX
 begin
if(((adc)||(acc)||(ndc)||(ncc))&&(carryRF))
begin
data1=registerdata1;
 data2=result;
 end
 else if(((adz)||(acz)||(ndz)||(ncz))&&(zeroRF))
 begin
 data1=registerdata1;
 data2=result;
 end
 else if((ada)||(aca)||(acw)||(awc)||(ncu)||(ndu))
 begin
 data1=registerdata1;
 data2=result;
 end
 end
 else if((Instruction_A[5:3]==Instruction_RR[11:9]))//XA
 begin
if(((adc)||(acc)||(ndc)||(ncc))&&(cry))begin
	data1=result;
	data2=registerdata2;
end
 else if(((adz)||(acz)||(ndz)||(ncz))&&(zeroRF))
 begin
 data1=result;
 data2=registerdata2;
 end
 else if((ada)||(aca)||(acw)||(awc)||(ncu)||(ndu))
 begin
 data1=result;
 data2=registerdata2;
end
 end
 else if((Instruction_MEM[5:3]==Instruction_RR[11:9]))//XM
 begin
if(((adcRF)||(accRF)||(ndcRF)||(nccRF))&&(carryWB))
begin
data1=DataMemoryout;
 data2=registerdata2;
end
 else if(((adzRF)||(aczRF)||(ndzRF)||(nczRF))&&(zeroWB))
 begin
 data1=DataMemoryout;
 data2=registerdata2;
 end
 else if((adaRF)||(acaRF)||(acwRF)||(awcRF)||(ncuRF)||(nduRF))
 begin
 data1=DataMemoryout;
 data2=registerdata2;
 end
 end
 else if((Instruction_MEM[5:3]==Instruction_RR[8:6]))//MX
 begin
if(((adcRF)||(accRF)||(ndcRF)||(nccRF))&&(carryWB))
begin
data1=registerdata1;
 data2=DataMemoryout;
 end
 else if(((adzRF)||(aczRF)||(ndzRF)||(nczRF))&&(zeroWB))
 begin
 data1=registerdata1;
 data2=DataMemoryout;
 end
 else if((adaRF)||(acaRF)||(acwRF)||(awcRF)||(ncuRF)||(nduRF))
 begin
 data1=registerdata1;
 data2=DataMemoryout;
 end
 end
 else if((Instruction_WB[5:3]==Instruction_RR[11:9]))//XW
 begin
if(((adcWB)||(accWB)||(ndcWB)||(nccWB))&&(carryWB2))
begin
data1=x;
 data2=registerdata2;
 end
 else if(((adzWB)||(aczWB)||(ndzWB)||(nczWB))&&(zeroWB2))
 begin
 data1=x;
 data2=registerdata2;
 end
 else if((adaWB)||(acaWB)||(acwWB)||(awcWB)||(ncuWB)||(nduWB))
 begin
 data1=x;
 data2=registerdata2;
end
 end
 else if((Instruction_WB[5:3]==Instruction_RR[8:6]))//WX
 begin
if(((adcWB)||(accWB)||(ndcWB)||(nccWB))&&(carryWB2))
begin
data1=registerdata1;
 data2=x;
 end
 else if(((adzWB)||(aczWB)||(ndzWB)||(nczWB))&&(zeroWB2))
 begin
 data1=registerdata1;
 data2=x;
 end
 else if((adaWB)||(acaWB)||(acwWB)||(awcWB)||(ncuWB)||(nduWB))
 begin
 data1=registerdata1;
 data2=x;
 end
 end

 
 else
 begin
 data1=registerdata1;
 data2=registerdata2;
 end
end



always @(posedge clock)
 begin 
 ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==1)&&(Instruction_A[12]==1))//SM
begin
result=registerdata1s1+1;
a=SM2;
end
 else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))//SM
begin
result=registerdata1s2+2;
a=SM3;
end
else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==1))//SM
begin
result=registerdata1s3+3;
a=SM4;
end
else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==1))//SM
begin
result=registerdata1s4+4;
a=SM5;
end
else if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==1))//SM
begin
result=registerdata1s5+5;
a=SM6;
end
else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==1))//SM
begin
result=registerdata1s6+6;
a=SM7;
end
else if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==1))//SM
begin
result=registerdata1s7+7;
a=SM8;
end


if((Instruction_A[15]==0)&&(Instruction_A[14]==1)&&(Instruction_A[13]==1)&&(Instruction_A[12]==0))//LM
begin
result=registerdata1s1+1;
end
 else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0))//LM
begin
result=registerdata1s2+2;
end
else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==0))//LM
begin
result=registerdata1s3+3;
end
else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==0))//LM
begin
result=registerdata1s4+4;
end
else if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==0))//LM
begin
result=registerdata1s5+5;
end
else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==0))//LM
begin
result=registerdata1s6+6;
end
else if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==0))//LM
begin
result=registerdata1s7+7;
end
else if((Instruction_A[15]==1)&&(Instruction_A[14]==1)&&(Instruction_A[13]==0)&&(Instruction_A[12]==0))//JAL
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))//JAL
begin
cry=cry;
zero=zero;
end
else if((Instruction_A[15]==1)&&(Instruction_A[14]==1)&&(Instruction_A[13]==0)&&(Instruction_A[12]==1))//JLR
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1))//JLR
begin
cry=cry;
zero=zero;
end
 else if((Instruction_A[15]==1)&&(Instruction_A[14]==1)&&(Instruction_A[13]==1)&&(Instruction_A[12]==1))//JRI
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))//JRI
begin
cry=cry;
zero=zero;
end
else if((Instruction_A[15]==1)&&(Instruction_A[14]==0)&&(Instruction_A[13]==0)&&(Instruction_A[12]==0))//BEQ
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))//BEQ
begin
cry=cry;
zero=zero;
end
else if((Instruction_A[15]==1)&&(Instruction_A[14]==0)&&(Instruction_A[13]==0)&&(Instruction_A[12]==1))//BLT
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1))//BLT
begin
cry=cry;
zero=zero;
end

else if((Instruction_A[15]==1)&&(Instruction_A[14]==0)&&(Instruction_A[13]==1)&&(Instruction_A[12]==0))//BLE
begin
cry=cry;
zero=zero;
end
else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0))//BLE
begin
cry=cry;
zero=zero;
end

else if ((Instruction_RR[15]==0)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==1)) //Add instructions
begin

 
if((Instruction_RR[2]==0)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==0))  //ADA
 begin
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=1;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 acw=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
	{cry,result} = a + b; 
	
	if(result==0) begin
	zero=1;
	end
	
end
	else if((Instruction_RR[2]==1)&&(Instruction_RR[1]==1)&&(Instruction_RR[0]==1)) //ACW
	begin
a=data1;
b=data2;
//	a=registerdata1;
//b=registerdata2;
	
   ada=0;
	acw=1;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
	{cry,result[15:0]} = a + ~(b); 
	if(cry==1)
	begin
	result[15:0] = a + (~b) +1; 
	end
	if(result==0) begin
	zero=1;
	end
	end
else if((Instruction_RR[2]==0)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==1)) //ADZ
begin

a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;

ada=0;
	acw=0;
	 adz=1;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
{cry,result[15:0]}=a+b;
if(result==0)
begin
zero=1;
end
end

else if((Instruction_RR[2]==0)&&(Instruction_RR[1]==1)&&(Instruction_RR[0]==1)) //AWC
	begin
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
   ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=1;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;

	{cry,result[15:0]} = a + b; 
	if(cry==1)
	begin
	result[15:0] = a + b + 1; 
	end
	if(result==0) begin
	zero=1;
	end
else
begin
result=a+b;
end
end	
else if((Instruction_RR[2]==1)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==0)) //ACA
	begin
//
 a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=1;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
	{cry,result[15:0]} = a + ~ (a);
	
	if(result==0) begin
	zero=1;
	end
	end
	else if((Instruction_RR[2]==1)&&(Instruction_RR[1]==1)&&(Instruction_RR[0]==0)) //ACC
	begin
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
   ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=1;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
{cry,result[15:0]} = a + ~ (b); 
	if(result==0) begin
	zero=1;
	end
	end
	
else if((Instruction_RR[2]==1)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==1))  //ACZ
	begin
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=0;
	acw=0;
	 adz=0;
    adc=1;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
	
	{cry,result[15:0]} = a + b;
	if(result==0) begin
	zero=1;
	end
end
end

else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==1)&&(Instruction_RR[12]==0))//NAND
 begin

 if((Instruction_RR[2]==0)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==0)) //NDU
 begin
 a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=1;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
{cry,result[15:0]} = ~(a & b); 
	if(result==0) begin
		zero=1;
	end
end
 else if((Instruction_RR[2]==0)&&(Instruction_RR[1]==1)&&(Instruction_RR[0]==0)) //NDC
	begin
	
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	
	 ada=0;
	 acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=1;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=0;
	{cry,result[15:0]} = ~(a & b); 
	
	
	if(result==0) begin
		zero=1;
	end
	end

	else if((Instruction_RR[2]==0)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==1)) //NDZ
begin	

 a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=1;
	 ncu=0;
	 ncc=0;
    ncz=0;
	{cry,result[15:0]} = ~(a & b);
if(result==0)
begin
zero=1;
end
end
else if((Instruction_RR[2]==1)&&(Instruction_RR[1]==0)&&(Instruction_RR[0]==0)) //NCU
begin

a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
	ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=1;
	 ncc=0;
    ncz=0;
	{cry,result[15:0]} = ~(a & b);
if(result==0)
begin
zero=1;
end
	end
	
	else if((Instruction_RR[0]==0)&&(Instruction_RR[1]==1)&&(Instruction_RR[2]==1)) //NCC
begin
a=data1;
b=data2;
//a=registerdata1;
//b=registerdata2;
ada=0;
	acw=0;
	 adz=0;
    adc=0;
    awc=0;
	 aca=0;
	 acz=0;
	 acc=0;
	 ndu=0;
	 ndc=0;
    ndz=0;
	 ncu=0;
	 ncc=0;
    ncz=1;
{cry,result[15:0]} = ~(a & b);
if(result==0)
begin
zero=1;
end
end
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==0))//ADI
begin
a=registerdata1;
SEIMM1A={IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5],IMM1A[5:0]};
{cry,result}=registerdata1+SEIMM1A;
if(result==0)
begin
zero=1;
end
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==1)&&(Instruction_RR[12]==1))//LLI
begin
a=registerdata1;
result={7'b0,IMM2A[8:0]};
if(result==0)
begin
zero=1;
end
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==0))//LW
begin
a=registerdata2;
{cry,result}=registerdata2+IMM1A;
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==1))//SW
begin
a=registerdata1;
b=registerdata2;
result=b+IMM1A;
end
else if((Instruction_RR[15]==1)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==0))//JAL
begin
result=result;
end
else if((Instruction_RR[15]==1)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==1))//JLR
begin
result=result;
end
else if((Instruction_RR[15]==1)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==1)&&(Instruction_RR[12]==1))//JRI
begin
result=result;
end
else if((Instruction_RR[15]==1)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==0))//BEQ
begin
result=result;
end

else if((Instruction_RR[15]==1)&&(Instruction_RR[14]==0)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==1))//Blr
begin
result=result;
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==1)&&(Instruction_RR[12]==0))//LM
begin
result=registerdata1;
end
else if((Instruction_RR[15]==0)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==1)&&(Instruction_RR[12]==1))//SM
begin
result=registerdata1;
a=SM1;
end
end



endmodule 
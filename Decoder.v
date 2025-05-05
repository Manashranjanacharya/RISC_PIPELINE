module Decoder(clock,RA,RB,RC,IMM1,IMM2,andD,nandD,t,beq,blt,ble,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3);
input clock;
output reg andD;
output reg nandD;
output reg[2:0]RA,RB,RC,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3;
output reg[5:0]IMM1;
output reg[8:0]IMM2;
wire [15:0]Instruction;
wire [15:0]Instruction_D;
wire [15:0]Instruction_A;
wire [15:0]Instruction_RR;
wire [15:0]Instruction_MEM;
wire [15:0]Instruction_WB;
wire [15:0]Instruction_ST;
input [15:0]t;
 wire [15:0]PC_D;
wire [15:0]PC_RF;
wire [15:0]PC_AL;
wire [15:0]PC_DM; 
wire [15:0]PC;
input beq;
input blt;
input ble;
wire[15:0]Instruction_ST2;
wire[15:0]Instruction_ST3;
wire[15:0]Instruction_ST4;
wire[15:0]Instruction_ST5;
wire[15:0]Instruction_ST6;


Fetch F1(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
 
always@(posedge clock)
begin
if((Instruction[15]==0)&&(Instruction[14]==0)&&(Instruction[13]==0)&&(Instruction[12]==1))//ADD operation
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
RC<=Instruction[5:3];

andD<=1;
nandD<=0;
end
else if((Instruction[15]==0)&&(Instruction[14]==0)&&(Instruction[13]==1)&&(Instruction[12]==0))//NAND operation
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
RC<=Instruction[5:3];
andD<=0;
nandD<=1;
end

else if((Instruction[15]==0)&&(Instruction[14]==0)&&(Instruction[13]==0)&&(Instruction[12]==0))//ADI
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
IMM1<=Instruction[5:0];
end
else if((Instruction[15]==0)&&(Instruction[14]==0)&&(Instruction[13]==1)&&(Instruction[12]==1))//LLI
begin
RA<=Instruction[11:9];
IMM2<=Instruction[8:0];
end
else if((Instruction[15]==0)&&(Instruction[14]==1)&&(Instruction[13]==0)&&(Instruction[12]==0))//Load word
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
IMM1<=Instruction[5:0];
end
 else if((Instruction[15]==0)&&(Instruction[14]==1)&&(Instruction[13]==0)&&(Instruction[12]==1))//store word
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
IMM1<=Instruction[5:0];
end
else if((Instruction[15]==1)&&(Instruction[14]==1)&&(Instruction[13]==0)&&(Instruction[12]==0))      //JAL
begin
RA<=Instruction[11:9];
end
else if((Instruction[15]==1)&&(Instruction[14]==1)&&(Instruction[13]==0)&&(Instruction[12]==1))      //JLR
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
end
else if((Instruction[15]==1)&&(Instruction[14]==1)&&(Instruction[13]==1)&&(Instruction[12]==1))      //JRI
begin
RA<=Instruction[11:9];
IMM2<=Instruction[8:0];
end
else if((Instruction[15]==1)&&(Instruction[14]==0)&&(Instruction[13]==0)&&(Instruction[12]==0)) //BEQ
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
end
else if((Instruction[15]==1)&&(Instruction[14]==0)&&(Instruction[13]==0)&&(Instruction[12]==1)) //BLT
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
end
else if((Instruction[15]==1)&&(Instruction[14]==0)&&(Instruction[13]==1)&&(Instruction[12]==0)) //BLE
begin
RA<=Instruction[11:9];
RB<=Instruction[8:6];
end
else if((Instruction[15]==0)&&(Instruction[14]==1)&&(Instruction[13]==1)&&(Instruction[12]==0)) //LM
begin
RA<=Instruction[11:9];
IMM2<=Instruction[8:0];
end
else if((Instruction[15]==0)&&(Instruction[14]==1)&&(Instruction[13]==1)&&(Instruction[12]==1)) //SM
begin
RA<=Instruction[11:9];
IMM2<=Instruction[8:0];
end
end

always@(posedge clock)
begin
RC1<=RC;
RC2<=RC1;
RC3<=RC2;
RA1<=RA;
RA2<=RA1;
RA3<=RA2;
RB1<=RB;
RB2<=RB1;
RB3<=RB2;
end
endmodule





module Fetch(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
 
input clock;    // a synthesisable rom implementation  
output reg[15:0]Instruction;
output reg[15:0]Instruction_D;
output reg[15:0]Instruction_A;
output reg[15:0]PC_D;
output reg[15:0]PC_DM;
output reg[15:0]Instruction_RR;
output reg[15:0]Instruction_MEM;
output reg[15:0]Instruction_WB;
output reg[15:0]Instruction_ST;
output reg[15:0]Instruction_ST2;
output reg[15:0]Instruction_ST3;
output reg[15:0]Instruction_ST4;
output reg[15:0]Instruction_ST5;
output reg[15:0]Instruction_ST6;
output reg [15:0]PC=0;
output reg[15:0]PC_RF;
output reg[15:0]PC_AL;
input beq;
input blt;
input ble;
input [15:0]t;
reg [15:0] rom [0:145];  
initial
 begin  
rom[0] = 16'b0001001010100000;   //ADA
rom[1] = 16'b0001100111101001;   //ADZ
rom[2] = 16'b0001100110101011;   //AWC
//rom[1] = 16'b0110100000000011;        //LM
//rom[3] = 16'b0001101110101011;   //AWC
rom[3] = 16'b1111011000000111;  		//JRI
rom[4] = 16'b0001110101001011;   //AWC
rom[5]=  16'b0001110010011100;   //ACA
rom[6] = 16'b0001110010011101;  //ACZ
rom[7] = 16'b0001011001011000;  //ACC
rom[8] = 16'b0001101010011111;  //ACW
rom[9] = 16'b0010110110011000;  //NDU
rom[10] = 16'b0010110010101010;  //NDC
rom[11] = 16'b0010001010011001;  //NDZ 
rom[12] = 16'b0010001010011100;  //NCU 
rom[13] = 16'b0010001010011110;  //NCC 
rom[14] = 16'b0010001010011101;  //NCZ 
rom[15] = 16'b0000101011011101;  //ADI
rom[16] = 16'b0011101000001101;  //LLI
rom[17] = 16'b0100101001001100;  //LW
rom[18] = 16'b0101111011001100;  //SW
rom[19] = 16'b0001001010011000;   //ADA
rom[20] = 16'b0001001111011001;   //ADZ
rom[21] = 16'b0001111011110010;   //ADC
rom[22] = 16'b0001111110101011;   //AWC
rom[23] = 16'b0001101010011100;   //ACA
rom[24] = 16'b1100011000001100;       //JAL
rom[25] = 16'b0001001010011000;   //ADA
rom[26] = 16'b0001001111011001;   //ADC
rom[27] = 16'b0001100101110010;   //ADZ
rom[28] = 16'b0001100110101011;   //AWC
rom[29] = 16'b0001101010011100;   //ACA
rom[30] = 16'b0001110010011101;  //ACC
rom[31] = 16'b0001111010011110;  //ACZ
rom[32] = 16'b1111101010001100;  	//JRI
rom[33] = 16'b0010110110011000;  //NDU
rom[34] = 16'b0010001010011010;  //NDC
rom[35] = 16'b0010001010011001;  //NDZ 
rom[36] = 16'b0010001010011100;  //NCU 
rom[37] = 16'b0010001010011110;  //NCC 
rom[38] = 16'b0010001010011101;  //NCZ 
rom[39] = 16'b0000101011011101;  //ADI
rom[40] = 16'b0011101000001101;  //LLI
rom[41] = 16'b0100101001001100;  //LW
rom[42] = 16'b0101111011001100;  //SW
rom[43] = 16'b1101011010000000;  	//JLR
rom[44] = 16'b0001001111011001;  //ADC
rom[45] = 16'b0001100101110010;  //ADZ
rom[46] = 16'b0001100110101011;  //AWC
rom[47] = 16'b0001101010011100;  //ACA
rom[48] = 16'b0001110010011101;  //ACC
rom[49] = 16'b0001111010011110;  //ACZ
rom[50] = 16'b0001010010011111;  //ACW
rom[51] = 16'b0010110110011000;  //NDU
rom[52] = 16'b0010001010011010;  //NDC
rom[53] = 16'b0010001010011001;  //NDZ 
rom[54] = 16'b0010001010011100;  //NCU 
rom[55] = 16'b0010001010011110;  //NCC 
rom[56] = 16'b0010001010011101;  //NCZ 
rom[57] = 16'b0000111011011101;  //ADI
rom[58] = 16'b0011101000001101;  //LLI
rom[59] = 16'b0100111111001100;  //LW
//rom[60] = 16'b1111101000001100;  	//JRI
rom[60]=  16'b1000101101000111;//     BEQ
//rom[60] = 16'b0001110010011101;  //ACC
rom[61] = 16'b0001110010011101;  //ACC
rom[62] = 16'b0001111010011110;  //ACZ
rom[63] = 16'b0001101010011111;  //ACW
rom[64] = 16'b0010110110011000;  //NDU
rom[65] = 16'b0010001010011010;  //NDC
rom[66] = 16'b0010001010011001;  //NDZ 
rom[67] = 16'b0010001010011100;  //NCU 
rom[68] = 16'b0010001010011110;  //NCC 
rom[69] = 16'b0010001010011101;  //NCZ 
rom[70] = 16'b0000101011011101;  //ADI
rom[71] = 16'b0011101000001101;  //LLI
rom[72] = 16'b0100101011001100;  //LW
//rom[73] = 16'b0100101011001100;  //LW
//rom[73] = 16'b0011101000001101;  //LLI
rom[73] = 16'b0001011010011000;   //ADA
rom[74] = 16'b0001110111011001;   //ADC
rom[75] = 16'b0001100101110010;   //ADZ
rom[76] = 16'b0001101010011100;   //ACA
rom[77] = 16'b0001101010011100;   //ACA
rom[78] = 16'b0011101000001101;  //LLI
rom[79] = 16'b0100101011001100;  //LW
rom[80] = 16'b0001001010011000;   //ADA
rom[81] = 16'b0001001111011001;   //ADC
rom[82] = 16'b0001100101110010;   //ADZ
rom[83] = 16'b0110100000000011;        //LM
//rom[83] = 16'b0001100110101011;   //AWC
rom[84] = 16'b0001101010011100;   //ACA
rom[85] = 16'b0001110010011101;  //ACC
rom[86] = 16'b0001111010011110;  //ACZ
rom[87] = 16'b0001101010011111;  //ACW
rom[88] = 16'b0010110110011000;  //NDU
rom[89] = 16'b0010001010011010;  //NDC
rom[90]=  16'b1000101101000111;//     BEQ
rom[91] = 16'b0001100110101011;   //AWC
rom[92] = 16'b0001101010011100;   //ACA
rom[93] = 16'b0001110010011101;  //ACC
rom[94] = 16'b0001111010011110;  //ACZ
rom[95] = 16'b0001101010011111;  //ACW
rom[96] = 16'b0010110110011000;  //NDU
rom[97] = 16'b0010001010011010;  //NDC
rom[98] = 16'b0001100110101011;   //AWC
rom[99] = 16'b0001101010011100;   //ACA
rom[100] = 16'b0001110010011101;  //ACC
rom[101] = 16'b0001111010011110;  //ACZ
rom[102] = 16'b0001101010011111;  //ACW
rom[103] = 16'b0010110110011000;  //NDU
rom[104] = 16'b0010001010011010;  //NDC
rom[105] = 16'b0001100110101011;   //AWC
rom[106] = 16'b0001101010011100;   //ACA
rom[107] = 16'b0001110010011101;  //ACC
rom[108] = 16'b0001111010011110;  //ACZ
rom[109] = 16'b0001101010011111;  //ACW
rom[110] = 16'b0010110110011000;  //NDU
rom[111] = 16'b0010001010011010;  //NDC
rom[112] = 16'b1001100100000011;  //   BLE/BLT
rom[113] = 16'b0001001010011000;   //ADA
rom[114] = 16'b0001001111011001;   //ADC
rom[115]=  16'b0001100101110010;   //ADZ
rom[116] = 16'b0001100110101011;   //AWC
rom[117]=  16'b0001101010011100;   //ACA
rom[118] = 16'b0001110010011101;  //ACC
rom[119] = 16'b0001111010011110;  //ACZ
rom[120] = 16'b0001101010011111;  //ACW
rom[121] = 16'b0001001010011000;   //ADA
rom[122] = 16'b0001001111011001;   //ADC
rom[123]=  16'b0001100101110010;   //ADZ
rom[124] = 16'b0001100110101011;   //AWC
rom[125]=  16'b0001101010011100;   //ACA
rom[126] = 16'b0001110010011101;  //ACC
rom[127] = 16'b0001111010011110;  //ACZ
rom[128] = 16'b0001101010011111;  //ACW
rom[129] = 16'b0001001010011000;   //ADA
rom[130] = 16'b0001001111011001;   //ADC
rom[131]=  16'b0001100101110010;   //ADZ
rom[132] = 16'b0001100110101011;   //AWC
rom[133]=  16'b0001101010011100;   //ACA
rom[134] = 16'b0001110010011101;  //ACC
rom[135] = 16'b0001111010011110;  //ACZ
rom[136] = 16'b0001101010011111;  //ACW
rom[137] = 16'b1111101000001100;  	//JRI
rom[138] = 16'b0001101010011111;  //ACW
rom[139] = 16'b0001001010011000;   //ADA
rom[140] = 16'b0001001111011001;   //ADC
rom[141]=  16'b0001100101110010;   //ADZ
rom[142] = 16'b0001100110101011;   //AWC
rom[143]=  16'b0001101010011100;   //ACA
rom[144] = 16'b0001110010011101;  //ACC
rom[145] = 16'b0001111010011110;  //ACZ
end  
always@(posedge clock)
begin
if((Instruction[15]==1)&&(Instruction[14]==1)&&(Instruction[13]==0)&&(Instruction[12]==0))//jal
begin  
PC<=(PC-1)+(Instruction[8:0]*2);
Instruction<=rom[PC];
end

else if((Instruction_D[15]==1)&&(Instruction_D[14]==1)&&(Instruction_D[13]==0)&&(Instruction_D[12]==1))//jlr
begin 
PC<=t;
Instruction<=rom[PC];
end
else if((Instruction_D[15]==1)&&(Instruction_D[14]==1)&&(Instruction_D[13]==1)&&(Instruction_D[12]==1))//jri
begin 
PC<=t+(Instruction_D[8:0]*2);
Instruction<=rom[PC];
end
else if((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==0)&&(Instruction_D[12]==0))//BEQ
begin 
if(beq==1)
begin
PC<=(PC-2)+(Instruction_D[5:0]*2);
Instruction<=rom[PC];
end
else
begin
PC<=PC+1;
Instruction<=rom[PC];
end
end

else if ((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==0)&&(Instruction_D[12]==1)) //BLT
begin
if(blt==1)
begin
PC<=(PC-2)+(Instruction_D[5:0]*2);
Instruction<=rom[PC];
end
else
begin
PC<=PC+1;
Instruction<=rom[PC];
end
end

else if ((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==1)&&(Instruction_D[12]==0)) //BLE
begin
if(ble==1)
begin
PC<=(PC-2)+(Instruction_D[5:0]*2);
Instruction<=rom[PC];
end
else
begin
PC<=PC+1;
Instruction<=rom[PC];
end
end
else if(PC<146)
begin
PC<=PC+1;
Instruction<=rom[PC];
end


Instruction_D<=Instruction;
Instruction_RR<=Instruction_D;
Instruction_A<=Instruction_RR;
Instruction_MEM<=Instruction_A;
Instruction_WB<=Instruction_MEM;
Instruction_ST<=Instruction_WB;
Instruction_ST2<=Instruction_ST;
Instruction_ST3<=Instruction_ST2;
Instruction_ST4<=Instruction_ST3;
Instruction_ST5<=Instruction_ST4;
Instruction_ST6<=Instruction_ST5;
PC_D<=PC;
PC_RF<=PC_D;
PC_AL<=PC_RF;
PC_DM<=PC_AL;
end


endmodule
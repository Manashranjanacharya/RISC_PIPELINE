module Registerfile(clock,registerdata1,registerdata2,registerdata3,x,carryRF,zeroRF,acaRF,adaRF,adzRF,adcRF,awcRF,aczRF,accRF,acwRF,nduRF,ndcRF,ndzRF,ncuRF,nccRF,nczRF,andALU,nandALU,IMM1A,IMM2A,beq,blt,ble,t,reg0,IMM3A,IMM4A,IMM5A,IMM6A,IMM7A,IMM8A,IMM9A,IMM10A,IMM11A,registerdata1s1,registerdata1s2,registerdata1s3,registerdata1s4,registerdata1s5,registerdata1s6,registerdata1s7,carryWB,SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8);
input clock;
input carryRF;
input zeroRF;
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
output beq;
output blt;
output ble;
output reg[15:0]SM1,SM2,SM3,SM4,SM5,SM6,SM7,SM8;
output reg[15:0]t;
wire [2:0] RA,RB,RC,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3; 
output reg[5:0]IMM1A;
output reg[8:0]IMM2A;
output reg[8:0]IMM3A;
output reg[8:0]IMM4A;
output reg[8:0]IMM5A;
output reg[8:0]IMM6A;
output reg[8:0]IMM7A;
output reg[8:0]IMM8A;
output reg[8:0]IMM9A;
output reg[8:0]IMM10A;
output reg[8:0]IMM11A;
input carryWB;
output reg andALU,nandALU;
output reg[15:0]x;
input[15:0] registerdata3; 
output reg[15:0] registerdata1; 
output reg[15:0]registerdata2; 
output reg[15:0]registerdata1s1; 
output reg[15:0]registerdata1s2; 
output reg[15:0]registerdata1s3; 
output reg[15:0]registerdata1s4; 
output reg[15:0]registerdata1s5; 
output reg[15:0]registerdata1s6; 
output reg[15:0]registerdata1s7; 
reg [15:0] reg_array [0:7]; 
wire [15:0]Instruction_MEM;
wire [15:0]Instruction_WB;
wire [15:0]Instruction_D;
wire [15:0]Instruction_A;
wire [15:0]Instruction;
wire [15:0]PC_D;
wire [15:0]PC_AL;
wire [15:0]PC_DM;
wire [15:0]Instruction_RR;
wire [15:0]Instruction_ST;
wire [15:0]Instruction_ST2;
wire [15:0]Instruction_ST3;
wire [15:0]Instruction_ST4;
wire [15:0]Instruction_ST5;
wire [15:0]Instruction_ST6;
wire [5:0]IMM1;
wire [8:0]IMM2;
wire andD;
wire nandD;
wire [15:0]PC_RF;
wire[15:0]PC;
output reg[15:0]reg0;
Fetch F1(clock,Instruction_D,Instruction,PC_D,Instruction_A,Instruction_RR,Instruction_MEM,Instruction_WB,PC_RF,PC_AL,PC_DM,Instruction_ST,Instruction_ST2,PC,beq,blt,ble,t,Instruction_ST3,Instruction_ST4,Instruction_ST5,Instruction_ST6);
Decoder D1(clock,RA,RB,RC,IMM1,IMM2,andD,nandD,t,beq,blt,ble,RA1,RA2,RA3,RB1,RB2,RB3,RC1,RC2,RC3);

	 
				 
					 initial
					 begin
          
					
                reg_array[0] <= PC;  
                reg_array[1] <= 16'd1;  
                reg_array[2] <= 16'd2;  
                reg_array[3] <= 16'd3;  
                reg_array[4] <= 16'd4;  
                reg_array[5] <= 16'd5;  
                reg_array[6] <= 16'd6;  
                reg_array[7] <= 16'd7; 
				end
				always@(posedge clock) 
				begin
				if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==1))//SM-1
			begin
       
			end
      else if((Instruction_ST5[15]==0)&&(Instruction_ST5[14]==1)&&(Instruction_ST5[13]==1)&&(Instruction_ST5[12]==1))//SM-2
			begin
        
			end
       else if((Instruction_ST6[15]==0)&&(Instruction_ST6[14]==1)&&(Instruction_ST6[13]==1)&&(Instruction_ST6[12]==1))//SM-3
			begin
        
			end
        
       else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))//SM-4
			begin
       
			end
			
       else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==1))//SM-5
		  begin
      
			end
			
       else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==1))//SM-6
			begin
      
			end
		
      else  if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==1))//SM-7
			begin
       
			end
			
       else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==1))//SM-8
			begin
    
			end
		else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0))//LM-1
			begin
				if(IMM4A[7]==1)
				begin
			reg_array[0]<=registerdata3;
			x<=registerdata3; 
			end
			end
			 else if((Instruction_WB[15]==0)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==0))//LM-2
			begin
				if(IMM5A[6]==1)
				begin
			reg_array[1]<=registerdata3;
			x<=registerdata3; 
			end
			end
			 else if((Instruction_ST[15]==0)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==0))//LM-3
				begin
				if(IMM6A[5]==1)
				begin
			reg_array[2]<=registerdata3;
			x<=registerdata3; 
			end
			end
			else if((Instruction_ST2[15]==0)&&(Instruction_ST2[14]==1)&&(Instruction_ST2[13]==1)&&(Instruction_ST2[12]==0))//LM-4
				begin
				if(IMM7A[4]==1)
				begin
			reg_array[3]<=registerdata3;
			x<=registerdata3; 
			end
			end
			else if((Instruction_ST3[15]==0)&&(Instruction_ST3[14]==1)&&(Instruction_ST3[13]==1)&&(Instruction_ST3[12]==0))//LM-5
				begin
				if(IMM8A[3]==1)
				begin
			reg_array[4]<=registerdata3;
			x<=registerdata3; 
			end
			end
			else if((Instruction_ST4[15]==0)&&(Instruction_ST4[14]==1)&&(Instruction_ST4[13]==1)&&(Instruction_ST4[12]==0))//LM-6
				begin
				if(IMM9A[2]==1)
				begin
			reg_array[5]<=registerdata3;
			x<=registerdata3; 
			end
			end
			 else if((Instruction_ST5[15]==0)&&(Instruction_ST5[14]==1)&&(Instruction_ST5[13]==1)&&(Instruction_ST5[12]==0))//LM-7
				begin
				if(IMM10A[1]==1)
				begin
			reg_array[6]<=registerdata3;
			x<=registerdata3; 
			end
			end
			else if((Instruction_ST6[15]==0)&&(Instruction_ST6[14]==1)&&(Instruction_ST6[13]==1)&&(Instruction_ST6[12]==0))//LM-8
				begin
				if(IMM11A[0]==1)
				begin
			reg_array[7]<=registerdata3;
			x<=registerdata3; 
			end
				end
				
				
			
				else if((Instruction_WB[15]==1)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==0)&&(Instruction_WB[12]==0))//JAL
				begin
				//stall JAL
				end
				
				else if((Instruction_ST[15]==1)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==0)&&(Instruction_ST[12]==0))//JAL
				begin
				//stall JAL
				end
				
				else if(((Instruction_WB[15]==1)&&(Instruction_WB[14]==0)&&(Instruction_WB[13]==0)&&(Instruction_WB[12]==0))&&(beq==1))//BEQ
				begin
				//stall BEQ
				end
		
				else if(((Instruction_ST[15]==1)&&(Instruction_ST[14]==0)&&(Instruction_ST[13]==0)&&(Instruction_ST[12]==0))&&(beq==1))//BEQ
				begin
				//stall BEQ
				end
				
				else if(((Instruction_WB[15]==1)&&(Instruction_WB[14]==0)&&(Instruction_WB[13]==0)&&(Instruction_WB[12]==1))&&(blt==1))//BLT
				begin
				//stall BLT
				end
		
				else if(((Instruction_ST[15]==1)&&(Instruction_ST[14]==0)&&(Instruction_ST[13]==0)&&(Instruction_ST[12]==1))&&(blt==1))//BLT
				begin
				//stall BLT
				end
				else if(((Instruction_WB[15]==1)&&(Instruction_WB[14]==0)&&(Instruction_WB[13]==0)&&(Instruction_WB[12]==1))&&(ble==1))//BLE
				begin
				//stall BLE
				end
		
				else if(((Instruction_ST[15]==1)&&(Instruction_ST[14]==0)&&(Instruction_ST[13]==0)&&(Instruction_ST[12]==1))&&(ble==1))//BLE
				begin
				//stall BLE
				end
				else if((Instruction_WB[15]==1)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==0)&&(Instruction_WB[12]==1))//JLR
				begin
				//stall JLR
				end
		
				else if((Instruction_ST[15]==1)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==0)&&(Instruction_ST[12]==1))//JLR
				begin
			//stall JLR
         		end
	
				else if((Instruction_WB[15]==1)&&(Instruction_WB[14]==1)&&(Instruction_WB[13]==1)&&(Instruction_WB[12]==1))//JRI
				begin
				//stall JRI
				end
				else if((Instruction_ST[15]==1)&&(Instruction_ST[14]==1)&&(Instruction_ST[13]==1)&&(Instruction_ST[12]==1))//JRI
				begin
				//stall JRI
				end
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(adaRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end  
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(adzRF)&&(zeroRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end  
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(adcRF)&&(carryRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(awcRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(acaRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(aczRF)&&(zeroRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					 else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(accRF)&&(carryWB))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1)&&(acwRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(nduRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end 
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(ndcRF)&&(carryRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
				else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(ndzRF)&&(zeroRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
				else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(ncuRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end	
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(nccRF)&&(carryRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==0)&&(nczRF)&&(zeroRF))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))
					 begin
               reg_array[RC3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))
					 begin
               reg_array[RA3]<=registerdata3;//WriteBack
					x<=registerdata3;
					end
					else if((Instruction_MEM[15]==0)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))//LW
					 begin
               reg_array[RA3]<=registerdata3;//WriteBack
					x<=registerdata3; 
					end
					else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))//JAL
			begin
        //stall
		end
			else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1))//JLR
			begin
        //stall
			end
				else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==1)&&(Instruction_MEM[13]==1)&&(Instruction_MEM[12]==1))//JRI
				begin
			//stall
				end
				else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==0))//BEQ
				begin
			//stall
				end
				else if((Instruction_MEM[15]==1)&&(Instruction_MEM[14]==0)&&(Instruction_MEM[13]==0)&&(Instruction_MEM[12]==1))//BLE
				begin
			//stall
				end
		
				if((Instruction_RR[15]==1)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==0))//JAL
         begin
         reg_array[RA1]<=PC_RF+2;
           end
       if((Instruction_RR[15]==1)&&(Instruction_RR[14]==1)&&(Instruction_RR[13]==0)&&(Instruction_RR[12]==1))//JLR
          begin
    reg_array[RA1]<=PC_RF+2;
         end
				
			//registerdata1 <= reg_array[RA]; 
		registerdata1s1<=registerdata1;
		registerdata1s2<=registerdata1s1;
		registerdata1s3<=registerdata1s2;
		registerdata1s4<=registerdata1s3;
		registerdata1s5<=registerdata1s4;
		registerdata1s6<=registerdata1s5;
		registerdata1s7<=registerdata1s6;
           //registerdata2 <= reg_array[RB]; 
			  andALU<=andD;
			  nandALU<=nandD;
			
		reg_array[0]<=PC;
			reg0<=PC;
	
			   IMM11A<=IMM10A;
			   IMM10A<=IMM9A;
			  IMM9A<=IMM8A;
			   IMM8A<=IMM7A;
			  IMM7A<=IMM6A;
			  IMM6A<=IMM5A;
			  IMM5A<=IMM4A;
			  IMM4A<=IMM3A;
			  IMM3A<=IMM2A;
			  IMM1A<=IMM1;
			  IMM2A<=IMM2;
			  SM1<=reg_array[0];
			 SM2<=reg_array[1];
			  SM3<=reg_array[2];
			   SM4<=reg_array[3];
				 SM5<=reg_array[4];
				  SM6<=reg_array[5];
				   SM7<=reg_array[6];
					 SM8<=reg_array[7];
				
			  registerdata1 <= reg_array[RA]; 
			    registerdata2 <= reg_array[RB]; 
				 end
			  
		always@(*)
begin
if((Instruction_D[15]==1)&&(Instruction_D[14]==1)&&(Instruction_D[13]==0)&&(Instruction_D[12]==0))//JAL
begin
t=PC_RF+2;
end
 else if((Instruction_D[15]==1)&&(Instruction_D[14]==1)&&(Instruction_D[13]==0)&&(Instruction_D[12]==1))//JLR
begin
t=reg_array[RA];
end
else if((Instruction_D[15]==1)&&(Instruction_D[14]==1)&&(Instruction_D[13]==1)&&(Instruction_D[12]==1))//JRI
begin
t=reg_array[RA];
end        
end

assign beq=((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==0)&&(Instruction_D[12]==0)&&(reg_array[RA]==reg_array[RB]))?1'b1:1'b0;

assign blt=((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==0)&&(Instruction_D[12]==1)&&(reg_array[RA]<reg_array[RB]))?1'b1:1'b0;

assign ble=((Instruction_D[15]==1)&&(Instruction_D[14]==0)&&(Instruction_D[13]==0)&&(Instruction_D[12]==1)&&(reg_array[RA]<=reg_array[RB]))?1'b1:1'b0;
endmodule
	
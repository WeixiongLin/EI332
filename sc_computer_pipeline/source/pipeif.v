module pipeif( pcsource,pc,bpc,da,jpc,npc,pc4,ins,mem_clock );
	input  [1:0]  pcsource;
	input			  mem_clock;
	input  [31:0] pc, bpc, jpc, da;
	output [31:0] npc, pc4, ins;
	
	wire	 [31:0] npc, pc4, ins;
	
	mux4x32 npc_mux( pc4, bpc, da, jpc, pcsource, npc ); // 下一个pc值
	
	assign pc4 = pc + 4;
	
	sc_instmem imem ( pc, ins, mem_clock );  //mem_clock是clock的反向
	
endmodule
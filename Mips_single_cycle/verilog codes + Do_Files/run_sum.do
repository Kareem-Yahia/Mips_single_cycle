vlib work
vlog alu.v datamemory.v instruction_fetch.v instruction_memory.v mips_tb.v mips1.v mux2_1_6in.v mux2_1_32in.v registerfile.v signextender.v controlunit.v
#vsim -voptargs=+acc work.mips1_tb
vsim -debugDB work.mips1_tb
add wave *
add wave -position insertpoint  \
sim:/mips1_tb/mipso1/RegWrite \
sim:/mips1_tb/mipso1/readaddr \
sim:/mips1_tb/mipso1/isntructionmemory/mem \
sim:/mips1_tb/mipso1/instruction \
sim:/mips1_tb/mipso1/Readreg1 \
sim:/mips1_tb/mipso1/Readreg2 \
sim:/mips1_tb/mipso1/WriteReg \
sim:/mips1_tb/mipso1/WriteDataregsf \
sim:/mips1_tb/mipso1/ReadData1 \
sim:/mips1_tb/mipso1/ReadData2 \
sim:/mips1_tb/mipso1/opcode \
sim:/mips1_tb/mipso1/funct \
sim:/mips1_tb/mipso1/a \
sim:/mips1_tb/mipso1/b \
sim:/mips1_tb/mipso1/aluresult \
sim:/mips1_tb/mipso1/zero_flag \
sim:/mips1_tb/mipso1/regfile/regs_file \
sim:/mips1_tb/mipso1/in_signextendr \
sim:/mips1_tb/mipso1/out_signextender \
sim:/mips1_tb/mipso1/RegDst \
sim:/mips1_tb/mipso1/RegWrite \
sim:/mips1_tb/mipso1/Extd \
sim:/mips1_tb/mipso1/Alusrc \
sim:/mips1_tb/mipso1/Memread \
sim:/mips1_tb/mipso1/Memwrite \
sim:/mips1_tb/mipso1/MemtoReg \
sim:/mips1_tb/mipso1/Jump \
sim:/mips1_tb/mipso1/branch \
sim:/mips1_tb/mipso1/datamemory/mem \
sim:/mips1_tb/mipso1/datamemory/data_out
run -all
#quit -sim
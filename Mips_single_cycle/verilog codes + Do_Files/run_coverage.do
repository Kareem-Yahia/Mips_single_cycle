vlib work
vlog -coveropt 3 +cover +acc alu.v datamemory.v instruction_fetch.v instruction_memory.v mips_tb.v mips1.v mux2_1_6in.v mux2_1_32in.v registerfile.v signextender.v controlunit.v
vsim -coverage -vopt work.mips1_tb -c -do "coverage save -onexit -directive -codeAll ReportCoverge.ucdb; run -all"
vcover report -html ReportCoverge.ucdb
#quit -sim
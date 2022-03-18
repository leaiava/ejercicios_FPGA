ghdl -a ../../sumador_1bit/Fuentes/sum1b.vhd ../../sumador_4bit/Fuentes/sum4b.vhd ../Fuentes/SumRes.vhd ../Fuentes/SumRes_tb.vhd
ghdl -s ../../sumador_1bit/Fuentes/sum1b.vhd ../../sumador_4bit/Fuentes/sum4b.vhd ../Fuentes/SumRes.vhd ../Fuentes/SumRes_tb.vhd
ghdl -e SumRes_tb
ghdl -r SumRes_tb --vcd=SumRes_tb.vcd --stop-time=1000ns
gtkwave SumRes_tb.vcd

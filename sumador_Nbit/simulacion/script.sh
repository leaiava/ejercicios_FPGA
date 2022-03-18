ghdl -a ../../sumador_1bit/Fuentes/sum1b.vhd ../Fuentes/sumNb.vhd ../Fuentes/sumNb_tb.vhd
ghdl -s ../../sumador_1bit/Fuentes/sum1b.vhd ../Fuentes/sumNb.vhd ../Fuentes/sumNb_tb.vhd
ghdl -e sumNb_tb
ghdl -r sumNb_tb --vcd=sumNb_tb.vcd --stop-time=500ns
gtkwave sumNb_tb.vcd

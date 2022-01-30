GHDL := ghdl-mcode

sources = rtl/onyarv_cpu.vhd rtl/onyarv_reg.vhd rtl/onyarv_control.vhd rtl/onyarv_alu.vhd
sim_sources = sim/onyarv_cpu_tb.vhd sim/onyarv_control_tb.vhd sim/onyarv_alu_tb.vhd

.PHONY: elaborate
elaborate: $(sources) $(sim_sources)
	$(GHDL) -a $(sources) $(sim_sources)
	$(GHDL) -e onyarv_cpu

.PHONY: sim
sim: $(sources) $(sim_sources)
	$(GHDL) -r onyarv_cpu_tb --stop-time=10us

.PHONY: control_sim
control_sim: $(sources) $(sim_sources)
	$(GHDL) -a $(sources) $(sim_sources)
	$(GHDL) -e onyarv_control_tb
	$(GHDL) -r onyarv_control_tb --stop-time=10us --vcd=control.vcd

alu_sim: $(sources) $(sim_sources)
	$(GHDL) -a $(sources) $(sim_sources)
	$(GHDL) -e onyarv_alu_tb
	$(GHDL) -r onyarv_alu_tb --stop-time=10us --vcd=alu.vcd

.PHONY: clean 
clean:
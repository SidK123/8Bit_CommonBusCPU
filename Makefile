all:    cpumake assemble sim-gui 

cpumake: *.sv *.vh
	vcs -sverilog -debug *.sv *.vh

sim-gui: simv
	./simv -gui &

assemble: 
	python3 assembler.py

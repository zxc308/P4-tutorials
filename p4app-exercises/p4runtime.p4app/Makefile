
all: run

run:
	../p4app/p4app run .

h1:
	../p4app/p4app exec m h1 bash

h2:
	../p4app/p4app exec m h2 bash

h3:
	../p4app/p4app exec m h3 bash

WORK_DIR=/tmp/p4app-logs

mycontroller:
	../p4app/p4app exec ./mycontroller.py --p4info $(WORK_DIR)/advanced_tunnel.p4info.txt --bmv2-json $(WORK_DIR)/advanced_tunnel.json

solutioncontroller:
	../p4app/p4app exec ./solution/mycontroller.py --p4info $(WORK_DIR)/advanced_tunnel.p4info.txt --bmv2-json $(WORK_DIR)/advanced_tunnel.json

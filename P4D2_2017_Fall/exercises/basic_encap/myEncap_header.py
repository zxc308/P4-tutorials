
from scapy.all import *
import sys, os

PROTO_MYENCAP = 253

class MyEncap(Packet):
    name = "MyEncap"
    fields_desc = [
        ByteField("valid", 0)
    ]
    def mysummary(self):
        return self.sprintf("valid=%valid%")


bind_layers(IP, MyEncap, proto=PROTO_MYENCAP)
bind_layers(MyEncap, Raw)



from scapy.all import *
import sys, os

TYPE_MYENCAP = 0x1212
TYPE_IPV4 = 0x0800

class MyEncap(Packet):
    name = "MyEncap"
    fields_desc = [
        ShortField("pid", 0),
        ShortField("dst_nid", 0)
    ]
    def mysummary(self):
        return self.sprintf("pid=%pid%, dst_nid=%dst_nid%")


bind_layers(Ether, MyEncap, type=TYPE_MYENCAP)
bind_layers(MyEncap, IP, pid=TYPE_IPV4)


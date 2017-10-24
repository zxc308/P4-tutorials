#!/usr/bin/env python
import argparse
import sys
import socket
import random
import struct

from scapy.all import sendp, send, get_if_list, get_if_hwaddr, hexdump
from scapy.all import Packet
from scapy.all import Ether, IP, UDP, TCP
from myEncap_header import MyEncap

def get_if():
    ifs=get_if_list()
    iface=None # "h1-eth0"
    for i in get_if_list():
        if "eth0" in i:
            iface=i
            break;
    if not iface:
        print "Cannot find eth0 interface"
        exit(1)
    return iface

def main():

    if len(sys.argv)<4:
        print 'pass 2 arguments: <ip_addr> <dst_nid> "<message>"'
        exit(1)

    addr = socket.gethostbyname(sys.argv[1])
    dst_nid = int(sys.argv[2])
    iface = get_if()

    print "sending on interface %s to nid %s" % (iface, str(dst_nid))
    pkt =  Ether(src=get_if_hwaddr(iface), dst='ff:ff:ff:ff:ff:ff')
    pkt = pkt / MyEncap(dst_nid=dst_nid) / IP(dst=addr) / sys.argv[3]
    pkt.show2()
    hexdump(pkt)
    print "len(pkt) = ", len(pkt)
    sendp(pkt, iface=iface, verbose=False)


if __name__ == '__main__':
    main()

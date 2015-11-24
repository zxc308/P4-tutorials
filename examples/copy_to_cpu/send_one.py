from scapy.all import *

p = Ether(dst="00:00:00:00:00:00", src="00:00:00:00:00:00", type=0x0) / IP(dst="10.0.1.10") / TCP() / "aaaaaaaaaaaaaaaaaaa"
p.show()
hexdump(p)
sendp(p, iface = "veth1")

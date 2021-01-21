from p4app import P4Program, P4Mininet
from mininet.topo import Topo
from mininet.cli import CLI
import subprocess

N = 3

def getForwardingPort(s1, s2):
    clockwise = s2 - s1 if s2 > s1 else (N - s1) + s2
    counter_clockwise = (N - s2) + s1 if s2 > s1 else s2 - s1
    return 2 if clockwise < counter_clockwise else 3

class RingTopo(Topo):
    def __init__(self, n, **opts):
        Topo.__init__(self, **opts)

        switches = []

        for i in range(1, n+1):
            host = self.addHost('h%d' % i,
                                ip = "10.0.%d.%d" % (i, i),
                                mac = '00:00:00:00:%02x:%02x' % (i, i))
            switch = self.addSwitch('s%d' % i)
            self.addLink(host, switch, port2=1)
            switches.append(switch)

        # Port 2 connects to the next switch in the ring, and port 3 to the previous
        for i in range(n):
            self.addLink(switches[i], switches[(i+1)%n], port1=2, port2=3)

topo = RingTopo(N)
prog = P4Program('advanced_tunnel.p4')
net = P4Mininet(program=prog, topo=topo, start_controller=False)
net.start()

CLI(net)

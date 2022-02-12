
#!/usr/bin/python
from mininet.topo import Topo
from mininet.net import Mininet, Host
from mininet.node import OVSKernelSwitch, UserSwitch
from mininet.log import setLogLevel
from mininet.cli import CLI
from mininet.node import OVSSwitch, Controller, RemoteController
from mininet.link import TCLink
from time import sleep
import random

'''
                                s9
                      s7                    s8
            s1              s2          s3          s4          s5      s6
      h1      h2      h3     h4     h5   h6      h7      h8    h9 h10   h11 h12 

'''

TEST_TIME = 30 #seconds
TEST_TYPE = "manual"
#normal, attack, manual

class datacentertopo(Topo):
    "Single switch connected to 10 hosts."
    def build(self):
        s1 = self.addSwitch('s1', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s2 = self.addSwitch('s2', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s3 = self.addSwitch('s3', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s4 = self.addSwitch('s4', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s5 = self.addSwitch('s5', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s6 = self.addSwitch('s6', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s7 = self.addSwitch('s7', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s8 = self.addSwitch('s8', cls=OVSKernelSwitch, protocols='OpenFlow13')
        s9 = self.addSwitch('s9', cls=OVSKernelSwitch, protocols='OpenFlow13')
        # s1 = self.addSwitch('s1')
        # s2 = self.addSwitch('s2')
        # s3 = self.addSwitch('s3')
        # s4 = self.addSwitch('s4')
        # s5 = self.addSwitch('s5')
        # s6 = self.addSwitch('s6')
        # s7 = self.addSwitch('s7')
        h1 = self.addHost('h1', cls=Host, ip='10.0.0.2', defaultRoute="via 10.0.0.2")
        h2 = self.addHost('h2', cls=Host, ip='10.0.0.3', defaultRoute="via 10.0.0.2")
        h3 = self.addHost('h3', cls=Host, ip='10.0.1.2', defaultRoute="via 10.0.1.2")
        h4 = self.addHost('h4', cls=Host, ip='10.0.1.3', defaultRoute="via 10.0.1.2")
        h5 = self.addHost('h5', cls=Host, ip='10.1.0.2', defaultRoute="via 10.1.0.2")
        h6 = self.addHost('h6', cls=Host, ip='10.1.0.3', defaultRoute="via 10.1.0.2")
        h7 = self.addHost('h7', cls=Host, ip='10.1.1.2', defaultRoute="via 10.1.1.2")
        h8 = self.addHost('h8', cls=Host, ip='10.1.1.3', defaultRoute="via 10.1.1.2")
        h9 = self.addHost('h9', cls=Host, ip='10.2.0.2', defaultRoute="via 10.2.0.2")
        h10 = self.addHost('h10', cls=Host, ip='10.2.0.3', defaultRoute="via 10.2.0.2")
        h11 = self.addHost('h11', cls=Host, ip='10.2.1.2', defaultRoute="via 10.2.1.2")
        h12 = self.addHost('h12', cls=Host, ip='10.2.1.3', defaultRoute="via 10.2.1.2")
        self.addLink(h1, s1 ,cls = TCLink,bw=40)
        self.addLink(h2, s1 ,cls = TCLink,bw=40)
        self.addLink(h3, s2 ,cls = TCLink,bw=40)
        self.addLink(h4, s2 ,cls = TCLink,bw=40)
        self.addLink(h5, s3 ,cls = TCLink,bw=40)
        self.addLink(h6, s3 ,cls = TCLink,bw=40)
        self.addLink(h7, s4 ,cls = TCLink,bw=40)
        self.addLink(h8, s4 ,cls = TCLink,bw=40)
        self.addLink(h9, s5 ,cls = TCLink,bw=40)
        self.addLink(h10, s5 ,cls = TCLink,bw=40)
        self.addLink(h11, s6 ,cls = TCLink,bw=40)
        self.addLink(h12, s6 ,cls = TCLink,bw=40)

        # self.addLink(h16, s4, cls=TCLink, bw=5)
        #self.addLink(s4, s1, cls=TCLink, bw=5)
         #add links s1--All Switches
        self.addLink(s8, s4 ,cls = TCLink,bw=80)
        self.addLink(s8, s5 ,cls = TCLink,bw=80)
        self.addLink(s8, s6 ,cls = TCLink,bw=80)

        #addlinks s2--All Switches
        self.addLink(s7, s1 ,cls = TCLink,bw=80)
        self.addLink(s7, s2 ,cls = TCLink,bw=80)
        self.addLink(s7, s3 ,cls = TCLink,bw=80)

        #addlinks s7--All Switches
        self.addLink(s9, s7 ,cls = TCLink,bw=120)
        self.addLink(s9, s8, cls = TCLink,bw=120)

if __name__ == '__main__':
    setLogLevel('info')
    topo = datacentertopo()
    c1 = RemoteController('c1', ip='192.168.1.107')
    # c1 = RemoteController('c1', ip='127.0.0.1')
    net = Mininet(topo=topo, controller=c1)
    net.start()

    if TEST_TYPE == "normal":
        print "Generating NORMAL Traffic......."
        h1 = net.get('h1')
        cmd1 = "bash normal.sh &"
        h1.cmd(cmd1)

        h2 = net.get('h2')
        cmd1 = "bash normal.sh &"
        h2.cmd(cmd1)

        h3 = net.get('h3')
        cmd1 = "bash normal.sh &"
        h3.cmd(cmd1)

        h4 = net.get('h4')
        cmd1 = "bash normal.sh &"
        h4.cmd(cmd1)

        h5 = net.get('h5')
        cmd1 = "bash normal.sh &"
        h5.cmd(cmd1)

        h6 = net.get('h6')
        cmd1 = "bash normal.sh &"
        h6.cmd(cmd1)

        h7 = net.get('h7')
        cmd1 = "bash normal.sh &"
        h7.cmd(cmd1)

        h8 = net.get('h8')
        cmd1 = "bash normal.sh &"
        h8.cmd(cmd1)


        sleep(TEST_TIME)
        net.stop()
    elif TEST_TYPE == "attack":
        print "Generating ATTACK Traffic......."
        h1 = net.get('h1')
        cmd1 = "bash attack.sh &"
        h1.cmd(cmd1)

        sleep(TEST_TIME)
        net.stop()


    elif TEST_TYPE == "manual":
        CLI(net)
        net.stop()

      
        # CLI.do_mycmd = addh3s1
        # if Mininet == "py net.addHost('h3s1')":
        #     "py net.addLink(s1, net.get('h3s1'))"
        #     "py s1.attach('s1-eth8')"

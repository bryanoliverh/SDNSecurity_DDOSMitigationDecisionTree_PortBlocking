#!/usr/bin/python

from mininet.net import Mininet
from mininet.node import Controller, RemoteController, OVSController
from mininet.node import CPULimitedHost, Host, Node
from mininet.node import OVSKernelSwitch, UserSwitch
from mininet.node import IVSSwitch
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import TCLink, Intf
from subprocess import call

def myNetwork():

    net = Mininet( topo=None,
                   build=False,
                   ipBase='10.0.0.0/8')

    info( '*** Adding controller\n' )
    c0=net.addController(name='c0',
                      controller=Controller,
                      ip='192.168.1.107',
                      protocol='tcp',
                      port=6633)

    info( '*** Add switches\n')
    s1 = net.addSwitch('s1', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s2 = net.addSwitch('s2', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s3 = net.addSwitch('s3', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s4 = net.addSwitch('s4', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s5 = net.addSwitch('s5', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s6 = net.addSwitch('s6', cls=OVSKernelSwitch, protocols='OpenFlow13')
    s7 = net.addSwitch('s7', cls=OVSKernelSwitch, protocols='OpenFlow13')
    # s1 = net.addSwitch('s1')
    # s2 = net.addSwitch('s2')
    # s3 = net.addSwitch('s3')
    # s4 = net.addSwitch('s4')
    # s5 = net.addSwitch('s5')
    # s6 = net.addSwitch('s6')
    # s7 = net.addSwitch('s7')
    h1 = net.addHost('h1', cls=Host, ip='10.0.0.2', defaultRoute=None)
    h2 = net.addHost('h2', cls=Host, ip='10.0.0.3', defaultRoute=None)
    h3 = net.addHost('h3', cls=Host, ip='10.0.1.2', defaultRoute=None)
    h4 = net.addHost('h4', cls=Host, ip='10.0.1.3', defaultRoute=None)
    h5 = net.addHost('h5', cls=Host, ip='10.1.0.2', defaultRoute=None)
    h6 = net.addHost('h6', cls=Host, ip='10.1.0.3', defaultRoute=None)
    h7 = net.addHost('h7', cls=Host, ip='10.1.1.2', defaultRoute=None)
    h8 = net.addHost('h8', cls=Host, ip='10.1.1.3', defaultRoute=None)
    info( '*** Add links\n')
    net.addLink(h1, s1 ,cls = TCLink,bw=40)
    net.addLink(h2, s1 ,cls = TCLink,bw=40)
    net.addLink(h3, s2 ,cls = TCLink,bw=40)
    net.addLink(h4, s2 ,cls = TCLink,bw=40)
    net.addLink(h5, s3 ,cls = TCLink,bw=40)
    net.addLink(h6, s3 ,cls = TCLink,bw=40)
    net.addLink(h7, s4 ,cls = TCLink,bw=40)
    net.addLink(h8, s4 ,cls = TCLink,bw=40)

    # net.addLink(h16, s4, cls=TCLink, bw=5)
    #net.addLink(s4, s1, cls=TCLink, bw=5)
        #add links s1--All Switches
    net.addLink(s6, s3 ,cls = TCLink,bw=80)
    net.addLink(s6, s4 ,cls = TCLink,bw=80)
    net.addLink(s6, s1 ,cls = TCLink,bw=80)
    net.addLink(s6, s2 ,cls = TCLink,bw=80)

    #addlinks s2--All Switches
    net.addLink(s5, s1 ,cls = TCLink,bw=80)
    net.addLink(s5, s2 ,cls = TCLink,bw=80)
    net.addLink(s5, s3 ,cls = TCLink,bw=80)
    net.addLink(s5, s4 ,cls = TCLink,bw=80)

    #addlinks s7--All Switches
    net.addLink(s7, s1 ,cls = TCLink,bw=80)
    net.addLink(s7, s2, cls = TCLink,bw=80)
    net.addLink(s7, s3 ,cls = TCLink,bw=80)
    net.addLink(s7, s4, cls = TCLink,bw=80)

    info( '*** Starting network\n')
    net.build()
    info( '*** Starting controllers\n')
    for controller in net.controllers:
        controller.start()

    info( '*** Starting switches\n')

    net.get('s2').start([c0])
    net.get('s3').start([c0])
    net.get('s5').start([c0])
    net.get('s6').start([c0])
    net.get('s1').start([c0])
    net.get('s7').start([c0])
    net.get('s4').start([c0])

    info( '*** Post configure switches and hosts\n')
    s1.cmd('ifconfig s1 10.0.0.1')
    s2.cmd('ifconfig s2 10.0.1.1')
    s3.cmd('ifconfig s3 10.1.0.1')
    s4.cmd('ifconfig s4 10.1.1.1')
    s5.cmd('ifconfig s5 10.2.0.1')
    s6.cmd('ifconfig s6 10.2.1.1')
    s7.cmd('ifconfig s7 10.3.0.1')

    CLI(net)
    net.stop()

if __name__ == '__main__':
    setLogLevel( 'info' )
    myNetwork()
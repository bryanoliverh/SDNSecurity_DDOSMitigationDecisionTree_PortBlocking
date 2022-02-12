

py net.addHost('h13s5')
py net.addLink(s5, net.get('h13s5'))
py s5.attach('s5-eth12')
py net.get('h13s5').cmd('ifconfig h13s5-eth0 10.2.0.4')
s5 ovs-ofctl1.3 add-flow "s5" in_port=12,actions:output=1 
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=2 
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=3
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=4  
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=5  
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=6
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=7
s5 ovs-ofctl add-flow "s5" in_port=12,actions:output=8








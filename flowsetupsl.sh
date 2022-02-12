#!/bin/bash

# sudo ovs-ofctl add-flow s17 arp,in_port=1,actions=output:2
# sudo ovs-ofctl add-flow s17 arp,in_port=2,actions=output:1
# sudo ovs-ofctl add-flow s18 arp,in_port=3,actions=output:4
# sudo ovs-ofctl add-flow s18 arp,in_port=4,actions=output:3
# sudo ovs-ofctl add-flow s19 arp,in_port=1,actions=output:3
# sudo ovs-ofctl add-flow s19 arp,in_port=3,actions=output:1
# sudo ovs-ofctl add-flow s20 arp,in_port=2,actions=output:4
# sudo ovs-ofctl add-flow s20 arp,in_port=4,actions=output:2
sudo ovs-ofctl -O OpenFlow13 add-flow s1 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s1 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s1 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s1 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s1 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s2 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s2 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s2 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s2 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s2 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s3 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s3 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s3 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s3 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s3 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s4 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s4 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s4 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s4 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s4 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s5 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s5 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s5 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s5 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s5 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s6 arp,in_port=1,actions=output:2,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s6 arp,in_port=2,actions=output:1,3,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s6 arp,in_port=3,actions=output:1,2,4,5
sudo ovs-ofctl -O OpenFlow13 add-flow s6 arp,in_port=4,actions=output:1,2,3,5
sudo ovs-ofctl -O OpenFlow13 add-flow s6 arp,in_port=5,actions=output:1,2,3,4

sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=1,actions=output:2,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=2,actions=output:1,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=3,actions=output:1,2,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=4,actions=output:1,2,3,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=5,actions=output:1,2,3,4,6
sudo ovs-ofctl -O OpenFlow13 add-flow s7 arp,in_port=6,actions=output:1,2,3,4,5


sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=1,actions=output:2,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=2,actions=output:1,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=3,actions=output:1,2,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=4,actions=output:1,2,3,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=5,actions=output:1,2,3,4,6
sudo ovs-ofctl -O OpenFlow13 add-flow s8 arp,in_port=6,actions=output:1,2,3,4,5


sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=1,actions=output:2,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=2,actions=output:1,3,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=3,actions=output:1,2,4,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=4,actions=output:1,2,3,5,6
sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=5,actions=output:1,2,3,4,6
sudo ovs-ofctl -O OpenFlow13 add-flow s9 arp,in_port=6,actions=output:1,2,3,4,5


#diatas dimasukin di mininet buat bisa stp



# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s1 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s2 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13  add-flow s2 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl -O OpenFlow13 add-flow s3 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s5 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s5 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s6 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s6 ip,nw_src=10.1.1.2/32,actions=output:3

# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.0.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.0.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.0.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.0.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.1.0.2/32,actions=output:1
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.1.0.3/32,actions=output:2
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.1.1.2/32,actions=output:1
# sudo ovs-ofctl add-flow s7 ip,nw_dst=10.1.1.3/32,actions=output:2
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.0.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.0.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.0.1.2/32,actions=output:3
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.0.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.1.0.2/32,actions=output:3
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.1.0.3/32,actions=output:4
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.1.1.3/32,actions=output:4
# sudo ovs-ofctl add-flow s7 ip,nw_src=10.1.1.2/32,actions=output:3

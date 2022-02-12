#!/bin/bash

sudo ovs-ofctl add-flow s17 arp,in_port=1,actions=output:2
sudo ovs-ofctl add-flow s17 arp,in_port=2,actions=output:1
sudo ovs-ofctl add-flow s18 arp,in_port=3,actions=output:4
sudo ovs-ofctl add-flow s18 arp,in_port=4,actions=output:3
sudo ovs-ofctl add-flow s19 arp,in_port=1,actions=output:3
sudo ovs-ofctl add-flow s19 arp,in_port=3,actions=output:1
sudo ovs-ofctl add-flow s20 arp,in_port=2,actions=output:4
sudo ovs-ofctl add-flow s20 arp,in_port=4,actions=output:2

sudo ovs-ofctl add-flow s1 arp,in_port=1,actions=output:2,3,4
sudo ovs-ofctl add-flow s1 arp,in_port=2,actions=output:1,3,4
sudo ovs-ofctl add-flow s1 arp,in_port=3,actions=output:1,2,4
sudo ovs-ofctl add-flow s1 arp,in_port=4,actions=output:1,2,3

sudo ovs-ofctl add-flow s2 arp,in_port=1,actions=output:2,4
sudo ovs-ofctl add-flow s2 arp,in_port=2,actions=output:1,4
sudo ovs-ofctl add-flow s2 arp,in_port=4,actions=output:1,2

sudo ovs-ofctl add-flow s3 arp,in_port=1,actions=output:2,3
sudo ovs-ofctl add-flow s3 arp,in_port=2,actions=output:1,3
sudo ovs-ofctl add-flow s3 arp,in_port=3,actions=output:1,2

sudo ovs-ofctl add-flow s4 arp,in_port=1,actions=output:2,3,4
sudo ovs-ofctl add-flow s4 arp,in_port=2,actions=output:1,3,4
sudo ovs-ofctl add-flow s4 arp,in_port=3,actions=output:1,2,4
sudo ovs-ofctl add-flow s4 arp,in_port=4,actions=output:1,2,3

sudo ovs-ofctl add-flow s5 arp,in_port=1,actions=output:2,3,4
sudo ovs-ofctl add-flow s5 arp,in_port=2,actions=output:1,3,4
sudo ovs-ofctl add-flow s5 arp,in_port=3,actions=output:1,2,4
sudo ovs-ofctl add-flow s5 arp,in_port=4,actions=output:1,2,3

sudo ovs-ofctl add-flow s6 arp,in_port=1,actions=output:2,4
sudo ovs-ofctl add-flow s6 arp,in_port=2,actions=output:1,4
sudo ovs-ofctl add-flow s6 arp,in_port=4,actions=output:1,2

sudo ovs-ofctl add-flow s7 arp,in_port=1,actions=output:2,3
sudo ovs-ofctl add-flow s7 arp,in_port=2,actions=output:1,3
sudo ovs-ofctl add-flow s7 arp,in_port=3,actions=output:1,2

sudo ovs-ofctl add-flow s8 arp,in_port=1,actions=output:2,4
sudo ovs-ofctl add-flow s8 arp,in_port=2,actions=output:1,4
sudo ovs-ofctl add-flow s8 arp,in_port=4,actions=output:1,2

sudo ovs-ofctl add-flow s9 arp,in_port=1,actions=output:3
sudo ovs-ofctl add-flow s9 arp,in_port=3,actions=output:1

sudo ovs-ofctl add-flow s10 arp,in_port=1,actions=output:2,3
sudo ovs-ofctl add-flow s10 arp,in_port=2,actions=output:1,3
sudo ovs-ofctl add-flow s10 arp,in_port=3,actions=output:1,2

sudo ovs-ofctl add-flow s11 arp,in_port=1,actions=output:2,3
sudo ovs-ofctl add-flow s11 arp,in_port=2,actions=output:1,3
sudo ovs-ofctl add-flow s11 arp,in_port=3,actions=output:1,2

sudo ovs-ofctl add-flow s12 arp,in_port=2,actions=output:4
sudo ovs-ofctl add-flow s12 arp,in_port=4,actions=output:2

sudo ovs-ofctl add-flow s13 arp,in_port=1,actions=output:4
sudo ovs-ofctl add-flow s13 arp,in_port=4,actions=output:1

sudo ovs-ofctl add-flow s14 arp,in_port=1,actions=output:2,3
sudo ovs-ofctl add-flow s14 arp,in_port=2,actions=output:1,3
sudo ovs-ofctl add-flow s14 arp,in_port=3,actions=output:1,2

sudo ovs-ofctl add-flow s15 arp,in_port=1,actions=output:4
sudo ovs-ofctl add-flow s15 arp,in_port=4,actions=output:1

sudo ovs-ofctl add-flow s16 arp,in_port=2,actions=output:4
sudo ovs-ofctl add-flow s16 arp,in_port=4,actions=output:2

sudo ovs-ofctl add-flow s1 ip,nw_dst=10.0.0.2/32,actions=output:1
sudo ovs-ofctl add-flow s1 ip,nw_dst=10.0.0.3/32,actions=output:2
sudo ovs-ofctl add-flow s1 ip,nw_src=10.0.0.2/32,actions=output:3
sudo ovs-ofctl add-flow s1 ip,nw_src=10.0.0.3/32,actions=output:4

sudo ovs-ofctl add-flow s2 ip,nw_dst=10.0.1.2/32,actions=output:1
sudo ovs-ofctl add-flow s2 ip,nw_dst=10.0.1.3/32,actions=output:2
sudo ovs-ofctl add-flow s2 ip,nw_src=10.0.1.2/32,actions=output:4
sudo ovs-ofctl add-flow s2 ip,nw_src=10.0.1.3/32,actions=output:3

sudo ovs-ofctl add-flow s3 ip,nw_dst=10.1.0.2/32,actions=output:1
sudo ovs-ofctl add-flow s3 ip,nw_dst=10.1.0.3/32,actions=output:2
sudo ovs-ofctl add-flow s3 ip,nw_src=10.1.0.2/32,actions=output:3
sudo ovs-ofctl add-flow s3 ip,nw_src=10.1.0.3/32,actions=output:4

sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.1.2/32,actions=output:1
sudo ovs-ofctl add-flow s4 ip,nw_dst=10.1.1.3/32,actions=output:2
sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.1.2/32,actions=output:4
sudo ovs-ofctl add-flow s4 ip,nw_src=10.1.1.3/32,actions=output:3

sudo ovs-ofctl add-flow s5 ip,nw_dst=10.2.0.2/32,actions=output:1
sudo ovs-ofctl add-flow s5 ip,nw_dst=10.2.0.3/32,actions=output:2
sudo ovs-ofctl add-flow s5 ip,nw_src=10.2.0.2/32,actions=output:3
sudo ovs-ofctl add-flow s5 ip,nw_src=10.2.0.3/32,actions=output:4

sudo ovs-ofctl add-flow s6 ip,nw_dst=10.2.1.2/32,actions=output:1
sudo ovs-ofctl add-flow s6 ip,nw_dst=10.2.1.3/32,actions=output:2
sudo ovs-ofctl add-flow s6 ip,nw_src=10.2.1.2/32,actions=output:4
sudo ovs-ofctl add-flow s6 ip,nw_src=10.2.1.3/32,actions=output:3

sudo ovs-ofctl add-flow s7 ip,nw_dst=10.3.0.2/32,actions=output:1
sudo ovs-ofctl add-flow s7 ip,nw_dst=10.3.0.3/32,actions=output:2
sudo ovs-ofctl add-flow s7 ip,nw_src=10.3.0.2/32,actions=output:3
sudo ovs-ofctl add-flow s7 ip,nw_src=10.3.0.3/32,actions=output:4

sudo ovs-ofctl add-flow s8 ip,nw_dst=10.3.1.2/32,actions=output:1
sudo ovs-ofctl add-flow s8 ip,nw_dst=10.3.1.3/32,actions=output:2
sudo ovs-ofctl add-flow s8 ip,nw_src=10.3.1.2/32,actions=output:4
sudo ovs-ofctl add-flow s8 ip,nw_src=10.3.1.3/32,actions=output:3

sudo ovs-ofctl add-flow s9 priority=900,ip,nw_dst=10.0.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s9 priority=900,ip,nw_dst=10.0.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s9 priority=800,ip,nw_src=10.0.0.0/24,actions=output:3
sudo ovs-ofctl add-flow s9 priority=800,ip,nw_src=10.0.1.0/24,actions=output:4

sudo ovs-ofctl add-flow s10 priority=900,ip,nw_dst=10.0.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s10 priority=900,ip,nw_dst=10.0.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s10 priority=800,ip,nw_src=10.0.0.0/24,actions=output:4
sudo ovs-ofctl add-flow s10 priority=800,ip,nw_src=10.0.1.0/24,actions=output:3

sudo ovs-ofctl add-flow s11 priority=900,ip,nw_dst=10.1.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s11 priority=900,ip,nw_dst=10.1.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s11 priority=800,ip,nw_src=10.1.0.0/24,actions=output:3
sudo ovs-ofctl add-flow s11 priority=800,ip,nw_src=10.1.1.0/24,actions=output:4

sudo ovs-ofctl add-flow s12 priority=900,ip,nw_dst=10.1.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s12 priority=900,ip,nw_dst=10.1.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s12 priority=800,ip,nw_src=10.1.0.0/24,actions=output:4
sudo ovs-ofctl add-flow s12 priority=800,ip,nw_src=10.1.1.0/24,actions=output:3

sudo ovs-ofctl add-flow s13 priority=900,ip,nw_dst=10.2.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s13 priority=900,ip,nw_dst=10.2.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s13 priority=800,ip,nw_src=10.2.0.0/24,actions=output:3
sudo ovs-ofctl add-flow s13 priority=800,ip,nw_src=10.2.1.0/24,actions=output:4

sudo ovs-ofctl add-flow s14 priority=900,ip,nw_dst=10.2.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s14 priority=900,ip,nw_dst=10.2.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s14 priority=800,ip,nw_src=10.2.0.0/24,actions=output:4
sudo ovs-ofctl add-flow s14 priority=800,ip,nw_src=10.2.1.0/24,actions=output:3

sudo ovs-ofctl add-flow s15 priority=900,ip,nw_dst=10.3.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s15 priority=900,ip,nw_dst=10.3.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s15 priority=800,ip,nw_src=10.3.0.0/24,actions=output:3
sudo ovs-ofctl add-flow s15 priority=800,ip,nw_src=10.3.1.0/24,actions=output:4

sudo ovs-ofctl add-flow s16 priority=900,ip,nw_dst=10.3.0.0/24,actions=output:1
sudo ovs-ofctl add-flow s16 priority=900,ip,nw_dst=10.3.1.0/24,actions=output:2
sudo ovs-ofctl add-flow s16 priority=800,ip,nw_src=10.3.0.0/24,actions=output:4
sudo ovs-ofctl add-flow s16 priority=800,ip,nw_src=10.3.1.0/24,actions=output:3

sudo ovs-ofctl add-flow s17 ip,nw_dst=10.0.0.0/16,actions=output:1
sudo ovs-ofctl add-flow s17 ip,nw_dst=10.1.0.0/16,actions=output:2
sudo ovs-ofctl add-flow s17 ip,nw_dst=10.2.0.0/16,actions=output:3
sudo ovs-ofctl add-flow s17 ip,nw_dst=10.3.0.0/16,actions=output:4

sudo ovs-ofctl add-flow s18 ip,nw_dst=10.0.0.0/16,actions=output:1
sudo ovs-ofctl add-flow s18 ip,nw_dst=10.1.0.0/16,actions=output:2
sudo ovs-ofctl add-flow s18 ip,nw_dst=10.2.0.0/16,actions=output:3
sudo ovs-ofctl add-flow s18 ip,nw_dst=10.3.0.0/16,actions=output:4

sudo ovs-ofctl add-flow s19 ip,nw_dst=10.0.0.0/16,actions=output:1
sudo ovs-ofctl add-flow s19 ip,nw_dst=10.1.0.0/16,actions=output:2
sudo ovs-ofctl add-flow s19 ip,nw_dst=10.2.0.0/16,actions=output:3
sudo ovs-ofctl add-flow s19 ip,nw_dst=10.3.0.0/16,actions=output:4

sudo ovs-ofctl add-flow s20 ip,nw_dst=10.0.0.0/16,actions=output:1
sudo ovs-ofctl add-flow s20 ip,nw_dst=10.1.0.0/16,actions=output:2
sudo ovs-ofctl add-flow s20 ip,nw_dst=10.2.0.0/16,actions=output:3
sudo ovs-ofctl add-flow s20 ip,nw_dst=10.3.0.0/16,actions=output:4
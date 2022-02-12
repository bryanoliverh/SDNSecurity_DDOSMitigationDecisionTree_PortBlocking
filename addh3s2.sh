
#source addh3s2.sh
py net.addHost('h3s1')
py net.addLink(s1, net.get('h3s1'))
py s1.attach('s1-eth8')
py net.get('h3s1').cmd('ifconfig h3s1-eth0 10.0.0.4')





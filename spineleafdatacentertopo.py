from mininet.net import Mininet
from mininet.node import  Controller,OVSKernelSwitch,RemoteController
from mininet.cli import CLI
from mininet.log import setLogLevel, info
from mininet.link import Link, Intf, TCLink
from mininet.topo import Topo
from mininet.util import irange,dumpNodeConnections
import logging
import os


logger = logging.getLogger( __name__ )

class LinearTopo(Topo):
	logger.info("Class HugeTopo")
	CoreSwitchList = []
	AggSwitchList = []
	EdgeSwitchList = []
	HostList = []
	KNumber = 0


	def __init__(self, k, **opts):
		super(LinearTopo, self).__init__(**opts)
		self.k = k
		self.iCoreLayerSwitch = (k/2)**2
    		self.iAggLayerSwitch = (k**2)/2
    		self.iEdgeLayerSwitch = (k**2)/2
    		self.iHost = (k**3)/4
		lastSwitch = None

	def createTopo(self):

			logger.info("Start create Core Layer Swich")
			self.createCoreLayerSwitch(self.iCoreLayerSwitch)
		 	logger.debug("Start create Agg Layer Swich ")
			self.createAggLayerSwitch(self.iAggLayerSwitch)
			logger.debug("Start create Edge Layer Swich ")
			self.createEdgeLayerSwitch(self.iEdgeLayerSwitch)
			logger.debug("Start create Host")
			self.createHost(self.iHost)


	def createCoreLayerSwitch(self,NUMBER):
		logger.info("Create Core Layer")
		k1=NUMBER
		Coreid=[]
		for i in irange(1,k1/2):
			k2=1
			while k2<((k1/2)+1):
				print '000000000'+'%s'%k1+'0'+'%s'%i+'0'+'%s'%k2
				Coreid.append('000000000'+'%s'%k1+'0'+'%s'%i+'0'+'%s'%k2)
				k2=k2+1
		for i in irange(1,NUMBER):
			self.CoreSwitchList.append(self.addSwitch('CS%s' % i,dpid=Coreid[i-1],listenport=6633,protcols=["OpenFlow13"],Controller=RemoteController))
		print self.CoreSwitchList[0]


	def createAggLayerSwitch(self,NUMBER):
		logger.info("Create Agg Layer")
		k1=NUMBER/2
		Aggid=[]
		for i1 in range(0,k1):
			k2=((k1/2)+1)
			while k2<(k1+1):
				print '00000000000'+'%s'%i1+'0'+'%s'%k2+'01'
				Aggid.append('00000000000'+'%s'%i1+'0'+'%s'%k2+'01')
				k2=k2+1
  		for i in irange(1,NUMBER):
			self.AggSwitchList.append(self.addSwitch('AS%s' % (i),dpid=Aggid[i-1],listenport=6633,protcols=["OpenFlow13"],controller=RemoteController))
			print ('AS%s',i)
		print Aggid

	def createEdgeLayerSwitch(self,NUMBER):
		logger.info("Create Edge Layer")
		k1=NUMBER/2
		Eggid=[]
		for i1 in range(0,k1):
			k2=1
			while k2<((k1/2)+1):
				print '00000000000'+'%s'%i1+'0'+'%s'%k2+'01'
				Eggid.append('00000000000'+'%s'%i1+'0'+'%s'%k2+'01')
				k2=k2+1
  		for i in irange(1,NUMBER):
			self.EdgeSwitchList.append(self.addSwitch('ES%s' % (i),dpid=Eggid[i-1],listenport=6633,protcols=["OpenFlow13"],controller=RemoteController))
			print ('ES%s',i)
		print Eggid

	def createHost(self,NUMBER):
		logger.info("Create Hosts")
		Host=[]
		k1=NUMBER/4
		for i in range(0,k1):
			k3=0
			while k3<(k1/2):
				k2=0
				while(k2<(k1/2)):
					print i,k2
					Host.append('10.'+'%s'%i+'.'+'%s.'%k3+'%s'%((k1/2)+k2))
					k2=k2+1
				k3=k3+1

  		for i in irange(1,NUMBER):
			self.HostList.append(self.addHost('Host%s'%i))

		print Host

	def createLink(self):
		logger.info("Start creating Links")
		logger.info("Creating Core to Agg Layer links")
		k = self.k
		#for i in range(0,(2*(k/2)),(k/2)):
		#	for j in range(0,(k/2)):

		k1=0
		m=0
		k3=0
		while k1<(k/2):
			k4=(0)
			for i in range(k1,((k/2)*k),(k/2)):
				k2=0
				while k2<(k/2):
					print k2+m,i,k4+1,(k/2)-1-k2+1
					self.addLink(self.CoreSwitchList[k2+m],self.AggSwitchList[i],k4+1,(k/2)-1-k2+1)
					k2=k2+1
				k4=k4+1
			k3=k3+(k/2)
			m=k2
			k1=k1+1
		for i in range(0,((k/2)*k),(k/2)):
			m1=((k/2)-1)
			for j in range(0,(k/2)):
				k1=0
				while(k1<(k/2)):
					print ((k/2)+k1+1),m1+1
					self.addLink(self.AggSwitchList[j+i],self.EdgeSwitchList[k1+i],((k/2)+k1+1),m1+1)
					k1=k1+1
				m1=m1-1

		m=0
		for i in range(0,((k/2)*k)):
			k1=0
			while k1<(k/2):
				self.addLink(self.EdgeSwitchList[i],self.HostList[m],port1=(((k/2)+k1)+1),port2=1)
				print self.EdgeSwitchList[i],self.HostList[m]
				k1=k1+1
				m=m+1

def simpleTest():
	topo = LinearTopo(k=4)
	topo.createTopo()
	topo.createLink()
	#use=LinearTopo.DPIDS(4)
	net = Mininet(topo, link=TCLink,controller=None,autoSetMacs=True,autoStaticArp=True)
	ryu_ctrl=RemoteController(name='c1',ip='192.168.1.107',port=6633,protocols="OpenFlow13")
	net.addController(ryu_ctrl)
	print "addcontroller"
	#net.get('ES1').start([ryu_ctrl])
	net.start()
	net.staticArp()
	#net.cli()
	dumpNodeConnections(net.hosts)
	CLI(net)
	net.stop()


if __name__ == '__main__':
	setLogLevel('info')
	simpleTest()
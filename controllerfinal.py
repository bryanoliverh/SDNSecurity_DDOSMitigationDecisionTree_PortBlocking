from ryu.base import app_manager
from ryu.controller import ofp_event
from ryu.controller.handler import CONFIG_DISPATCHER, MAIN_DISPATCHER
from ryu.controller.handler import set_ev_cls
from ryu.ofproto import ofproto_v1_3
from ryu.lib.packet import packet
from ryu.lib.packet import ethernet
from ryu.lib.packet import ether_types

from ryu.lib.packet import in_proto
from ryu.lib.packet import ipv4
from ryu.lib.packet import icmp
from ryu.lib.packet import tcp
from ryu.lib.packet import udp
from ryu.lib.packet import arp

from ryu.lib import hub
import csv
import time
import math
import statistics

from svm import SVM

detect = 1
mitigate = 1
collectorType = 0
timeIntrv = 2
globalFlows = []
pastSSIPLenght = 0
prevFlowCount = 0

flowSerialNo = 0
iterate = 0

#Bryan Oliver - Network Security Detector and Mitigator Controller


def getFlowNumb():
    global flowSerialNo
    flowSerialNo = flowSerialNo + 1
    return flowSerialNo


def initCsv_Port(dpid):
    fname = "switch_" + str(dpid) + "_data.csv"
    writ = csv.writer(open(fname, 'a', buffering=1), delimiter=',')
    header = ["time", "sfe","ssip","rfip","type"]
    writ.writerow(header)


def initCsv_FlowCount(dpid):
    fname = "switch_" + str(dpid) + "_flowcount.csv"
    writ = csv.writer(open(fname, 'a', buffering=1), delimiter=',')
    header = ["time", "flowcount"]
    writ.writerow(header)



def update_flowcountcsv(dpid, row):
    fname = "switch_" + str(dpid) + "_flowcount.csv"
    writ = csv.writer(open(fname, 'a', buffering=1), delimiter=',')
    writ.writerow(row)


def updateCsv_Port(dpid, row):
    fname = "sw_" + str(dpid) + "_data.csv"
    writ = csv.writer(open(fname, 'a', buffering=1), delimiter=',')
    row.append(str(collectorType))
    writ.writerow(row)


def updateCsv_resData(row):
    fname = "resData.csv"
    writ = csv.writer(open(fname, 'a', buffering=1), delimiter=',')
    row.append(str(collectorType))
    writ.writerow(row)





class SimpleSwitch13(app_manager.RyuApp):
    OFP_VERSIONS = [ofproto_v1_3.OFP_VERSION]

    def __init__(self, *args, **kwargs):
        super(SimpleSwitch13, self).__init__(*args, **kwargs)
        self.macToPort = {}
        self.flow_thread = hub.spawn(self.flowMonitor)
        self.datapaths = {}
        self.mitigation = 0
        self.svmobj = None
        self.arpIpToPort = {}

        if detect == 1:
            self.svmobj = SVM()

    def flowMonitor(self):
        hub.sleep(5)
        while True:
            for dp in self.datapaths.values():
                self.reqFlowMetric(dp)
            hub.sleep(timeIntrv)

    @set_ev_cls(ofp_event.EventOFPSwitchFeatures, CONFIG_DISPATCHER)
    def switchFeaturesHandler(self, ev):
        datapath = ev.msg.datapath
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser
        self.datapaths[datapath.id] = datapath
        flowSerialNo = getFlowNumb()

        match = parser.OFPMatch()
        actions = [parser.OFPActionOutput(ofproto.OFPP_CONTROLLER,
                                          ofproto.OFPCML_NO_BUFFER)]
        self.addFlows(datapath, 0, match, actions, flowSerialNo)

        initCsv_Port(datapath.id)
        initCsv_FlowCount(datapath.id)

    def reqFlowMetric(self, datapath):
        ofp = datapath.ofproto
        ofp_parser = datapath.ofproto_parser
        req = ofp_parser.OFPFlowStatsRequest(datapath)
        datapath.send_msg(req)


    def speedFlowEntry(self, flows):
        global prevFlowCount
        curr_flowCount = 0
        for flow in flows:
            curr_flowCount += 1

        #print "speed of flow entries ", flowCount
        sfe = curr_flowCount - prevFlowCount
        prevFlowCount = curr_flowCount
        return sfe


    def speedofSourceIP(self, flows):
        global pastSSIPLenght
        ssip = []
        #print "length of flow table " ,len(flows)
        for flow in flows:
            m = {}
            for i in flow.match.items():
                key = list(i)[0]  # match key
                val = list(i)[1]  # match value
                if key == "ipv4_src":
                 
                    if val not in ssip:
                        ssip.append(val)
        cur_ssip_len = len(ssip)
        ssip_result = cur_ssip_len - pastSSIPLenght
        pastSSIPLenght = cur_ssip_len
        return ssip_result


    def _ratio_of_flowpair(self, flows):
        flowCount = 0
        for flow in flows:
            flowCount += 1
        flowCount -= 1

        collaborative_flows = {}
        for flow in flows:
            m = {}
            srcip = dstip = None
            for i in flow.match.items():
                key = list(i)[0]  # match key
                val = list(i)[1]  # match value
                if key == "ipv4_src":
                    srcip = val
                    #print key,val
                if key == "ipv4_dst":
                    dstip = val
            if srcip and dstip:
                fwdflowhash = srcip + "_" + dstip
                revflowhash = dstip + "_" + srcip
                #check flowhash is already exist
                if not fwdflowhash in collaborative_flows:
                    #check you have reverse flowhash exists?
                    if not revflowhash in collaborative_flows:
                        collaborative_flows[fwdflowhash] = {}
                    else:
                        collaborative_flows[revflowhash][fwdflowhash] = 1
        #identify number of collaborative flows
        onesideflow = iflow = 0
        for key in collaborative_flows:
            if collaborative_flows[key] == {}:
                onesideflow += 1
            else:
                iflow +=2
        #print "collaborative_flows", collaborative_flows
        #print "oneside flow", onesideflow
        #print "collaborative flow ", iflow
        if flowCount != 0 :
            rfip = float(iflow) / flowCount
            #print "rfip ", rfip
            return rfip
        return 1.0

    @set_ev_cls([ofp_event.EventOFPFlowStatsReply], MAIN_DISPATCHER)
    def flowstatsReplyHandler(self, ev):
        global globalFlows, iterate
        t_flows = ev.msg.body
        flags = ev.msg.flags
        dpid = ev.msg.datapath.id
        globalFlows.extend(t_flows)

        if flags == 0:
            sfe  = self.speedFlowEntry(globalFlows)
            ssip = self.speedofSourceIP(globalFlows)
            rfip = self._ratio_of_flowpair(globalFlows)

            if detect == 1:
                result = self.svmobj.classify([sfe,ssip,rfip])
                #print "Attack result ", result
                if  '1' in result:
                    print("Status : Attack Traffic Detected")
                    self.mitigation = 1
                    if mitigate == 1 :
                        print("Status : Starting Mitigation")

                if '0' in result:
                    print("Status : Normal Traffic")

            else:
                t = time.strftime("%m/%d/%Y, %H:%M:%S", time.localtime())
                row = [t, str(sfe), str(ssip), str(rfip)]
                self.logger.info(row)

                updateCsv_Port(dpid, row)
                updateCsv_resData([str(sfe), str(ssip), str(rfip)])
            globalFlows = []


            t = time.strftime("%m/%d/%Y, %H:%M:%S", time.localtime())
            update_flowcountcsv(dpid, [t, str(prevFlowCount)])

    def addFlows(self, datapath, priority, match, actions,serial_no, buffer_id=None, idletime=0, hardtime=0):
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser

        inst = [parser.OFPInstructionActions(ofproto.OFPIT_APPLY_ACTIONS,
                                             actions)]
        if buffer_id:
            mod = parser.OFPFlowMod(datapath=datapath, cookie=serial_no, buffer_id=buffer_id,
                                    idle_timeout=idletime, hard_timeout=hardtime,
                                    priority=priority, match=match,
                                    instructions=inst)
        else:
            mod = parser.OFPFlowMod(datapath=datapath, cookie=serial_no, priority=priority,
                                    idle_timeout=idletime, hard_timeout=hardtime,
                                    match=match, instructions=inst)
        datapath.send_msg(mod)


    def blockPort(self, datapath, portnumber):
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser
        match = parser.OFPMatch(in_port=portnumber)
        actions = []
        flowSerialNo = getFlowNumb()
        self.addFlows(datapath, 100, match, actions, flowSerialNo, hardtime=120)

    @set_ev_cls(ofp_event.EventOFPPacketIn, MAIN_DISPATCHER)
    def packetinHandler(self, ev):
        if ev.msg.msg_len < ev.msg.total_len:
            self.logger.debug("packet truncated: only %s of %s bytes",
                              ev.msg.msg_len, ev.msg.total_len)
        msg = ev.msg
        datapath = msg.datapath
        ofproto = datapath.ofproto
        parser = datapath.ofproto_parser
        in_port = msg.match['in_port']

        pkt = packet.Packet(msg.data)
        eth = pkt.get_protocols(ethernet.ethernet)[0]

        if eth.ethertype == ether_types.ETH_TYPE_LLDP:

            return
        dst = eth.dst
        src = eth.src
        dpid = datapath.id
        self.macToPort.setdefault(dpid, {})
        self.arpIpToPort.setdefault(dpid, {})
        self.arpIpToPort[dpid].setdefault(in_port, [])
        self.logger.info("packet in Switch : %s SrcMAC : %s DstMAC : %s  Switch Port : %s", dpid, src, dst, in_port)
        
        
        self.macToPort[dpid][src] = in_port

        if dst in self.macToPort[dpid]:
            out_port = self.macToPort[dpid][dst]
        else:
            out_port = ofproto.OFPP_FLOOD

        actions = [parser.OFPActionOutput(out_port)]
        if eth.ethertype == ether_types.ETH_TYPE_ARP:
            self.logger.info("Received ARP Packet from Switch: %s SrcMac : %s DstMac: %s ", dpid, src, dst)
            a = pkt.get_protocol(arp.arp)
            #print "arp packet ", a
            if a.opcode == arp.ARP_REQUEST or a.opcode == arp.ARP_REPLY:
                if not a.src_ip in self.arpIpToPort[dpid][in_port]:
                    self.arpIpToPort[dpid][in_port].append(a.src_ip)
                    #print "arpIpToPort " ,self.arpIpToPort
        if out_port != ofproto.OFPP_FLOOD:
            if eth.ethertype == ether_types.ETH_TYPE_IP:
                ip = pkt.get_protocol(ipv4.ipv4)
                srcip = ip.src
                dstip = ip.dst
                protocol = ip.proto
                print("Source :", ip)

                if self.mitigation and mitigate:
                    if not (srcip in self.arpIpToPort[dpid][in_port]):
                        self.logger.info("Attack Detected from Switch: %s SwitchPort %s   ", dpid, in_port)
                        print("Port Blocking on Port: ", in_port)
                        self.blockPort(datapath, in_port)
                        print("Attacker Source :", ip)
                        return
                match = parser.OFPMatch(eth_type=ether_types.ETH_TYPE_IP, ipv4_src=srcip, ipv4_dst=dstip)

                flowSerialNo = getFlowNumb()
                if msg.buffer_id != ofproto.OFP_NO_BUFFER:
                    self.addFlows(datapath, 1, match, actions, flowSerialNo,  buffer_id=msg.buffer_id)
                    return
                else:
                    self.addFlows(datapath, 1, match, actions, flowSerialNo)
        data = None
        if msg.buffer_id == ofproto.OFP_NO_BUFFER:
            data = msg.data

        out = parser.OFPPacketOut(datapath=datapath, buffer_id=msg.buffer_id,
                                  in_port=in_port, actions=actions, data=data)
        datapath.send_msg(out)

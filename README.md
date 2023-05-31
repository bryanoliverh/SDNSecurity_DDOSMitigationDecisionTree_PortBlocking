# SDNSecurity_DDOSMitigationDecisionTree_PortBlocking
**DDOS Mitigation System based on Ryu SDN Controller with Port Blocking Mechanism**
**This is a thesis project that creates a DDoS Mitigation System inside the Ryu SDN Controller. The specification is as follows:**
1. The controller is using the Machine Learning Classification Decision Tree Model.
2. The machine learning model is being used to train the controller to determine whether a network packet is considered a DDoS attack or not.
3. The controller then will be able to detect the packet using the detection mechanism and mitigate the attack by doing a port blocking the attacker port.
4. The controller has been tested on multiple data center topologies (Three Tier, Leaf-Spine, etc) with the multiple number of nodes selection with most of the switches being used being OpenFlow Switch 1.3.
5. There is an application layer that was made to keep the monitoring of the eaeachf the node inside https://github.com/bryanoliverh/SDNSecurity_RyuControllerApplicationLayer.
6. The application layer functions to manually enable/disable ports, create whitelist/blacklist firewall rules, check the packet forwarding, block specific ports from the network devices, check the condition via the monitoring graphs, and so on.

**Simulation**

Normal Traffic detection: https://youtu.be/l3U2RKbh_E4
Attack Traffic detection: https://youtu.be/wmVMV7yVDJU
**Topology Example:**


**Three Tier Data Center:**



<img width="580" alt="image" src="https://user-images.githubusercontent.com/74172600/220833702-12118189-d3c9-4625-9e56-08808c9f6f87.png">




**Spine Leaf Data Center:**



<img width="652" alt="image" src="https://user-images.githubusercontent.com/74172600/220833759-78b071fb-4165-4ce5-af55-6286d72cd7e9.png">

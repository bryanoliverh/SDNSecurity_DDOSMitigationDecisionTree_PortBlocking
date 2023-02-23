# SDNSecurity_DDOSMitigationDecisionTree_PortBlocking
DDOS Mitigation System based on Ryu SDN Controller with Port Blocking Mechanism

This is a thesis project that creates a DDOS Mitigation System inside the Ryu SDN Controller. The specification is as follows:
1. The controller is using the Machine Learning Classification Decision Tree Model.
2. The machine learning model is being used to train the controller to determine whether a network packet is considered as DDoS attack or not.
3. The controller then will be able to detect the packet using the detection mechanism and mitigate the attack by doing a port blocking from the attacker port.
4. The controller has been tested on multiple data center topologies with multiple number of nodes selection.
5. There is an application layer that was made to keep the monitoring of eaach of the node inside https://github.com/bryanoliverh/SDNSecurity_RyuControllerApplicationLayer.
6. The application layer functions to manually enable/disable port, check the packet forwarding, block specific ports from the network devices, check the condition via the monitoring graphs, and so on.

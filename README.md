# SDN Security - DDOS Mitigation System based on Ryu Controller Framework with Port Blocking Mechanism using Decision Tree Algorithm

**This is a thesis project that creates a DDoS Mitigation System inside the Ryu SDN Controller. The specification is as follows:**
1. The controller is using the Machine Learning Classification Decision Tree Model.
2. The machine learning model is being used to train the controller to determine whether a network packet is considered a DDoS attack or not.
3. The controller then will be able to detect the packet using the detection mechanism and mitigate the attack by doing a port blocking the attacker port.
4. The controller has been tested on multiple data center topologies (Three Tier, Leaf-Spine, etc) with the multiple number of nodes selection with most of the switches being used being OpenFlow Switch 1.3.
5. There is an application layer that was made to keep the monitoring of the eaeachf the node inside https://github.com/bryanoliverh/SDNSecurity_RyuControllerApplicationLayer.
6. The application layer functions to manually enable/disable ports, create whitelist/blacklist firewall rules, check the packet forwarding, block specific ports from the network devices, check the condition via the monitoring graphs, and so on.

**Simulation**

- Normal Traffic detection: https://youtu.be/l3U2RKbh_E4

- Attack Traffic detection: https://youtu.be/wmVMV7yVDJU

**Topology Example:**


**Three Tier Data Center:**



<img width="580" alt="image" src="https://user-images.githubusercontent.com/74172600/220833702-12118189-d3c9-4625-9e56-08808c9f6f87.png">




**Spine Leaf Data Center:**



**Introduction to Ryu and Mininet**

Please read through these two docs for the introduction to Mininet and Ryu controllers:

- https://ryu.readthedocs.io/en/latest/getting_started.html
- http://mininet.org/walkthrough/

Ryu also has an API that can be hit from the application firewall that we run. In this case, I am using Django for the website framework. Some of the API functions are very beneficial for network monitoring and configurations. It allows the management of traffic, enabling or disabling a switch, and many more. Please choose the corresponding mininet and Ryu versions that you prefer. You can check this doc for the API functionalities: https://ryu.readthedocs.io/en/latest/app/ofctl_rest.html

# ElastiFlow&trade;

[![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

> SUPPORTING ElastiFlow&trade; - Today literally 1000s of users leverage ElastiFlow&trade; As a powerful alternative to expensive commercial flow collecting solutions. As its popularity has increased, so has the time commitment necessary to support users and provide further enhancements. If you are one of the organizations who appreciate the value of ElastiFlow&trade;, I would like to ask you to consider becoming a sponsor. The support from sponsors allows me dedicate more time and energy to the project. To become a sponsor, please visit ElastiFlow on [![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow).

ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack (Elasticsearch, Logstash and Kibana). It supports Netflow v5/v9, sFlow and IPFIX flow types (1.x versions support only Netflow v5/v9).

![ElastiFlow&trade;](https://user-images.githubusercontent.com/10326954/71544999-24eba180-2986-11ea-8c9f-14e901def62c.png)

I was inspired to create ElastiFlow&trade; following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

## User Testimonials

Organization | Feedback
--- | ---
![ESnet](https://user-images.githubusercontent.com/10326954/44616427-b2c5f280-a84f-11e8-8add-1a458bffec68.png) | ***“Right now this is my personal favorite analytics tool. I use it extensively and am always finding a new way to leverage it."***
![Payback](https://user-images.githubusercontent.com/10326954/44616291-64afef80-a84d-11e8-804f-6537897bfe85.png) | ***"We're using it since two months in our new datacenter and our network admins are very happy and impressed."***
![Catapult Systems](https://user-images.githubusercontent.com/10326954/44616396-2c111580-a84f-11e8-92dd-a509064d02f8.png) | ***"Of all the netflow tools I’ve tested it has, by far, the best visualizations."***
![Imagine Software](https://user-images.githubusercontent.com/10326954/44616477-ee14f100-a850-11e8-9133-26917020e685.png) | ***"We absolutely love ElastiFlow and recently stood it up in production. Looking forward to new functionality and dashboards."***

## Getting Started

> NOTE: Elastic Stack 7.x _*requires*_ ElastiFlow&trade; 3.5.x. To deploy on Elastic Stack 6.x you _*must*_ use ElastiFlow&trade; 3.4.2 or earlier. The 3.4 branch will be maintained independently of the master branch for a while, as most users are still using a pre-7 release of the Elastic Stack.

ElastiFlow&trade; is built using the Elastic Stack, including Elasticsearch, Logstash and Kibana. Please refer to [INSTALL.md](https://github.com/robcowart/elastiflow/blob/master/INSTALL.md) for instructions on how to install and configure ElastiFlow&trade;


> NOTE: Please make sure that have reviewed [KNOWN_ISSUES.md](https://github.com/robcowart/elastiflow/blob/master/KNOWN_ISSUES.md) prior to getting started.

## Kibana App Compatibility

### SIEM

![SIEM](https://user-images.githubusercontent.com/10326954/71544668-c83ab780-2982-11ea-90c5-6d9a72d968d8.png)

### Logs

![Logs](https://user-images.githubusercontent.com/10326954/71544653-a8a38f00-2982-11ea-801e-0d6f6f3b94e4.png)

## Provided Dashboards

The following dashboards are provided.

> NOTE: The dashboards are optimized for a monitor resolution of 1920x1080.

### Overview

![Overview](https://user-images.githubusercontent.com/10326954/71544369-f0c0b280-297e-11ea-9564-8f43834b2920.png)

### Top-N

There are separate Top-N dashboards for Top Talkers, Services, Conversations and Applications.

#### Top Talkers

![Top Talkers](https://user-images.githubusercontent.com/10326954/71544386-25346e80-297f-11ea-8df2-27da8b848259.png)

#### Top Services

![Top Services](https://user-images.githubusercontent.com/10326954/71544397-4c8b3b80-297f-11ea-9e1b-4f41494bb9c6.png)

#### Top Conversations

![Top Conversations](https://user-images.githubusercontent.com/10326954/71544439-b1469600-297f-11ea-88b3-ba801c8b4bc4.png)

#### Top Applications

![Top Applications](https://user-images.githubusercontent.com/10326954/71544446-d0ddbe80-297f-11ea-8da4-3fbca3814bae.png)

### Threats

ElastiFlow&trade; includes a dictionary of public IP addresses that are known to have a poor reputation. This dictionary is built from many OSINT data sources, normalized to a common taxonomy. The Threats dashboard uses this IP reputation information to highlight three threat/risk types.

1. Public Threats - Public clients with a poor IP reputation that are reaching private addresses.
2. At-Risk Servers - Private Servers that are being reached by clients with a poor IP reputation.
3. High-Risk Clients - Private clients that are accessing public servers which have a poor reputation.

![Threats](https://user-images.githubusercontent.com/10326954/71544459-efdc5080-297f-11ea-8752-0689cbab6ff8.png)

### Flows

There are separate Sankey dashboards for Client/Server, Source/Destination and Autonomous System perspectives. The sankey visualizations are built using the new Vega visualization plugin.

#### Client/Server Flows

![Client/Server Flows](https://user-images.githubusercontent.com/10326954/71544475-097d9800-2980-11ea-9d57-5ce9a7ab997b.png)

#### Source/Destination Flows

![Source/Destination Flows](https://user-images.githubusercontent.com/10326954/71544488-3df15400-2980-11ea-8f08-939cc224442b.png)

#### Autonomous System Flows

![Autonomous System Flows](https://user-images.githubusercontent.com/10326954/71544492-6711e480-2980-11ea-8590-ee4631c4c153.png)

### Geo IP

There are separate Geo Location dashboards for Client/Server and Source/Destination perspectives.

#### Client/Server Geo IP

![Client/Server Geo IP](https://user-images.githubusercontent.com/10326954/71544498-81e45900-2980-11ea-8117-b1aa761f95df.png)

#### Source/Destination Geo IP

![Source/Destination Geo IP](https://user-images.githubusercontent.com/10326954/71544508-adffda00-2980-11ea-957e-79fef27be063.png)

### AS Traffic

Provides a view of traffic to and from Autonomous Systems (public IP ranges)

![AS Traffic](https://user-images.githubusercontent.com/10326954/71544520-dbe51e80-2980-11ea-9a96-907f737ca211.png)

### Flow Exporters

![Flow Exporters](https://user-images.githubusercontent.com/10326954/71544529-fcad7400-2980-11ea-879d-f83412dd3238.png)

### Traffic Details

Provides more detailed breakdown of various network traffic characteristics.

#### Traffic Types

![Traffic Types](https://user-images.githubusercontent.com/10326954/71544538-1fd82380-2981-11ea-9a1b-aa320a16d384.png)

#### Traffic Attributes

![Traffic Attributes](https://user-images.githubusercontent.com/10326954/71544554-531ab280-2981-11ea-99e3-7d1156c5e84d.png)

#### Traffic Locality

![Traffic Locality](https://user-images.githubusercontent.com/10326954/71544574-8bba8c00-2981-11ea-9d0b-0ef955fd17fa.png)

### Flow Records

#### Client/Server

![Client/Server](https://user-images.githubusercontent.com/10326954/71544583-a3921000-2981-11ea-8e3b-fbb837eeb6c6.png)

#### Source/Destination

![Source/Destination](https://user-images.githubusercontent.com/10326954/71544605-f10e7d00-2981-11ea-82bf-1ade34350b0d.png)

### Ziften ZFlow

ElastiFlow&trade; v3.4.0 added support for IPFIX records from Ziften's ZFlow agent. In addition to being fully integrated with the standard dashboards, a stand-alone ZFlow dashboards displays network traffic based on user and command data provided by ZFlow.
![Ziften ZFlow](https://user-images.githubusercontent.com/10326954/71544619-1e5b2b00-2982-11ea-9c6b-14f3863e55b4.png)

## Attribution

This product includes GeoLite2 data created by MaxMind, available from (http://www.maxmind.com)
# ElastiFlow&trade;

[![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

> SUPPORTING ElastiFlow&trade; - Today literally 1000s of users leverage ElastiFlow&trade; As a powerful alternative to expensive commercial flow collecting solutions. As its popularity has increased, so has the time commitment necessary to support users and provide further enhancements. If you are one of the organizations who appreciate the value of ElastiFlow&trade;, I would like to ask you to consider becoming a sponsor. The support from sponsors allows me dedicate more time and energy to the project. To become a sponsor, please visit ElastiFlow on [![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow).

ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack (Elasticsearch, Logstash and Kibana). It supports Netflow v5/v9, sFlow and IPFIX flow types (1.x versions support only Netflow v5/v9).

![ElastiFlow&trade;](https://user-images.githubusercontent.com/10326954/57181284-fc141a80-6e91-11e9-9ec5-d0864c25a088.png)

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

## Provided Dashboards

The following dashboards are provided.

> NOTE: The dashboards are optimized for a monitor resolution of 1920x1080.

### Overview

![Overview](https://user-images.githubusercontent.com/10326954/57179336-290a0280-6e7d-11e9-8e34-f4d3f04567f7.png)

### Top-N

There are separate Top-N dashboards for Top Talkers, Services, Conversations and Applications.
![Top-N](https://user-images.githubusercontent.com/10326954/57181182-c02c8580-6e90-11e9-8cc6-b32424566dea.png)

### Threats

ElastiFlow&trade; includes a dictionary of public IP addresses that are known to have a poor reputation. This dictionary is built from many OSINT data sources, normalized to a common taxonomy. The Threats dashboard uses this IP reputation information to highlight three threat/risk types.

1. Public Threats - Public clients with a poor IP reputation that are reaching private addresses.
2. At-Risk Servers - Private Servers that are being reached by clients with a poor IP reputation.
3. High-Risk Clients - Private clients that are accessing public servers which have a poor reputation.

![Threats](https://user-images.githubusercontent.com/10326954/57181155-865b7f00-6e90-11e9-82f8-bb8e7b2df083.png)

### Flows

There are separate Sankey dashboards for Client/Server, Source/Destination and Autonomous System perspectives. The sankey visualizations are built using the new Vega visualization plugin.
![Flows](https://user-images.githubusercontent.com/10326954/57180877-65455f00-6e8d-11e9-9411-ca2b952748e7.png)

### Geo IP

There are separate Geo Location dashboards for Client/Server and Source/Destination perspectives.
![Geo IP](https://user-images.githubusercontent.com/10326954/57180209-cf0e3a80-6e86-11e9-8b7b-acd3a82181af.png)

### AS Traffic

Provides a view of traffic to and from Autonomous Systems (public IP ranges)
![AS Traffic](https://user-images.githubusercontent.com/10326954/57180844-17305b80-6e8d-11e9-875e-a715d0c66a25.png)

### Flow Exporters

![Flow Exporters](https://user-images.githubusercontent.com/10326954/57180767-51e5c400-6e8c-11e9-9c06-6c34ec6ea922.png)

### Traffic Details

![Traffic Details](https://user-images.githubusercontent.com/10326954/57180793-86598000-6e8c-11e9-9dc1-341abafbd20e.png)

### Flow Records

![Flow Records](https://user-images.githubusercontent.com/10326954/57180815-bf91f000-6e8c-11e9-823d-6fb10d5a9d16.png)

### Ziften ZFlow

ElastiFlow&trade; v3.4.0 added support for IPFIX records from Ziften's ZFlow agent. In addition to being fully integrated with the standard dashboards, a stand-alone ZFlow dashboards displays network traffic based on user and command data provided by ZFlow.
![Ziften ZFlow](https://user-images.githubusercontent.com/10326954/57181212-0da8f280-6e91-11e9-8725-4e06b22fc64b.png)

## Attribution

This product includes GeoLite2 data created by MaxMind, available from (http://www.maxmind.com)

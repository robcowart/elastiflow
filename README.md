# ElastiFlow&trade;

[![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack (Elasticsearch, Logstash and Kibana). It supports Netflow v5/v9, sFlow and IPFIX flow types (1.x versions support only Netflow v5/v9).

![ElastiFlow&trade;](https://user-images.githubusercontent.com/10326954/89781356-727ede00-db13-11ea-8130-73562a8593f8.png)

I was inspired to create ElastiFlow&trade; following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

## SUPPORTING ElastiFlow&trade;

Today literally 1000s of users leverage ElastiFlow&trade; As a powerful alternative to expensive commercial flow collecting solutions. As its popularity has increased, so has the time commitment necessary to support users and provide further enhancements. If you are one of the organizations who appreciate the value of ElastiFlow&trade;, I would like to ask you to consider becoming a sponsor. The support from sponsors allows me dedicate more time and energy to the project. To become a sponsor, please visit ElastiFlow&trade; on [![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow).

A special thanks to...

### VyoPath - [www.vyopath.com](https://www.vyopath.com)

![VyoPath](https://user-images.githubusercontent.com/10326954/56861440-066d7a80-69a1-11e9-952d-8c7a1ac350c6.png)

VyoPath is the trusted advisor to business leaders seeking innovative, creative and strategic solutions to help them plan for and navigate the challenges of the ever changing digital landscape. Speak to VyoPath for ElastiFlow-as-a-Service.

```text
VyoPath, Inc.
9689 Avalon Drive
Frisco, Texas 75035

Phone: +1 469 850 2419
Email: info@vyopath.com
```

### Dynamite Analytics - [dynamite.ai](https://dynamite.ai/)

![Dynamite Analytics](https://user-images.githubusercontent.com/10326954/76325789-0855d900-62e8-11ea-9e9f-107f28504ca3.png)

Dynamite-NSM is the open-source network security monitor developed by Dynamite Analytics. It provides network and cybersecurity operators with holistic insights into their networks while giving them the ability to deep-dive into lower-level activities. Dynamite-NSM builds upon the ELK stack (ElasticSearch, LogStash, Kibana) and is coupled with the fine-tuned Zeek sensor (a.k.a. Bro), flow data inputs (powered by ElastiFlow), and Suricata IDS security alerts. The solution now includes the Dynamite Lab component made of the python API for easy data access and the integrated JupyterHub data science environment.

```text
Dynamite Analytics
7742 Spalding Drive #359
Norcross, GA 30092
USA
```

## User Testimonials

Organization | Feedback
--- | ---
![Uber](https://user-images.githubusercontent.com/10326954/81165240-f44df100-8f91-11ea-94e5-24da16db801b.png) | ***"ElastiFlow has significantly reduced our network flow monitoring costs. The flexibility and extensibility inherent to ElastiFlow was essential for an easy integration with our infrastructure monitoring suite."***
![ESnet](https://user-images.githubusercontent.com/10326954/44616427-b2c5f280-a84f-11e8-8add-1a458bffec68.png) | ***“Right now this is my personal favorite analytics tool. I use it extensively and am always finding a new way to leverage it."***
![Payback](https://user-images.githubusercontent.com/10326954/44616291-64afef80-a84d-11e8-804f-6537897bfe85.png) | ***"We're using it since two months in our new datacenter and our network admins are very happy and impressed."***
![Catapult Systems](https://user-images.githubusercontent.com/10326954/44616396-2c111580-a84f-11e8-92dd-a509064d02f8.png) | ***"Of all the netflow tools I’ve tested it has, by far, the best visualizations."***
![Imagine Software](https://user-images.githubusercontent.com/10326954/44616477-ee14f100-a850-11e8-9133-26917020e685.png) | ***"We absolutely love ElastiFlow and recently stood it up in production. Looking forward to new functionality and dashboards."***

## Getting Started

> **NOTE** - Please refer to `INSTALL.md` for installation instructions.

ElastiFlow&trade; is built using the Elastic Stack, including Elasticsearch, Logstash and Kibana. Please refer to [INSTALL.md](https://github.com/robcowart/elastiflow/blob/master/INSTALL.md) for instructions on how to install and configure ElastiFlow&trade;.

If you are new to the Elastic Stack, this video goes beyond a simple default installation of Elasticsearch and Kibana. It discusses real-world best practices for hardware sizing and configuration, providing production-level performance and reliability.

[![0003_es_install](https://user-images.githubusercontent.com/10326954/76195457-9ea2d580-61e8-11ea-8578-8fb39908afec.png)](https://www.youtube.com/watch?v=gZb7HpVOges)

Additionally local SSD storage should be considered as _*mandatory*_! For an in-depth look at how different storage options compare, and in particular how bad HDD-based storage is for Elasticsearch (even in multi-drive RAID0 configurations) you should watch this video...

[![0001_es_storage](https://user-images.githubusercontent.com/10326954/76195348-61d6de80-61e8-11ea-951d-1694d2e0392b.png)](https://www.youtube.com/watch?v=nKUpfJCBiS4)

> NOTE: Please make sure that have reviewed [KNOWN_ISSUES.md](https://github.com/robcowart/elastiflow/blob/master/KNOWN_ISSUES.md) prior to getting started.

## Kibana App Compatibility

### SIEM

![SIEM: Hosts](https://user-images.githubusercontent.com/10326954/89768012-4ce5da80-dafb-11ea-8184-e443569f8de6.png)

![SIEM: Network Map](https://user-images.githubusercontent.com/10326954/89768129-7e5ea600-dafb-11ea-9ca5-dc8c3946a2ce.png)

![SIEM: Network Statistics](https://user-images.githubusercontent.com/10326954/89778819-71977d80-db0e-11ea-8671-4d1847220294.png)

### Logs

![Logs](https://user-images.githubusercontent.com/10326954/89778984-bae7cd00-db0e-11ea-9a78-9a765b9a6cec.png)

## Provided Dashboards

The following dashboards are provided.

> NOTE: The dashboards are optimized for a monitor resolution of 1920x1080.

### Overview

![Overview](https://user-images.githubusercontent.com/10326954/89779068-e79be480-db0e-11ea-8c02-8342d0eddd16.png)

### Top-N

There are separate Top-N dashboards for Top Talkers, Services, Conversations and Applications.

#### Top Talkers

![Top Talkers](https://user-images.githubusercontent.com/10326954/89779132-04d0b300-db0f-11ea-9552-52e86233bff1.png)

#### Top Services

![Top Services](https://user-images.githubusercontent.com/10326954/89779155-0ef2b180-db0f-11ea-8fec-425a09bf46ab.png)

#### Top Conversations

![Top Conversations](https://user-images.githubusercontent.com/10326954/89779190-1ca83700-db0f-11ea-9328-596bb2aca807.png)

#### Top Applications

![Top Applications](https://user-images.githubusercontent.com/10326954/89779238-32b5f780-db0f-11ea-8499-b45916d551f7.png)

### Threats

ElastiFlow&trade; includes a dictionary of public IP addresses that are known to have a poor reputation. This dictionary is built from many OSINT data sources, normalized to a common taxonomy. The Threats dashboard uses this IP reputation information to highlight three threat/risk types.

1. Public Threats - Public clients with a poor IP reputation that are reaching private addresses.
2. At-Risk Servers - Private Servers that are being reached by clients with a poor IP reputation.
3. High-Risk Clients - Private clients that are accessing public servers which have a poor reputation.

![Threats](https://user-images.githubusercontent.com/10326954/89779418-95a78e80-db0f-11ea-9e80-7cf070bd1678.png)

### Flows

There are separate Sankey dashboards for Client/Server, Source/Destination and Autonomous System perspectives. The sankey visualizations are built using the new Vega visualization plugin.

#### Client/Server Flows

![Client/Server Flows](https://user-images.githubusercontent.com/10326954/89767564-7a7e5400-dafa-11ea-8ed6-2fa105b92b83.png)

#### Source/Destination Flows

![Source/Destination Flows](https://user-images.githubusercontent.com/10326954/89767666-b0233d00-dafa-11ea-80f0-b0f6622c587d.png)

#### Autonomous System Flows

![Autonomous System Flows](https://user-images.githubusercontent.com/10326954/89767825-fd9faa00-dafa-11ea-9c8e-7990d42df9f7.png)

### Geo IP

There are separate Geo Location dashboards for Client/Server and Source/Destination perspectives.

#### Client/Server Geo IP

![Client/Server Geo IP](https://user-images.githubusercontent.com/10326954/89779669-30a06880-db10-11ea-84f3-8e47567ea406.png)

#### Source/Destination Geo IP

![Source/Destination Geo IP](https://user-images.githubusercontent.com/10326954/89779620-18304e00-db10-11ea-94cb-742f82131847.png)

### AS Traffic

Provides a view of traffic to and from Autonomous Systems (public IP ranges)

![AS Traffic](https://user-images.githubusercontent.com/10326954/89780350-90e3da00-db11-11ea-9a5d-d267c7efec8f.png)

### Flow Exporters

![Flow Exporters](https://user-images.githubusercontent.com/10326954/89780532-e7e9af00-db11-11ea-8790-011b55ba70cd.png)

### Traffic Details

Provides more detailed breakdown of various network traffic characteristics.

#### Traffic Types

![Traffic Types](https://user-images.githubusercontent.com/10326954/89780642-23847900-db12-11ea-8e89-534a5a123f7b.png)

#### Traffic Attributes

![Traffic Attributes](https://user-images.githubusercontent.com/10326954/89780668-3008d180-db12-11ea-9853-b71cb62f87b9.png)

#### Traffic Locality

![Traffic Locality](https://user-images.githubusercontent.com/10326954/89780691-3c8d2a00-db12-11ea-89a8-23676a8b0d31.png)

### Flow Records

#### Client/Server

![Client/Server](https://user-images.githubusercontent.com/10326954/89780818-752d0380-db12-11ea-9e9b-ab0f1cf02b06.png)

#### Source/Destination

![Source/Destination](https://user-images.githubusercontent.com/10326954/89780834-7d853e80-db12-11ea-9c3f-44524093e1f1.png)

### Ziften ZFlow

ElastiFlow&trade; v3.4.0 added support for IPFIX records from Ziften's ZFlow agent. In addition to being fully integrated with the standard dashboards, a stand-alone ZFlow dashboards displays network traffic based on user and command data provided by ZFlow.
![Ziften ZFlow](https://user-images.githubusercontent.com/10326954/89780960-b32a2780-db12-11ea-8a29-4fff55a343e7.png)

## Attribution

This product includes GeoLite2 data created by MaxMind, available from (http://www.maxmind.com)

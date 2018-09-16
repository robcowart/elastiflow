# ElastiFlow&trade;
[![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack (Elasticsearch, Logstash and Kibana). It supports Netflow v5/v9, sFlow and IPFIX flow types (1.x versions support only Netflow v5/v9).

![ElastiFlow&trade;](https://user-images.githubusercontent.com/10326954/39966506-0934e198-56ad-11e8-9f40-c6454b6c6ea7.png)

I was inspired to create ElastiFlow&trade; following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

## User Testimonials
Organization | Feedback
--- | ---
![ESnet](https://user-images.githubusercontent.com/10326954/44616427-b2c5f280-a84f-11e8-8add-1a458bffec68.png) | ***“Right now this is my personal favorite analytics tool. I use it extensively and am always finding a new way to leverage it."***
![Payback](https://user-images.githubusercontent.com/10326954/44616291-64afef80-a84d-11e8-804f-6537897bfe85.png) | ***"We're using it since two months in our new datacenter and our network admins are very happy and impressed."***
![Catapult Systems](https://user-images.githubusercontent.com/10326954/44616396-2c111580-a84f-11e8-92dd-a509064d02f8.png) | ***"Of all the netflow tools I’ve tested it has, by far, the best visualizations."***
![Imagine Software](https://user-images.githubusercontent.com/10326954/44616477-ee14f100-a850-11e8-9133-26917020e685.png) | ***"We absolutely love ElastiFlow and recently stood it up in production. Looking forward to new functionality and dashboards."***

## Getting Started
ElastiFlow&trade; is built using the Elastic Stack, including Elasticsearch, Logstash and Kibana. Please refer to [INSTALL.md](https://github.com/robcowart/elastiflow/blob/master/INSTALL.md) for instructions on how to install and configure ElastiFlow&trade;

## Provided Dashboards
The following dashboards are provided.

> NOTE: The dashboards are optimized for a monitor resolution of 1920x1080.

### Overview
![Overview](https://user-images.githubusercontent.com/10326954/39966471-9b0a40dc-56ac-11e8-8962-78b928c7971f.png)

### Top-N
There are separate Top-N dashboards for Top Talkers, Services, Conversations and Applciations.
![Top-N](https://user-images.githubusercontent.com/10326954/39966477-b52ee92c-56ac-11e8-84eb-4688ddff7754.png)

### Sankey
There are separate Sankey dashboards for Client/Server, Source/Destination and Autonomous System perspectives. The sankey visualizations are built using the new Vega visualization plugin.
![Sankey](https://user-images.githubusercontent.com/10326954/39966483-c14a3aa4-56ac-11e8-9319-a56b2bf60d9f.png)

### Geo IP
There are separate Geo Loacation dashboards for Client/Server and Source/Destination perspectives.
![Geo IP](https://user-images.githubusercontent.com/10326954/39966487-cd06acf6-56ac-11e8-9da7-1bff5e822d8d.png)

### AS Traffic
Provides a view of traffic to and from Autonomous Systems (public IP ranges)
![AS Traffic](https://user-images.githubusercontent.com/10326954/39966490-d8d6032e-56ac-11e8-8784-b9903855d4f3.png)

### Exporters
![Flow Exporters](https://user-images.githubusercontent.com/10326954/39966495-e42c14f2-56ac-11e8-8c0e-b4275bfb32eb.png)

### Traffic Details
![Traffic Details](https://user-images.githubusercontent.com/10326954/39966499-ecfa036e-56ac-11e8-98fc-bde7cbbea787.png)

### Flow Records
![Flow Records](https://user-images.githubusercontent.com/10326954/39966504-fafe1446-56ac-11e8-96f3-0f01a01811ca.png)

## Attribution
This product includes GeoLite2 data created by MaxMind, available from (http://www.maxmind.com)

# Running ElastiFlow&trade; on Docker

[![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow) [![Donate](https://img.shields.io/badge/Donate-PayPal-green.svg)](https://www.paypal.me/robcowart) [![Tweet](https://img.shields.io/twitter/url/http/shields.io.svg?style=social)](https://twitter.com/intent/tweet?text=ElastiFlow%E2%84%A2%20provides%20Netflow%20v5%2Fv9%2C%20sFlow%20and%20IPFIX%20data%20collection%20and%20visualization%20using%20the%20Elastic%20Stack.&url=https://github.com/robcowart/elastiflow&hashtags=elastiflow,netflow,sflow,ipfix)

> SUPPORTING ElastiFlow&trade; - Today literally 1000s of users leverage ElastiFlow&trade; As a powerful alternative to expensive commercial flow collecting solutions. As its popularity has increased, so has the time commitment necessary to support users and provide further enhancements. If you are one of the organizations who appreciate the value of ElastiFlow&trade;, I would like to ask you to consider becoming a sponsor. The support from sponsors allows me dedicate more time and energy to the project. To become a sponsor, please visit ElastiFlow on [![patreon](https://user-images.githubusercontent.com/10326954/52966127-c9847680-33a6-11e9-8640-10dd7abc3af0.png)](https://www.patreon.com/elastiflow).

## Setting up ElastiFlow&trade; on Docker

The easiest way to get ElastiFlow&trade; up and running quickly is to use Docker and docker-compose. The following instructions will walk you through setting up a single node installation of ElastiFlow&trade; on Docker.

> NOTE: These instructions assume that you will have a server available with a recent Linux distribution and both Docker and docker-composer installed.

## Prepare the Data Path

Data written within a container's file system is ephemeral. It will be lost when the container is removed. For the data to persist it is necessary to write the data to local host's file system using a _bind mount_. You must create a path on the local host, and set the necessary permissions for the processes within the container to write to it.

```text
sudo mkdir /var/lib/elastiflow_es
sudo chown -R 1000:1000 /var/lib/elastiflow_es
```

## Customize Environment Variables in docker-compose.yml

While the provided defaults should allow you to get up and running quickly, you may need to make changes specific to your requirements. After copying the provided `docker-compose.yml` from the repository to the server, edit any relevant environment variables.

> The ElastiFlow&trade; Logstash container can be configured using the same environment variables discussed in `INSTALL.md`.

## Start the Elastic Stack using docker-compose

Start the Elastic Stack (incl. Logstash with the ElastiFlow pipeline) using `docker-compose`.

From the path where you placed the `docker-compose.yml` file run:

```text
sudo docker-compose up -d
```

## Import Dashboards into Kibana

The Index Patterns, vizualizations and dashboards can be loaded into Kibana by importing the `elastiflow.kibana.<VER>.json` file from within the Kibana UI. This is done from the `Management -> Stack Management -> Kibana Saved Objects` page.

You may also want to configure the recommend advanced Kibana settings discussed in `INSTALL.md`.

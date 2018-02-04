# ElastiFlow&trade;
ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack. As of version 2.0.0 it supports Netflow v5/v9, sFlow and IPFIX flow types (1.x versions support only Netflow v5/v9).

![Overview](https://user-images.githubusercontent.com/10326954/35780814-c015a1cc-09e1-11e8-8e7c-770ef279e9d0.png)

I was inspired to create ElastiFlow&trade; following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

## Getting Started
ElastiFlow&trade; is built using the Elastic Stack, including Elasticsearch, Logstash and Kibana. Refer to the following compatibility chart to choose a release of ElastiFlow&trade; that is compatible with the version of the Elastic Stack you are using.

Elastis Stack | ElastiFlow&trade; 1.x | ElastiFlow&trade; 2.x
--- | --- | ---
6.1 | YES | YES
6.0 | YES | YES
5.6 | YES | YES
5.5 | YES| 
5.4 | YES | 

> NOTE: The instructions that follow are for ElastiFlow&trade; 2.x.

### Setting up Elasticsearch
Currently there is no specific configuration required for Elasticsearch. As long as Kibana and Logstash can talk to your Elasticsearch cluster you should be ready to go. At high ingest rates (>10K flows/s), or for data redundancy and high availability, a multi-node cluster is recommended.

### Setting up Logstash
To use ElastiFlow&trade; you will need to install the community supported sFlow codec for Logtsash. It is also recommended that you always use the latest version of [Netflow](https://www.elastic.co/guide/en/logstash/current/plugins-codecs-netflow.html) codec. This can achieved by running the following commands:

```
$ LS_HOME/bin/logstash-plugin install logstash-codec-sflow
Validating logstash-codec-sflow
Installing logstash-codec-sflow

$ LS_HOME/bin/logstash-plugin update logstash-codec-netflow
Updating logstash-codec-netflow
Updated logstash-codec-netflow 3.10.0 to 3.11.2
```

There are four sets of configuration files provided within the `logstash/elastiflow` folder:
```
logstash
+-- elastiflow
    |-- conf.d  (contains the logstash pipeline)
    |-- dictionaries (yaml files used to enrich raw flow data)
    |-- geoipdbs  (contains GeoIP databases)
    +-- templates  (contains index templates)
```

Copy the `elastiflow` directory to the location of your Logstash configuration files (e.g. on RedHat/CentOS this would be `/etc/logstash/elastiflow`.

Rather than directly editing the pipeline configuration files for your environment, environment variables can be used. The supported environment variables are:

Environment Variable | Description | Default Valaue
--- | --- | ---
ELASTIFLOW_GEOIP_DB_PATH | The path where the GeoIP DBs are located | /etc/logstash/geoipdbs
ELASTIFLOW_DICT_PATH | The path where the dictionary files are located | /etc/logstash/dictionaries
ELASTIFLOW_TEMPLATE_PATH | The path to where index templates are located | /etc/logstash/templates
ELASTIFLOW_RESOLVE_IP2HOST | Enable/Disable DNS requests | false
ELASTIFLOW_NAMESERVER | The DNS server to which the dns filter should send requests | 127.0.0.1
ELASTIFLOW_ES_HOST | The Elasticsearch host to which the output will send data | 127.0.0.1:9200
ELASTIFLOW_ES_USER | The password for the connection to Elasticsearch | elastic
ELASTIFLOW_ES_PASSWD | The username for the connection to Elasticsearch | changeme
ELASTIFLOW_NETFLOW_HOST | The IP address from which to listen for Netflow messages | 0.0.0.0
ELASTIFLOW_NETFLOW_PORT | The UDP port on which to listen for Netflow messages | 2055
ELASTIFLOW_NETFLOW_LASTSW_TIMESTAMP | Enable/Disable setting `@timestamp` with the value of netflow.last_switched | false
ELASTIFLOW_NETFLOW_TZ=UTC | The timezone of netflow.last_switched | UTC
ELASTIFLOW_SFLOW_HOST | The IP address from which to listen for sFlow messages | 0.0.0.0
ELASTIFLOW_SFLOW_PORT | The UDP port on which to listen for sFlow messages | 6343
ELASTIFLOW_IPFIX_TCP_HOST | The IP address from which to listen for IPFIX messages via TCP | 0.0.0.0
ELASTIFLOW_IPFIX_TCP_PORT | The port on which to listen for IPFIX messages via TCP | 4739
ELASTIFLOW_IPFIX_UDP_HOST | The IP address from which to listen for IPFIX messages via UDP | 0.0.0.0
ELASTIFLOW_IPFIX_UDP_PORT | The port on which to listen for IPFIX messages via UDP | 4739

The files `profile.d/elastiflow.sh` and `logstash.service.d/elastiflow.conf` are provided to help you setup the environment variables. For example, if you will be running Logstash using `systemd`, simply complete following steps...
1. Edit the provided `logstash.service.d/elastiflow.conf` for your environment and needs.
2. Copy the file to `/etc/systemd/system/logstash.service.d/elastiflow.conf`
3. Run `systemctl daemon-reload` to pickup the new systemd configuration files
4. Start Logstash by running `systemctl start logstash`

> WARNING: DNS resolution of IP addresses to hostnames is controlled by the `ELASTIFLOW_RESOLVE_IP2HOST` environment variable. Within the pipeline caching is disabled for the `dns` filter as this causes performance issues due to the blocking nature of the cache lookups. For the best DNS performance it is recommended to use a local `dnsmasq` process to handle caching and to forward any unresolved lookups to upstream DNS servers. This is the reason that `ELASTIFLOW_NAMESERVER` defaults to `127.0.0.1`. When receiving very high rates of flow records, leaving DNS resolution disabled will ensure the best performance.

Logstash can be configured to load the ElastiFlow&trade; pipeline using one of the following methods:
* From the command line using the path.config option.
```
$ LS_HOME/bin/logstash --path.config=/etc/logstash/elastiflow/conf.d
```
* By setting path.config in `logstash.yml`
```
path.config: /etc/logstash/elastiflow/conf.d
```
* If using Logstash 6.0 or above, ElastiFlow&trade; can also be started ba adding it to `pipelines.yml`
```
- pipeline.id: elastiflow
  path.config: "/etc/logstash/elastiflow/conf.d"
```

### Setting up Kibana
As of Kibana 5.6 an API (yet undocumented) is available to import and export Index Patterns. The JSON file which contains the Index Pattern configuration is `kibana/elastiflow.index_pattern-json`. To setup the `elastiflow-*` Index Pattern run the following command:
```
curl -X POST -u USERNAME:PASSWORD http://KIBANASERVER:5601/api/saved_objects/index-pattern/elastiflow-* -H "Content-Type: application/json" -H "kbn-xsrf: true" -d @/PATH/TO/elastiflow.index_pattern.json
```

Finally the vizualizations and dashboards can be loaded into Kibana by importing the `elastiflow.dachboards.json` file from within Kibana. This is done from the Management - > Saved Objects page.

## Dashboards
The following dashboards are provided.

> NOTE: The dashboards are optimized for a monitor resolution of 1920x1080.

### Overview
![Overview](https://user-images.githubusercontent.com/10326954/35780648-d4443d1e-09de-11e8-902d-e2c43e072c30.png)

### Top-N
There are separate Top-N dashboards for Top Talkers, Top Services and Top Conversations.
![Conversation Partners](https://user-images.githubusercontent.com/10326954/35780668-42c0a1ec-09df-11e8-8e14-363fc1103cc4.png)

### Geo Location
There are separate Geo Loacation dashboards for Client/Server and Source/Destination perspectives.
![Geo Location](https://user-images.githubusercontent.com/10326954/35780710-d3524bfc-09df-11e8-8d89-2dec29415d19.png)

### Autonomous Systems
Provides a view of traffic to and from Autonomous Systems (public IP ranges)
![Autonomous Systems](https://user-images.githubusercontent.com/10326954/35780714-e87dd122-09df-11e8-9182-3ad9c9ffaffa.png)

### Flow Exporters
![Flow Exporters](https://user-images.githubusercontent.com/10326954/35780721-ff05a32a-09df-11e8-84ec-43a6213c8719.png)

### Traffic Analysis
![Traffic Analysis](https://user-images.githubusercontent.com/10326954/35780723-0146284e-09e0-11e8-915a-6b9f5799350a.png)

### Flow Records
![Flow Records](https://user-images.githubusercontent.com/10326954/35780724-03aca108-09e0-11e8-98fe-bff7aa47e338.png)

## Attribution
This product includes GeoLite data created by MaxMind, available from (http://www.maxmind.com)

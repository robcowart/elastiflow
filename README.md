# ElastiFlow&trade;
ElastiFlow&trade; provides network flow data collection and visualization using the Elastic Stack.

I was inspired to create ElastiFlow&trade; following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

## Getting Started
ElastiFlow&trade; 2.x leverages Elastic Stack 6.x, including Elasticsearch, Logstash and Kibana. Currently there is no specific configuration required for Elasticsearch. As long as Kibana and Logstash can talk to your Elasticsearch cluster you should be ready to go.

If you are running Elastic Stack 5.x, you should use the latest 1.x release of ElastiFlow.

### Setting up Logstash
To use ElastiFlow&trade; you will need to install the community supported sFlow codec for Logtsash. It is also recommended that you always use the latest version of Netflow [translate](https://www.elastic.co/guide/en/logstash/current/plugins-filters-translate.html) codec. This can achieved by running the following commands:

```
$LS_HOME/bin/logstash-plugin install logstash-codec-sflow
$LS_HOME/bin/logstash-plugin update logstash-codec-netflow
```

There are four sets of configuration files provided within the logstash/elastiflow folder:
```
logstash
+-- elastiflow
    |-- conf.d  (contains the logstash pipeline)
    |-- dictionaries (yaml files used to enrich raw flow data)
    |-- geoipdbs  (contains GeoIP databases)
    +-- templates  (contains index templates)
```

Rather than directly editing the pipeline configuration files in `logstash/elastiflow/conf.d` for your environment, environment variables can be used. The supported environment variables are:

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

After setting environment variables as needed, you can start Logstash using the `--path.config` option to specify the location of the `logstash/conf.d` directory.

### Setting up Kibana
You will need to setup an Index Pattern in Kibana for the Netflow data. The index name pattern must be `netflow-*`, as indexes will be created daily. The Time-field should be set to `netflow.last_switched`, which is the time that the flow ended according to the flow record.

Finally the vizualizations and dashboards can be loaded into Kibana by importing the `elastiflow.kibana.json` file from within the `kibana` directory.

## Dashboards
The following dashboards are provided.

### Overview
![Overview](https://user-images.githubusercontent.com/10326954/29495857-eaf2f668-85c7-11e7-9c4c-1a96cee6639c.png)

### Conversations
![Conversation Partners](https://user-images.githubusercontent.com/10326954/29495872-2a1e914e-85c8-11e7-98e4-c376221f8bc4.png)

### Top-N
![Top-N](https://user-images.githubusercontent.com/10326954/29495879-50d98708-85c8-11e7-8e52-155161f3ea0a.png)

### Geo Location
![Geo Location](https://user-images.githubusercontent.com/10326954/29495890-617f7018-85c8-11e7-9bfa-00adfa1607d6.png)

### Autonomous Systems
![Autonomous Systems](https://user-images.githubusercontent.com/10326954/29495904-82e8d474-85c8-11e7-8741-29cd4e10be52.png)

### Flow Exporters
![Flow Exporters](https://user-images.githubusercontent.com/10326954/29495909-92957d78-85c8-11e7-9bf4-e5aa243db27d.png)

### Traffic Analysis
![Traffic Analysis](https://user-images.githubusercontent.com/10326954/29495914-9aa4c4a6-85c8-11e7-82b3-55afb27f3a95.png)

### Flow Records
![Flow Records](https://user-images.githubusercontent.com/10326954/29495915-9e9b4558-85c8-11e7-987f-6d8b57326650.png)

## Attribution
This product includes GeoLite data created by MaxMind, available from (http://www.maxmind.com)

# ElastiFlow
ElastiFlow provides basic Netflow collection and visualization using Elastic Stack.

I was inspired to create ElastiFlow following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

My initial goal for ElastiFlow was to leverage only the functionality provided out-of-the-box by Elastic Stack, without optional plugins. However I felt this placed too many restrictions on the value that could be provided. So to use ElastiFlow you will need to install both the [translate](https://www.elastic.co/guide/en/logstash/current/plugins-filters-translate.html) and [cidr](https://www.elastic.co/guide/en/logstash/current/plugins-filters-cidr.html) filter plugins for Logstash.

## Getting Started
ElastiFlow leverages Elastic Stack 5.x, including Elasticsearch, Logstash and Kibana. Currently there is no specific configuration required for Elasticsearch. As long as Kibana and Logstash can talk to your Elasticsearch cluster you should be ready to go.

### Setting up Logstash
As mentioned above you will need to ensure that you have installed the [translate](https://www.elastic.co/guide/en/logstash/current/plugins-filters-translate.html) and [cidr](https://www.elastic.co/guide/en/logstash/current/plugins-filters-cidr.html) filter plugins for Logstash. This can achieved by running the following commands:

```
$LS_HOME/bin/logstash-plugin install logstash-filter-translate
$LS_HOME/bin/logstash-plugin install logstash-filter-cidr
```

There are three sets of configuration files provided within the logstash folder:
```
logstash
|-- conf.d  (contains the logstash pipeline)
|-- dictionaries (yaml files used to enrich raw flow data)
|-- geoipdbs  (contains GeoIP databases)
+-- templates  (contains index templates)
```

Rather than edit the pipeline files in `logstash/conf.d` for your environment, environment variables can be used. The supported environment variables are:

Environment Variable | Description | Default Valaue
--- | --- | ---
ELASTIFLOW_NETFLOW_PORT | The UDP port to listen on for Netflow messages | 2055
ELASTIFLOW_ES_HOST | The Elasticsearch host to which the output will send data | 127.0.0.1:9200
ELASTIFLOW_ES_USER | The password for the connection to Elasticsearch | elastic
ELASTIFLOW_ES_PASSWD | The username for the connection to Elasticsearch | changeme
ELASTIFLOW_GEOIP_DB_PATH | The path where the GeoIP DBs are located | /etc/logstash/geoipdbs
ELASTIFLOW_DICT_PATH | The path where the dictionary files are located | /etc/logstash/dictionaries
ELASTIFLOW_TEMPLATE_PATH | The path to where index templates are located | /etc/logstash/templates

> NOTE: If your Elasticsearch server does not require a username and password, you may need to comment out those parameters in the `elasticsearch` output.

After setting environment variables as needed, you can start Logstash using the `--path.config` option to specify the location of the `logstash/conf.d` directory.

### Setting up Kibana
You will need to setup an Index Pattern in Kibana for the Netflow data. The index name pattern must be `netflow-*`, as indexes will be created daily. The Time-field should be set to `netflow.last_switched`, which is the time that the flow ended according to the flow record.

Finally the vizualizations and dashboards can be loaded into Kibana by importing the `elastiflow.kibana.json` file from within the `kibana` directory.

## Dashboards
The following dashboards are provided.

### Overview
![Overview](https://user-images.githubusercontent.com/10326954/28128774-c3bb3dae-66e5-11e7-9f21-f0a6b8597eec.png)

### Conversation Partners
![Conversation Partners](https://user-images.githubusercontent.com/10326954/28128835-000869e4-66e6-11e7-84cf-305222d86e97.png)

### Traffic Analysis
![Traffic Analysis](https://user-images.githubusercontent.com/10326954/28128837-033bdfba-66e6-11e7-80d4-6771ef9f2d9a.png)

### Top-N
![Top-N](https://user-images.githubusercontent.com/10326954/28128851-09941f80-66e6-11e7-8fd1-c961af8dbf3f.png)

### Geo Location
![Geo Location](https://user-images.githubusercontent.com/10326954/28128859-0f2b8492-66e6-11e7-8bff-03fbbbd8ac26.png)

### Autonomous Systems
![Autonomous Systems](https://user-images.githubusercontent.com/10326954/28128864-133b65a2-66e6-11e7-904c-d7714a350032.png)

### Flow Exporters
![Flow Exporters](https://user-images.githubusercontent.com/10326954/28128878-18381384-66e6-11e7-8a20-4549a166fb1c.png)

### Flow Records
![Flow Records](https://user-images.githubusercontent.com/10326954/28128880-1f3eee3c-66e6-11e7-82d5-c9797aa3e19a.png)

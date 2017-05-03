# ElastiFlow
ElastiFlow provides basic Netflow collection and visualization using Elastic Stack.

I was inspired to create ElastiFlow following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

My goal for ElastiFlow was to leverage only the functionality provided out-of-the-box by Elastic Stack, without optional plugins. This means that it doesn't provide all of the functionality displayed in the Linkedin article, but it is easier to setup and provides a good foundation upon which anyone can begin to build out a solution specific to their own requirements.

## Getting Started
ElastiFlow leverages Elastic Stack 5.x, including Elasticsearch, Logstash and Kibana. Currently there is no specific configuration required for Elasticsearch. As long as Kibana and Logstash can talk to your Elasticsearch cluster you should be ready to go.

### Setting up Logstash
There are three sets of configuration files provided within the logstash folder:
```
logstash
|-- conf.d  (contains the logstash pipeline)
|-- geoipdbs  (contains GeoIP databases)
+-- templates  (contains index templates)
```

Rather than edit the pipeline files in logstash/conf.d for your environment, environment variables can be used. The supported environment variables are:

Environment Variable | Description | Default Valaue
--- | --- | ---
ELASTIFLOW_NETFLOW_PORT | The UDP port to listen on for Netflow messages | 2055
ELASTIFLOW_ES_HOST | The Elasticsearch host to which the output will send data | 127.0.0.1:9200
ELASTIFLOW_ES_PASSWD | The username for the connection to Elasticsearch | elastic
ELASTIFLOW_ES_USER | The password for the connection to Elasticsearch | changeme
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
![screen shot 2017-05-03 at 18 07 59](https://cloud.githubusercontent.com/assets/10326954/25671919/f9d27604-3031-11e7-9967-7736ce2bd390.png)

### Conversation Partners
![screen shot 2017-05-03 at 18 08 27](https://cloud.githubusercontent.com/assets/10326954/25672025/5e6060a4-3032-11e7-897d-5340eb0029bd.png)

### Geo Location
![screen shot 2017-05-03 at 18 08 54](https://cloud.githubusercontent.com/assets/10326954/25672047/6f5f1e22-3032-11e7-9a48-1488c8306fd1.png)

### Flow Records
![screen shot 2017-05-03 at 18 09 16](https://cloud.githubusercontent.com/assets/10326954/25672083/87f8ea94-3032-11e7-9825-62d6885cfdbb.png)
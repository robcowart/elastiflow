# ElastiFlow
ElastiFlow provides basic Netflow collection and visualization using Elastic Stack.

I was inspired to create ElastiFlow following the overwhelmingly positive feedback received to an article I posted on Linkedin... [WTFlow?! Are you really still paying for commercial solutions to collect and analyze network flow data?](https://www.linkedin.com/pulse/wtflow-you-really-still-paying-commercial-solutions-collect-cowart)

My goal for ElastiFlow was to leverage only the functionality provided out-of-the-box by Elastic Stack, without optional plugins. This means that it doesn't provide all of the functionality displayed in the Linkedin article, but it is easier to setup and provides a good foundation upon which anyone can begin to build out a solution specific to their own requirements.


## THIS PROJECT IS STILL IN PROGRESS
The logstash configuration is complete, including the index template for Elasticsearch. The Kibana index patterns, visualizations and dashboards will be added soon, as well as setup instructions.
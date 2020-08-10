# ElastiFlow&trade; - Known Issues

This document explains known issues with the ElastiFlow&trade; solution. Most of the issues described here are related to the underlying Elastic Stack components.

## 1. Template conflicts between devices

### SYMPTOMS

You may observe data that seems nonsensical if not simply impossible. This can manifest itself as extremely high bytes and packets values, or IP addresses, ports and protocols that do not exist in your environment. The symptoms may suddenly occur after introducing a new device to the environment.

You might also see errors like:

```
[2018-10-31T11:25:18,456][WARN ][logstash.codecs.netflow  ] Template length exceeds flowset length, skipping {:template_id=>266, :template_length=>109, :record_length=>104}
```

These symptoms occur because a template (see description below) from one flow exporter is being used to decode flow records from another.

### AFFECTED RECORDS

This issue can affect Netflow v9 and IPFIX flow records.

### DESCRIPTION

Unlike Netflow v5, Netflow v9 and IPFIX do not define a static flow record structure. Flow record structures can vary based on the type and configuration of the flow exporter, and a single exporter can send multiple different structures.

Netflow v9 and IPFIX flow exporter notify flow collectors about the structures they will send, by occassionally sending _template records_ which describe their contents. Flow collectors are only able to decode incoming flow records once they have received the the matching template.

Flow collectors should maintain a cache of received templates per _exporter_, _source ID/observation domain_ and _template ID_.

Logstash serves as the flow collector for the ElastiFlow&trade;, which leverages the [Netflow CODEC](https://www.elastic.co/guide/en/logstash/current/plugins-codecs-netflow.html) to decode the raw Netflow and IPFIX records.

Unfortunately the manner in which CODECS are called in a Logstash input results in the IP of the flow exporter being unavailable. Without this information the CODEC cannot cache templates with an ID that is guaranteed to be unique across all flow exporters. This can lead to the flow records from one exporter being decoded with a template from a different exporter. If the templates used by the two devices are not identical, the symptoms above will be the likely result.

### WORKAROUND

The easiest way to workaround this issue is to leverage multiple instance of Logstash each running the full ElastiFlow&trade; pipeline. You would then direct devices with conflicting templates to an instance of Logstash without any conflicting exporters.

If you have are a bit more savvy with Logstash, you can split the ElastiFlow&trade; pipeline into two parts. The first part consists of only the UDP input with Netflow CODEC, and outputs the data to an instance of Redis or Kafka. The second part would then read the data from Redis/Kafka, complete the processing and output it to Elasticsearch. You would now be able to add multiple "collector" instances to which conflicting devices can be directed, while leveraging a single "processor" instance for all data.

```
collector---\
collector-- redis -- processor -- Elasticsearch
collector---/
```

The addition of options for Redis (and maybe Kafka) may be added to a future release of ElastiFlow. See [Issue 305](https://github.com/robcowart/elastiflow/issues/305) for a releated discussion.

## 2. Flow records contain unsupported Information Elements (Fields)

### SYMPTOMS

You will likely see log messagey similar to the following, for a few minutes after Logstash has been started with the ElastiFlow&trade; pipeline.

```
[2019-01-16T09:57:38,409][WARN ][logstash.codecs.netflow ] Can't (yet) decode flowset id 256 from source id 0, because no template to decode it with has been received. This message will usually go away after 1 minute.
```

You may also see a message similar to the following:

```
[2019-08-22T12:11:31,804][WARN ][logstash.codecs.netflow ] Unsupported field in template 258 {:type=>44999, :length=>32}
```

If these messages persist for more than 30 minutes (see note below to understand why you should wait this long), you may be experiencing this issue.

> NOTE: While this message says `will usually go away after 1 minute`, some flow exporters send templates very infrequently. Fortinet devices come particularly to mind, sometimes taking 15 minutes or more to send a template.

### AFFECTED RECORDS

This issue can affect Netflow v9 and IPFIX flow records.

### DESCRIPTION

The flow collecter will not be able to decode incoming Netflow v9 or IPFIX flow records until is has received a template from the exporter which describes the structure of those records. For this reason, you may see a log message similar to that described above, for a few minutes after Logstash has been started with the ElastiFlow&trade; pipeline.

If the template received from the exporter refers to an Information Element (IE)/field that is not known to the Logstash Netflow CODEC, it will silently discard the template and these messages will persist.

ElastiFlow&trade; leverages its own custom IE definitions, which I believe to be the most comprehensive IE support available compared to any other Netflow or IPFIX solution on GitHub. However, there are a lot of flow source types out there, so sometimes a user encounters an unsupported IE.

### WORKAROUND/SOLUTION

Unfortunately there is no workaround for this issue. However, adding support for new IEs is typically a trivial matter. To add support for the IEs, I require the following...

* A PCAP of the flow records, including the template records.
* Any documentation (usually from the vendor) which describes the IEs

If you can provide this information, I will do my best to turnaround a patch release, or sned you the fix directly.

## 3. Reverse proxy (or small Kibana max payload size) can prevent Kibana dashboard import

### SYMPTOM

The Kibana Saved Objects (dashboards and configuration) import fails.

### DESCRIPTION

The Kibana Saved Objects file is relatively large. Additionally the original JSON import method was slow. Both of these characteristics can cause problems if a Kibana is behind a reverse proxy.

Many reverse proxies have relatively low values for the session timeout and maximum body size. For example NGiNX defaults for these values are 60 seconds and 1MB, respectively.

### SOLUTION

Using NGiNX as an example. The following parameters should be modified:

* `proxy_read_timeout` should be set to `180s`, or even `300s`
* `client_max_body_size` should be set to `8388608`

Additionally in Kibana, `server.maxPayloadBytes` (or `SERVER_MAXPAYLOADBYTES` if using Docker) should also be set to `8388608`.

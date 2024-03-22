# ElastiFlow&trade; Change Log

---

## v4.0.1

> **WARNING!** - If you are using a 3.x or earlier release, please refer to the v4.0.0 Breaking Changes.

ElastiFlow v4.0.1 is a minor release. No migration of data from v4.0.0 to v4.0.1 is required.

### Updates

* Update IP reputation dictionary

### Fixes

* Netflow v5 sources reporting zero bytes and packets in ECS fields has been fixed.
* TSVB visualizations displaying data in bits/s now use the new `bitd` custom formatter.

---

## v4.0.0

> **WARNING!** - ElastiFlow v4.0.0 is a major release, and now supports Elastic Common Schema (ECS). Due to significant data model changes there is no upgrade/migration from ElastiFlow 3.x. You should either remove all 3.x indices or deploy ElastiFlow 4.0.0 to a separate environment.

### Breaking Changes

ElastiFlow v4.0.0 is built for Elasticsearch and Kibana 7.8.1 and later. No earlier versions will be supported. Please use a prior ElastiFlow release if you cannot yet upgrade to Elastic Stack 7.8.1+.

ElastiFlow v4.0.0 takes advantage of X-Pack Basic features, such as the Maps, SIEM and Logs apps, as well as Index Lifecycle Management (ILM). This means that you must use at least the X-Pack Basic licensed release of the Elastic Stack. The pure Apache 2.0 licensed release of the Elastic Stack will not work without disabling many features.

### New Features

* Data model has changed to leverage ECS 1.5.
* Flow data can now be analyzed using the Kibana SIEM and Log apps.
* Optional resolution of MAC OUIs to vendor names (disabled by default).
* Kibana dark theme is now supported.
* Geo IP dashboards now leverage the new Kibana Maps app.
* Applications can now be defined manually by IP address and port number.
* Palo Alto virtual interface indexes are translated to interfaces names.
* Support for VeloCloud, Calix and various Cisco SD-WAN information elements.
* KQL is now default

### Updates

* Pipeline refactored to simplify various logic, which might improve performance and throughput for some users.
* YAML dictionaries intended for customization by users have been moved to the `logstash/elastiflow/user_settings` path.
* Update IP reputation dictionary

### Fixes

* Client/Server detection using TCP flags is improved.

---

## v4.0.0-beta1

v4.0.0 is a major release. A data migration will be required if you want to have your older data available in 4.0.0. This `BETA` release does not yet include a migration method and is intended for testing with new flow data only.

### Breaking Changes

ElastiFlow v4.0.0 is built for Elasticsearch and Kibana 7.5.0 and later. No earlier versions will be supported. Please use a prior ElastiFlow release if you cannot yet upgrade to Elastic Stack 7.5.x.

ElasiFlow v4.0.0 takes advantage of X-Pack Basic features, such as the Maps, SIEM and Logs apps, as well as Index Lifecycle Management (ILM). This means that you must use at least the X-Pack Basic licensed release of the Elastic Stack. The pure Apache 2.0 licensed release of the Elastic Stack will not work without disabling many features.

### New Features

* Data model has changed to leverage ECS 1.4.
* Flow data can now be analyzed using the Kibana SIEM and Log apps.
* Optional resolution of MAC OUIs to vendor names (disabled by default).
* Kibana dark theme is now supported.
* Geo IP dashboards now leveage the new Kibana Maps app.
* Applications can now be defined manually by IP address and port number.
* Palo Alto virtual interface indexes are translated to interfaces names.

### Updates

* Pipeline refactored to simplify various logic, which might improve performance and throughput for some users.
* YAML dictionaries intended for customization by users have been moved to the `logstash/elastiflow/user_settings` path.

---

## v3.5.3

v3.5.3 is a minor release. No migration of data from v3.5.x to v3.5.3 is required.

### Breaking Changes

ElastiFlow v3.5.x provides support Elastic Stack 7.x. The support for document types has been completely removed in Elasticsearch 7.0.0. This has required changes to the index templates provided with ElastiFlow. You _MUST_ first successfully upgrade to Elastic Stack 7.x _PRIOR_ to using ElastiFlow v3.5.3.

### New Features

* Added support for pmacct IEs (needed for VyOS 1.2.x).

---

## v3.5.2

v3.5.2 is a minor release. No migration of data from v3.5.1 to v3.5.2 is required.

### Breaking Changes

ElastiFlow v3.5.x provides support Elastic Stack 7.x. The support for document types has been completely removed in Elasticsearch 7.0.0. This has required changes to the index templates provided with ElastiFlow. You _MUST_ first successfully upgrade to Elastic Stack 7.x _PRIOR_ to using ElastiFlow v3.5.2.

### New Features

* Added normalization of WiFi-related Netflow v9 and IPFIX fields.
* The hostname where Logstash is running is provided in the field `logstash_host`.
* Added the ability to manually set flow sampling values for IPFIX.

### Fixes

* Fix Cisco vzFlow type for list fields.
* Fix Procera IEs incorrectly defined as `int`.

### Updates

* Improved the display of rate values in Vega visualizations.
* Added a lot of new Fortinet application IDs.
* Update IP reputation dictionary and GeoIP DBs.

---

## v3.5.1

v3.5.1 is a minor release. No migration of data from v3.5.0 to v3.5.1 is required.

### Breaking Changes

ElastiFlow v3.5.x provides support Elastic Stack 7.x. The support for document types has been completely removed in Elasticsearch 7.0.0. This has required changes to the index templates provided with ElastiFlow. You _MUST_ first successfully upgrade to Elastic Stack 7.x _PRIOR_ to using ElastiFlow v3.5.1.

### Fixes

* Updated environment variables in `docker-compose.yml`, which prevented the Kibana container from connecting to Elasticsearch.

### Updates

* Update IP reputation dictionary and GeoIP DBs
* Minor updates to README.md, CHANGELOG.md and DOCKER.md

---

## v3.5.0

v3.5.0 is a minor release. No migration of data from v3.4.x to v3.5.0 is required.

### Breaking Changes

ElastiFlow v3.5.0 provides support Elastic Stack 7.0.0. The support for document types has been completely removed in Elasticsearch 7.0.0. This has required changes to the index templates provided with ElastiFlow. You _MUST_ first successfully upgrade to Elastic Stack 7.0.x _PRIOR_ to using ElastiFlow v3.5.0.

### New Features

* Support for Elastic Stack 7.0.x

### Updates

* Dashboard tweaks for Kibana 7.0.x.

---

## v3.4.2

v3.4.2 is a minor release. No migration of data from v3.4.1 to v3.4.2 is required.

### Breaking Changes

If you are upgrading from a release prior to 3.4.0, see the Breaking Changes notice for v3.4.0 below.

### New Features

* Added support for Cisco AVC flow records (normalized to ElastiFlow schema)
* Determine client/server based on SYN+RST TCP flags
* Support for Elastic Stack 6.7.x

### Updates

* Added A LOT of new Fortinet App IDs
* Index Pattern now includes all fields from codec definitions
* Updated GeoLite2-City and GeoLite2-ASN DBs
* Updated IP Reputation dictionary

### Fixes

* Numerous index template fixes
* Removed duplicate TCP service names
* Fixed instances of double close brackets

---

## v3.4.1

v3.4.1 is a minor release. No migration of data from v3.4.0 to v3.4.1 is required.

### Breaking Changes

If you are upgrading from a release prior to 3.4.0, see the Breaking Changes notice for v3.4.0 below.

### New Features

* Added Docker support

### Updates

* Updated GeoLite2-City and GeoLite2-ASN DBs
* Updated IP Reputation dictionary

### Fixes

* Netflow application id regression. Now uses field `netflow.app_id`.

---

## v3.4.0

### Breaking Changes

v3.4.0 adds custom field definitions for the Netflow codec. While greatly expanding the number of supported vendor-specific fields, many existing vendor-specific fields have been renamed. The ElastiFlow dashboards in previous releases were based on its normalized `flow` schema, or other standard Netflow and IPFIX fields, all of which are unchanged. However it may be necessary to update any Dashboards you created for the old vendor-specific field names to use the new names.

### New Features

* Add a new Threats dashboard, based on IP reputation tags
* Netflow and IPFIX now default to included field definitions
* Provide a `sysctl.d` file to set `net.core.rmem_max`
* Added application ID support for Sophos, Sonicwall, Citrix Netscaler, IXIA IxFlow and Palo Alto
* Added support for Ziften ZFlow IPFIX host agents
* Added enrichment of enumerated values for many vendor-specific fields.

### Updates

* Updated GeoLite2-City and GeoLite2-ASN DBs
* Updated IP Reputation dictionary
* Set all `translate` filters to use the new option `refresh_behaviour`, setting it to `replace`
* Updated FortiOS 5.6 Application IDs
* Disabled name lookups for connections to the `tcp` input
* Kibana index pattern now contains many new vendor-specific fields

---

## v3.3.0

v3.3.0 is a minor release. No migration of data from v3.0.x or later to v3.3.0 is required.

### New Features

* Sample interval can be manually set if not sent by the device.
* DNS resolution of IP addresses can be enabled for only exporters, endpoints or both.
* Split docs into `README.md` and `INSTALL.md`.
* Removed `sflow.size_header`.

### Updates

* Updated GeoLite2-City and GeoLite2-ASN DBs
* Updated IP Reputation dictionary
* Added field 99 to `netflow.yml` definitions

---

## v3.2.3

v3.2.3 is a maintenance release. No migration of data from v3.0.x or later to v3.2.3 is required.

### New Features

* Support for Kibana 6.4.
* Support for additional sFlow fields, including TCP Flags.
* Added an IP reputation whitelist dictionary.
* Added a CHANGELOG.md which documents all changes since v1.0.0.

### Fixes

* Minor dashboard tweaks.
* Fixed document/index name version inconsistency.

### Updates

* Updated GeoLite2-ASN DB
* Updated service name dictionary.
* Updated IP Reputation dictionary.

---

## v3.2.2

v3.2.2 is a maintenance release. No migration of data from v3.0.x or later to v3.2.2 is required.

### Fixes

* Minor changes to README.md.

### Updates

* Added additional Riverbed fields to netflow.yml.
* Updated GeoLite2-ASN DB
* Updated GeoLite2-City DB
* Updated IP Reputation Dictionary

---

## v3.2.1

v3.2.1 is a minor release. No migration of data from v3.0.x or later to v3.2.1 is required.

### Fixes

* Well v3.2.0 was short lived! Found a bug related to the enrichment of Riverbed port numbers that I wanted to fix quickly.

---

## v3.2.0

v3.2.0 is a minor release. No migration of data from v3.0.x or v3.1.0 to v3.2.0 is required.

### New Features

* Add a multi-server output option.
* Add support for RiverBed WAN Optimizers using a custom Netflow field definitions file.
* Consider SYN-only TCP Flags when determining client/server.
* Provide the option to lookup interface names from a YAML dictionary.
* Add the ability to set the UDP receive buffer via an environment variable.

### Updates

* Cleanup of NBAR2 application IDs.
* Update GeoIP DBs.
* Update ASN DB.

---

## v3.1.0

v3.1.0 is a minor release. No migration of data from v3.0.x to v3.1.0 is required.

### New Features

* Added country_code related fields.
* Normalized IPFIX NAT-related fields.
* Added a configurable default value of App ID source type.
* Added option for SSL connection to Elasticsearch.
* Added support for App IDs from v4.x of the Netflow codec. Compatibility with v3.x is maintained.
* Dashboards optimized for Kibana 6.3. (separate import file for 6.2 is also available)

---

## v3.0.3

v3.0.3 is a maintenance release. No migration of data from v3.0.x to v3.0.3 is required.

### New Features

* Added support for nDPI detected application names sent via Netflow from nProbe. A configuration file for nProbe, which works well with ElastiFlow™, is available [HERE](https://gist.github.com/robcowart/afd538026db29ee96dd9c495efb52ea6).

---

## v3.0.2

v3.0.2 is a maintenance release. No migration of data from v3.0.0/v3.0.1 to v3.0.2 is required.

### Updates

* Updated IP Reputation Dictionary

---

## v3.0.1

v3.0.1 is a maintenance release. No migration of data from v3.0.0 to v3.0.1 is required.

### New Features

* Added field formatters to the Index Pattern to launch external URLs for IP addresses (www.talosintelligence.com/reputation_center/), Autonomous System Numbers (http://viewdns.info/asnlookup/) and Ports (http://www.adminsub.net/tcp-udp-port-finder/).
* Added recommended Kibana settings to README.md.

### Fixes

* Fixed a few errors in README.md.
* Ignore application_id of 0:0.

### Updates

* Updated GeoLite2-ASN DB
* Updated IP Reputation Dictionary

---

## v3.0.0

### New Features

* Dashboards have been rebuilt to leverage features added since the release of Kibana 6.x. This includes the addition of experimental dashboards which leverage the new Vega visualization.
* The schema was refactored to minimize the volume of data stored and increase the efficiency of processing. The result is a reduction of storage requirements by 20-30%, and better throughput.
* IP reputation tagging has been added to assist in the identification of suspect network traffic.
* Improved support for application identification data has been added for Cisco NBAR2 and Fortinet.
* Added support for simultaneous collection over IPv4 and IPv6 on separate interfaces.
* Versioning has been added for indices and index templates. This will make it possible in the future to create reindexing methods for the migration of historical data to newer versions.
* GeoIP and ASN lookups can now be enabled/disabled using an environment variable. Users who don't need these capabilities will be able to disable them, saving disk space and increasing processing efficiency.
* Index mappings were modified to more gracefully handle various vendor-specific flow field implementations.

### Fixes

* Fixed a regression related to the field type of various IPFIX date fields.

---

## v2.1.0

### New Features

* Added support for flow proxies, such as nProbe, which populate the exporterIPv4Address or exporterIPv6Address fields with the IP of the device from which the flow originated. This applies to both Netflow v9 and IPFIX flow types.

### New Features

* Added the option to remove fields from the original flow records to save storage space. This is done by setting the environment variable ELASTIFLOW_KEEP_ORIG_DATA to false (default is true). The result of setting this to false is that the netflow, ipfix and sflow objects will be removed prior to sending the data to Elasticsearch. This has no adverse affect on the provided dashboards, as they they are populated from the normalized flow object. However the original flow fields will no longer be available if they are desired for additional analytics.

### Updates

* Updated MaxMind GeoLite2 DBs to those released 6 Feb 2018.

---

## v2.0.0

ElastiFlow™ 2.0.0 is a major release which adds support for IPFIX and sFlow, in addition to Netflow v5 and v9.

### New Features

* Support added for IPFIX (#34)
* Support added for sFlow (#26)
* Index name changed from netflow to elastiflow.
* All flow types are normalized under the flow object (previously Netflow v5 and v9 were normalized to a netflow object), but all original data is retained.
* Reworked Top-N dashboards. Now includes Top Talkers, Top Services and Top Conversations (replace old Conversations dashboard).
* Reworked Geo Location dashboards. Now includes client/server and source/destination perspectives.
* Autonomous System dashboard updated to simplify analysis of traffic to/from Autonomous Systems.
* Changed most timelion graphs to display bit/s instead of bytes/s (requested by a number of users)
* Index Pattern now imported via Kibana API. (see README.md)

### Fixes

* Change netflow.conn_id to a long (#33)

### Updates

* License updated.

---

## v1.2.0

This release has been tested with Elastic Stack versions 5.4.3, 5.5.3, 5.6.5 and 6.0.1. It will also work with 6.1.0 and 6.1.1, however due to issues with Kibana visualization scaling (see elastic/kibana#15594) I cannot yet recommend users making a move 6.1.x.

* Modified index templates to support Elasticsearch 6.0. (#20)
* Improved support for bi-directional flows to better handle flows from devices such as Cisco ASA. (#29)
* Changed application_id to a keyword to better handle flows from devices such as Fortinet devices. (#14)
* Improved presentation of units for traffic volume (e.g. 100KB/s instead of 100000) in Timelion charts. (#24)

---

## v1.1.2

* Fixed the if statement that controls conditions when geoip_dst.autonomous_system is set. Thanks to @vpiserchia for contributing the PR.
* Modified the index template to use "codec": "best_compression" to reduce storage capacity requirements.

---

## v1.1.1

* Fixed destination port normalization in case of UDP. Thanks to @vpiserchia for contributing the PR.

---

## v1.1.0

* Enhanced with basic determination of client, server and service from the source and destination addresses and ports.
* Dashboards updated to use client/server instead of source/destination.
* Conversation Partners dashboard replaced by the Conversations dashboard.
* Updated GeoLite City and ASN databases.
* Corrected a problem where geoip.autonomous_system was not always set.

---

## v1.0.0

Developed and tested with Elastic Stack 5.5.0 and 5.5.1.

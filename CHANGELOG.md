## v3.2.3
v3.2.3 is a maintenance release. No migration of data from v3.0.x or later to v3.2.3 is required.

### New Features
- Support for Kibana 6.4.
- Support for additional sFlow fields, including TCP Flags.
- Added an IP reputation whitelist dictiinary.
- Added a CHANGELOG.md which documents all changes since v1.0.0.

### Fixes
- Minor dashboard tweaks.
- Fixed document/index name version inconsistency.

### Updates
- Updated GeoLite2-ASN DB
- Updated service name dictionary.
- Updated IP Reputation dictionary.

---
## v3.2.2
v3.2.2 is a maintenance release. No migration of data from v3.0.x or later to v3.2.2 is required.

### Fixes
- Minor changes to README.md.

### Updates
- Added additional Riverbed fields to netflow.yml.
- Updated GeoLite2-ASN DB
- Updated GeoLite2-City DB
- Updated IP Reputation Dictionary

---
## v3.2.1
v3.2.1 is a minor release. No migration of data from v3.0.x or later to v3.2.1 is required.

### Fixes
- Well v3.2.0 was short lived! Found a bug related to the enrichment of Riverbed port numbers that I wanted to fix quickly.

---
## v3.2.0
v3.2.0 is a minor release. No migration of data from v3.0.x or v3.1.0 to v3.2.0 is required.

### New Features
- Add a multi-server output option.
- Add support for RiverBed WAN Optimizers using a custom Netflow field definitions file.
- Consider SYN-only TCP Flags when determining client/server.
- Provide the option to lookup interface names from a YAML dictionary.
- Add the ability to set the UDP receive buffer via an environment variable.

### Updates
- Cleanup of NBAR2 application IDs.
- Update GeoIP DBs.
- Update ASN DB.

---
## v3.1.0
v3.1.0 is a minor release. No migration of data from v3.0.x to v3.1.0 is required.

### New Features
- Added country_code related fields.
- Normalized IPFIX NAT-related fields.
- Added a configurable default value of App ID source type.
- Added option for SSL connection to Elasticsearch.
- Added support for App IDs from v4.x of the Netflow codec. Compatibility with v3.x is maintained.
- Dashboards optimized for Kibana 6.3. (separate import file for 6.2 is also available)

---
## v3.0.3
v3.0.3 is a maintenance release. No migration of data from v3.0.x to v3.0.3 is required.

### New Features
- Added support for nDPI detected application names sent via Netflow from nProbe. A configuration file for nProbe, which works well with ElastiFlow™, is available [HERE](https://gist.github.com/robcowart/afd538026db29ee96dd9c495efb52ea6).

---
## v3.0.2
v3.0.2 is a maintenance release. No migration of data from v3.0.0/v3.0.1 to v3.0.2 is required.

### Updates
- Updated IP Reputation Dictionary

---
## v3.0.1
v3.0.1 is a maintenance release. No migration of data from v3.0.0 to v3.0.1 is required.

### New Features
- Added field formatters to the Index Pattern to launch external URLs for IP addresses (www.talosintelligence.com/reputation_center/), Autonomous System Numbers (http://viewdns.info/asnlookup/) and Ports (http://www.adminsub.net/tcp-udp-port-finder/).
- Added recommended Kibana settings to README.md.

### Fixes
- Fixed a few errors in README.md.
- Ignore application_id of 0:0.

### Updates
- Updated GeoLite2-ASN DB
- Updated IP Reputation Dictionary

---
## v3.0.0
### New Features
- Dashboards have been rebuilt to leverage features added since the release of Kibana 6.x. This includes the addition of experimental dashboards which leverage the new Vega visualization.
- The schema was refactored to minimize the volume of data stored and increase the efficiency of processing. The result is a reduction of storage requirements by 20-30%, and better throughput.
- IP reputation tagging has been added to assist in the identification of suspect network traffic.
- Improved support for application identification data has been added for Cisco NBAR2 and Fortinet.
- Added support for simultaneous collection over IPv4 and IPv6 on separate interfaces.
- Versioning has been added for indices and index templates. This will make it possible in the future to create reindexing methods for the migration of historical data to newer versions.
- GeoIP and ASN lookups can now be enabled/disabled using an environment variable. Users who don't need these capabilities will be able to disable them, saving disk space and increasing processing efficiency.
- Index mappings were modified to more gracefully handle various vendor-specific flow field implementations.

### Fixes
- Fixed a regression related to the field type of various IPFIX date fields.

---
## v2.1.0
### New Features
- Added support for flow proxies, such as nProbe, which populate the exporterIPv4Address or exporterIPv6Address fields with the IP of the device from which the flow originated. This applies to both Netflow v9 and IPFIX flow types.
### New Features
- Added the option to remove fields from the original flow records to save storage space. This is done by setting the environment variable ELASTIFLOW_KEEP_ORIG_DATA to false (default is true). The result of setting this to false is that the netflow, ipfix and sflow objects will be removed prior to sending the data to Elasticsearch. This has no adverse affect on the provided dashboards, as they they are populated from the normalized flow object. However the original flow fields will no longer be available if they are desired for additional analytics.

### Updates
- Updated MaxMind GeoLite2 DBs to those released 6 Feb 2018.

---
## v2.0.0
ElastiFlow™ 2.0.0 is a major release which adds support for IPFIX and sFlow, in addition to Netflow v5 and v9.

### New Features
- Support added for IPFIX (#34)
- Support added for sFlow (#26)
- Index name changed from netflow to elastiflow.
- All flow types are normalized under the flow object (previously Netflow v5 and v9 were normalized to a netflow object), but all original data is retained.
- Reworked Top-N dashboards. Now includes Top Talkers, Top Services and Top Conversations (replace old Conversations dashboard).
- Reworked Geo Location dashboards. Now includes client/server and source/destination perspectives.
- Autonomous System dashboard updated to simplify analysis of traffic to/from Autonomous Systems.
- Changed most timelion graphs to display bit/s instead of bytes/s (requested by a number of users)
- Index Pattern now imported via Kibana API. (see README.md)

### Fixes
- Change netflow.conn_id to a long (#33)

### Updates
- License updated.

---
## v1.2.0
This release has been tested with Elastic Stack versions 5.4.3, 5.5.3, 5.6.5 and 6.0.1. It will also work with 6.1.0 and 6.1.1, however due to issues with Kibana visualization scaling (see elastic/kibana#15594) I cannot yet recommend users making a move 6.1.x.
- Modified index templates to support Elasticsearch 6.0. (#20)
- Improved support for bi-directional flows to better handle flows from devices such as Cisco ASA. (#29)
- Changed application_id to a keyword to better handle flows from devices such as Fortinet devices. (#14)
- Improved presentation of units for traffic volume (e.g. 100KB/s instead of 100000) in Timelion charts. (#24)

---
## v1.1.2
- Fixed the if statement that controls conditions when geoip_dst.autonomous_system is set. Thanks to @vpiserchia for contributing the PR.
- Modified the index template to use "codec": "best_compression" to reduce storage capacity requirements.

---
## v1.1.1
- Fixed destination port normalization in case of UDP. Thanks to @vpiserchia for contributing the PR.

---
## v1.1.0
- Enhanced with basic determination of client, server and service from the source and destination addresses and ports.
- Dashboards updated to use client/server instead of source/destination.
- Conversation Partners dashboard replaced by the Conversations dashboard.
- Updated GeoLite City and ASN databases.
- Corrected a problem where geoip.autonomous_system was not always set.

---
## v1.0.0
Developed and tested with Elastic Stack 5.5.0 and 5.5.1.

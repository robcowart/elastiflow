#------------------------------------------------------------------------------
# Copyright (C)2020 Robert Cowart
# 
# The contents of this file and/or repository are subject to the Robert Cowart
# Public License (the "License") and may not be used or distributed except in
# compliance with the License. You may obtain a copy of the License at:
# 
# http://www.koiossian.com/public/robert_cowart_public_license.txt
# 
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
# 
# The Original Source Code was developed by Robert Cowart. Portions created by
# Robert Cowart are Copyright (C)2020 Robert Cowart. All Rights Reserved.
#------------------------------------------------------------------------------

# ElastiFlow global configuration
export ELASTIFLOW_AGENT_ID=elastiflow
export ELASTIFLOW_DICT_PATH=/etc/logstash/elastiflow/dictionaries
export ELASTIFLOW_USER_SETTINGS_PATH=/etc/logstash/elastiflow/user_settings
export ELASTIFLOW_DEFINITION_PATH=/etc/logstash/elastiflow/definitions
export ELASTIFLOW_TEMPLATE_PATH=/etc/logstash/elastiflow/templates
export ELASTIFLOW_GEOIP_DB_PATH=/etc/logstash/elastiflow/geoipdbs
export ELASTIFLOW_GEOIP_CACHE_SIZE=8192
export ELASTIFLOW_GEOIP_LOOKUP=true
export ELASTIFLOW_ASN_LOOKUP=true
export ELASTIFLOW_OUI_LOOKUP=false
export ELASTIFLOW_POPULATE_LOGS=true
export ELASTIFLOW_KEEP_ORIG_DATA=true
export ELASTIFLOW_DEFAULT_APPID_SRCTYPE=__UNKNOWN

# Name resolution option
export ELASTIFLOW_RESOLVE_IP2HOST=false
export ELASTIFLOW_NAMESERVER=127.0.0.1
export ELASTIFLOW_DNS_HIT_CACHE_SIZE=25000
export ELASTIFLOW_DNS_HIT_CACHE_TTL=900
export ELASTIFLOW_DNS_FAILED_CACHE_SIZE=75000
export ELASTIFLOW_DNS_FAILED_CACHE_TTL=3600


# Elasticsearch connection settings
export ELASTIFLOW_ES_USER=elastic
export ELASTIFLOW_ES_PASSWD=changeme

# If you need Logstash to connect to only one Elasticsearch server, use the following environment variable.
export ELASTIFLOW_ES_HOST=127.0.0.1:9200

# If you need Logstash to connect to one of an array of three Elasticsearch servers, use the following environment variables.
# It is also necessary to rename the output files to disable single node output, and enable multi-node.
export ELASTIFLOW_ES_HOST_1=127.0.0.1:9200
export ELASTIFLOW_ES_HOST_2=127.0.0.2:9200
export ELASTIFLOW_ES_HOST_3=127.0.0.3:9200

# If ELASTIFLOW_ES_SSL_VERIFY is true then you must edit the output and set the path where the cacert can be found.
export ELASTIFLOW_ES_SSL_ENABLE=false
export ELASTIFLOW_ES_SSL_VERIFY=false


# Netflow - IPv4
export ELASTIFLOW_NETFLOW_IPV4_HOST=0.0.0.0
export ELASTIFLOW_NETFLOW_IPV4_PORT=2055
# Netflow - IPv6
export ELASTIFLOW_NETFLOW_IPV6_HOST=[::]
export ELASTIFLOW_NETFLOW_IPV6_PORT=52055
# Netflow - UDP input options
export ELASTIFLOW_NETFLOW_UDP_WORKERS=4
export ELASTIFLOW_NETFLOW_UDP_QUEUE_SIZE=4096
export ELASTIFLOW_NETFLOW_UDP_RCV_BUFF=33554432
# Netflow timestamp options
export ELASTIFLOW_NETFLOW_TZ=UTC


# sFlow - IPv4
export ELASTIFLOW_SFLOW_IPV4_HOST=0.0.0.0
export ELASTIFLOW_SFLOW_IPV4_PORT=6343
# sFlow - IPv6
export ELASTIFLOW_SFLOW_IPV6_HOST=[::]
export ELASTIFLOW_SFLOW_IPV6_PORT=56343
# sFlow - UDP input options
export ELASTIFLOW_SFLOW_UDP_WORKERS=4
export ELASTIFLOW_SFLOW_UDP_QUEUE_SIZE=4096
export ELASTIFLOW_SFLOW_UDP_RCV_BUFF=33554432


# IPFIX - IPv4
export ELASTIFLOW_IPFIX_TCP_IPV4_HOST=0.0.0.0
export ELASTIFLOW_IPFIX_TCP_IPV4_PORT=4739
export ELASTIFLOW_IPFIX_UDP_IPV4_HOST=0.0.0.0
export ELASTIFLOW_IPFIX_UDP_IPV4_PORT=4739
# IPFIX - IPv6
export ELASTIFLOW_IPFIX_TCP_IPV6_HOST=[::]
export ELASTIFLOW_IPFIX_TCP_IPV6_PORT=54739
export ELASTIFLOW_IPFIX_UDP_IPV6_HOST=[::]
export ELASTIFLOW_IPFIX_UDP_IPV6_PORT=54739
# IPFIX - UDP input options
export ELASTIFLOW_IPFIX_UDP_WORKERS=4
export ELASTIFLOW_IPFIX_UDP_QUEUE_SIZE=4096
export ELASTIFLOW_IPFIX_UDP_RCV_BUFF=33554432

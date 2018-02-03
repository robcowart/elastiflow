#------------------------------------------------------------------------------
# The contents of this file and/or repository are subject to the Koiossian
# Public License (the "License") and may not be used or distributed except in
# compliance with the License. You may obtain a copy of the License at:
#
# http://www.koiossian.com/public/koiossian_public_license.txt
#
# Software distributed under the License is distributed on an "AS IS" basis,
# WITHOUT WARRANTY OF ANY KIND, either express or implied. See the License for
# the specific language governing rights and limitations under the License.
#
# The Original Source Code was developed by Koiossian. Portions created by
# Koiossian are Copyright (C)2018 Koiossian. All Rights Reserved.
#------------------------------------------------------------------------------

# ElastiFlow
export ELASTIFLOW_GEOIP_DB_PATH=/etc/logstash/elastiflow/geoipdbs
export ELASTIFLOW_DICT_PATH=/etc/logstash/elastiflow/dictionaries
export ELASTIFLOW_TEMPLATE_PATH=/etc/logstash/elastiflow/templates

export ELASTIFLOW_RESOLVE_IP2HOST=false
export ELASTIFLOW_NAMESERVER=127.0.0.1

export ELASTIFLOW_ES_HOST=127.0.0.1
export ELASTIFLOW_ES_USER=elastic
export ELASTIFLOW_ES_PASSWD=changeme

export ELASTIFLOW_NETFLOW_HOST=0.0.0.0
export ELASTIFLOW_NETFLOW_PORT=2055
export ELASTIFLOW_NETFLOW_LASTSW_TIMESTAMP=false
export ELASTIFLOW_NETFLOW_TZ=UTC

export ELASTIFLOW_SFLOW_HOST=0.0.0.0
export ELASTIFLOW_SFLOW_PORT=6343

export ELASTIFLOW_IPFIX_TCP_HOST=0.0.0.0
export ELASTIFLOW_IPFIX_TCP_PORT=4739
export ELASTIFLOW_IPFIX_UDP_HOST=0.0.0.0
export ELASTIFLOW_IPFIX_UDP_PORT=4739
